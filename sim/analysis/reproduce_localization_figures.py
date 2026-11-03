from pathlib import Path
from pypdf import PdfReader
import numpy as np
import json, hashlib, re
ROOT=Path(__file__).resolve().parents[2]
import argparse
parser=argparse.ArgumentParser(description='Recompute figures 37-45 directly from the supplied 360-point PDF')
parser.add_argument('--output-dir', type=Path, required=True)
parser.add_argument('--stats-only', action='store_true', help='Compute PDF-derived statistics without drawing images')
args=parser.parse_args()
WORK=args.output_dir.resolve()
if WORK == ROOT or ROOT in WORK.parents:
    parser.error('Output directory must be outside the submission directory')
WORK.mkdir(parents=True, exist_ok=True)
PDF=ROOT/'data/measured_localization/localization_360_points.pdf'
rows=[]
for k,page in enumerate(PdfReader(PDF).pages):
    lines=[s.strip() for s in page.extract_text().splitlines() if s.strip()]
    start=lines.index(str(k*30+1)); vals=lines[start:start+420]
    assert len(vals)==420
    for j in range(30):
        a=vals[j*14:(j+1)*14]
        assert int(a[0])==len(rows)+1
        rows.append(dict(id=int(a[0]),pdf_page=k+1,reference_xyz_m=list(map(float,a[1:4])),array_xyz_m=list(map(float,a[6:9])),reported_angle=float(a[12]),reported_distance=float(a[13])))
P=np.array([r['reference_xyz_m'] for r in rows]); Q=np.array([r['array_xyz_m'] for r in rows]); ids=np.arange(1,361)
assert len(rows)==360 and np.isfinite(P).all() and np.isfinite(Q).all()
archived=json.loads((ROOT/'data/measured_localization/localization_360_points.json').read_text('utf-8'))
assert len(archived)==360
for a,b in zip(rows,archived):
    for key in ['id','pdf_page','reference_xyz_m','array_xyz_m']:
        assert a[key]==b[key], (a['id'],key)
d=np.linalg.norm(P,axis=1); dist=np.linalg.norm(Q-P,axis=1)
angle=np.rad2deg(np.arccos(np.clip((P*Q).sum(1)/(np.linalg.norm(P,axis=1)*np.linalg.norm(Q,axis=1)),-1,1)))
dz=np.abs(Q[:,2]-P[:,2]); radii=np.array([1,3,5,7,9,11]); rho=radii[np.abs(np.linalg.norm(P[:,:2],axis=1)[:,None]-radii).argmin(1)]
assert np.max(np.abs(dist-[r['reported_distance'] for r in rows]))<.00051
assert np.max(np.abs(angle-[r['reported_angle'] for r in rows]))<.0051
q1,q3=np.quantile(dist,[.25,.75]); fence=q3+1.5*(q3-q1); broad=dist>fence
bins=[]
for lo,hi in zip(range(0,16,2),range(2,18,2)):
    m=(d>=lo)&(d<hi)
    bins.append(dict(lo=lo,hi=hi,n=int(m.sum()),mean_distance=float(d[m].mean()),angle_median=float(np.median(angle[m])),angle_q1=float(np.quantile(angle[m],.25)),angle_q3=float(np.quantile(angle[m],.75)),position_median=float(np.median(dist[m]))))
edges=[1,3,5,7,10.0001]; height_groups=[]
for i in range(4):
    for r in radii:
        m=(rho==r)&(P[:,2]>=edges[i])&(P[:,2]<edges[i+1])
        height_groups.append(dict(radius=int(r),lo=edges[i],hi=min(10,edges[i+1]),n=int(m.sum()),mae=float(dz[m].mean())))
stats=dict(source_pdf_sha256=hashlib.sha256(PDF.read_bytes()).hexdigest(),n=360,position_mean=float(dist.mean()),position_median=float(np.median(dist)),position_p95=float(np.quantile(dist,.95)),angle_median=float(np.median(angle)),height_mae=float(dz.mean()),height_group_min=min(x['mae'] for x in height_groups),height_group_max=max(x['mae'] for x in height_groups),q1=float(q1),q3=float(q3),fence=float(fence),marked_ids=ids[broad].tolist(),distance_bins=bins,height_groups=height_groups)
(WORK/'stats.json').write_text(json.dumps(stats,ensure_ascii=False,indent=2),encoding='utf-8')
(WORK/'pdf_rows.json').write_text(json.dumps(rows,ensure_ascii=False,indent=2),encoding='utf-8')
assert sum(g['n'] for g in height_groups)==sum(g['n'] for g in bins)==360
import csv
with (WORK/'point_metrics.csv').open('w',encoding='utf-8-sig',newline='') as f:
    writer=csv.writer(f)
    writer.writerow(['id','pdf_page','reference_x_m','reference_y_m','reference_z_m','output_x_m','output_y_m','output_z_m','reference_distance_m','horizontal_radius_group_m','position_error_m','angle_error_deg','height_absolute_error_m','marked'])
    for k,row in enumerate(rows):
        writer.writerow([row['id'],row['pdf_page'],*P[k],*Q[k],d[k],rho[k],dist[k],angle[k],dz[k],bool(broad[k])])
np.savez(WORK/'plot_data.npz',P=P,Q=Q,d=d,dist=dist,angle=angle,dz=dz,rho=rho,broad=broad,ids=ids)
print(json.dumps(stats,ensure_ascii=False,indent=2))
import runpy
if not args.stats_only:
    runpy.run_path(str(Path(__file__).with_name('plot_localization_figures.py')), init_globals={'OUTPUT_DIR':WORK})
