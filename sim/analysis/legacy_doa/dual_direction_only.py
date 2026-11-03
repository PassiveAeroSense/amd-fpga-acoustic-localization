"""Blind direction-only evaluation. No range search, xyz fit or target training.
Primary: 120-pair far-field SRP. Comparator: sum of 56 within-array SRP terms.
All estimates refer to the midpoint; near-field approximation is explicitly tested.
"""
from dual_localize import *
import csv
DOUT=Path('data/analysis/dual_direction_20261024');DOUT.mkdir(parents=True,exist_ok=True)
IDS={'joint_120':np.arange(120),'local_56':np.flatnonzero((PAIRS[:,0]//8)==(PAIRS[:,1]//8))}
TABLES={k:lookup(-U0@PAIRPOS[ids].T/C,ids,True) for k,ids in IDS.items()}

def unit(x):return np.asarray(x)/np.linalg.norm(x)
def angular(u,v):return np.degrees(np.arccos(np.clip(np.asarray(u)@np.asarray(v),-1,1)))

def estimate(g,method):
    ids=IDS[method];s=interpolate(g,ids,TABLES[method]);best=float(s.max());u=U0[s.argmax(),:2].copy()
    # The whole hemisphere is searched, then refined without nominal labels.
    for step in [.01,.003,.001,.0003,.0001]:
        for _ in range(15):
            cand=u+np.array([[0,0],[step,0],[-step,0],[0,step],[0,-step],[step,step],[-step,step],[step,-step],[-step,-step]])
            cand=cand[(cand*cand).sum(1)<=1]
            uv=np.column_stack((cand,np.sqrt(np.maximum(0,1-(cand*cand).sum(1)))))
            scores=interpolate(g,ids,lookup(-uv@PAIRPOS[ids].T/C,ids,True));k=scores.argmax()
            if scores[k]<=best+1e-10:break
            u=cand[k];best=float(scores[k])
    u=np.r_[u,np.sqrt(max(0,1-u@u))]
    far=angular(U0,u)>15
    competitor=float(np.max(s[far]))
    return dict(direction=u.tolist(),azimuth_deg=angles(u)[0],elevation_deg=angles(u)[1],score=best,
                alternative_peak_beyond15deg=competitor,relative_peak_margin=(best-competitor)/max(abs(best),1e-20))

def main():
    for u in [unit([.3,-.4,.8]),unit([.05,.02,1]),unit([.8,.4,.1])]:
        tau=-PAIRPOS@u/C-SCAN_DIFF
        g=np.exp(-.5*((LAGS[None,:]/(FS*IP)-tau[:,None])/12e-6)**2)
        for method in IDS:
            est=estimate(g,method);err=angular(est['direction'],u)
            # Linear GCC interpolation has finite 4.167 us delay spacing.
            assert err<1.,(method,err)
    rows=json.loads((OUT/'manifest.json').read_text(encoding='utf-8'))
    previous=json.loads((OUT/'notch_localization_results.json').read_text(encoding='utf-8'))
    result=[]
    for row in rows:
        i=row['id'];a=np.load(OUT/f'features_{i:02d}.npz');f=np.load(OUT/f'gcc_notch_{i:02d}.npz')
        assert str(f['source_sha256'])==row['sha256']
        g=f['gcc'];r=dict(id=i,file=row['file'],nominal_xyz_m=row['nominal_xyz_m'],kind=row['kind'],duration_s=row['duration_s'],methods={})
        for method in IDS:
            est=estimate(np.median(g,axis=0),method)
            frames=[dict(time_s=float(t),**estimate(gg,method)) for t,gg in zip(a['time_s'],g)]
            deviations=angular(np.array([q['direction'] for q in frames]),est['direction'])
            est['frame_spread_p50_deg']=float(np.median(deviations));est['frame_spread_p90_deg']=float(np.percentile(deviations,90));est['frames']=frames
            r['methods'][method]=est
        for ar in range(2):
            q=previous[i]['scan_corrected'];u=q['directions'][ar]
            r['methods'][f'array_{ar+1}']=dict(direction=u,azimuth_deg=q['angles_deg'][ar][0],elevation_deg=q['angles_deg'][ar][1])
        # Evaluation begins only AFTER every estimate has been obtained.
        nominal=row['nominal_xyz_m']
        if nominal is not None and all(v is not None for v in nominal):
            target=np.array(nominal);trueu=unit(target);trueang=angles(trueu)
            az_defined=bool(np.linalg.norm(target[:2])>1e-9)
            r.update(nominal_range_m=float(np.linalg.norm(target)),nominal_azimuth_deg=trueang[0] if az_defined else None,nominal_elevation_deg=trueang[1],azimuth_defined=az_defined)
            for name,est in r['methods'].items():
                actual=trueu if name in IDS else unit(target-CENTERS[int(name[-1])-1])
                actualang=angles(actual)
                est['direction_error_deg']=float(angular(est['direction'],actual))
                est['elevation_error_deg']=float(abs(est['elevation_deg']-actualang[1]))
                est['azimuth_error_deg']=float(abs((est['azimuth_deg']-actualang[0]+180)%360-180)) if name not in IDS or az_defined else None
                if name in IDS:
                    errors=angular(np.array([q['direction'] for q in est['frames']]),actual)
                    est['frame_error_p50_deg']=float(np.median(errors));est['frame_error_p90_deg']=float(np.percentile(errors,90))
                    est['fraction_frames_within15deg']=float(np.mean(errors<=15))
                    # Descriptive pass criteria, NOT a calibrated detector or training rule.
                    est['accuracy_stability_pass']=bool(est['direction_error_deg']<=10 and est['fraction_frames_within15deg']>=.8)
        result.append(r)
        (DOUT/'direction_results.json').write_text(json.dumps(result,ensure_ascii=False,indent=2),encoding='utf-8')
        print(i,row['file'],[(name,round(q['azimuth_deg'],1),round(q['elevation_deg'],1),round(q.get('direction_error_deg',-1),1),round(q.get('fraction_frames_within15deg',-1),2)) for name,q in r['methods'].items() if name in IDS],flush=True)
    bg=result[next(i for i,r in enumerate(rows) if r['kind']=='background')]
    for r in result:
        for name in IDS:
            r['methods'][name]['score_to_background_ratio']=r['methods'][name]['score']/bg['methods'][name]['score']
    (DOUT/'direction_results.json').write_text(json.dumps(result,ensure_ascii=False,indent=2),encoding='utf-8')
    flat=[]
    for r in result:
        for name,q in r['methods'].items():
            flat.append(dict(number=r['id']+1,file=r['file'],method=name,nominal_range_m=r.get('nominal_range_m'),nominal_azimuth_deg=r.get('nominal_azimuth_deg'),nominal_elevation_deg=r.get('nominal_elevation_deg'),
                azimuth_deg=q['azimuth_deg'],elevation_deg=q['elevation_deg'],direction_error_deg=q.get('direction_error_deg'),azimuth_error_deg=q.get('azimuth_error_deg'),elevation_error_deg=q.get('elevation_error_deg'),
                fraction_frames_within15deg=q.get('fraction_frames_within15deg'),frame_spread_p90_deg=q.get('frame_spread_p90_deg'),score_to_background_ratio=q.get('score_to_background_ratio'),
                relative_peak_margin=q.get('relative_peak_margin'),accuracy_stability_pass=q.get('accuracy_stability_pass')))
    with (DOUT/'双阵列测向_逐录音对照.csv').open('w',encoding='utf-8-sig',newline='') as f:
        w=csv.DictWriter(f,fieldnames=flat[0]);w.writeheader();w.writerows(flat)

if __name__=='__main__':main()
