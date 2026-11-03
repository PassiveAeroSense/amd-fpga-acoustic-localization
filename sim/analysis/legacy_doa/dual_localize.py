"""Geometry-only SRP-PHAT TDOA, independent DOAs and spherical-wave xyz search."""
from dual_night import *

PAIRPOS=MICS[PAIRS[:,0]]-MICS[PAIRS[:,1]]
SCAN_DIFF=SCAN[PAIRS[:,0]]-SCAN[PAIRS[:,1]]
U0=np.stack(np.meshgrid(np.arange(-1,1.0001,.025),np.arange(-1,1.0001,.025)),axis=-1).reshape(-1,2)
U0=U0[(U0**2).sum(1)<=1+1e-10]
U0=np.column_stack((U0,np.sqrt(np.maximum(0,1-(U0**2).sum(1)))))
AZ,EL,RR=np.meshgrid(np.arange(0,360,10),np.arange(0,91,5),np.array([.2,.35,.5,.8,1.2,1.8,2.5,3.5,5,7,10,15,22,35,55,85,120,180,280,500]),indexing='ij')
COARSE=np.stack((np.cos(np.deg2rad(EL))*np.cos(np.deg2rad(AZ))*RR,np.cos(np.deg2rad(EL))*np.sin(np.deg2rad(AZ))*RR,np.sin(np.deg2rad(EL))*RR),axis=-1).reshape(-1,3)
COARSE=np.unique(COARSE.round(9),axis=0)

def lookup(tau,ids,scan):
    pos=(tau-(SCAN_DIFF[ids] if scan else 0))*FS*IP-LAGS[0]
    left=np.floor(pos).astype(np.int32);frac=(pos-left).astype(np.float32)
    assert left.min()>=0 and left.max()<len(LAGS)-1
    return left,frac

def interpolate(g,ids,table):
    left,frac=table
    gg=g[ids]
    v=gg[np.arange(len(ids))[None,:],left]*(1-frac)+gg[np.arange(len(ids))[None,:],left+1]*frac
    return v.mean(axis=1)

def spherical_table(points,scan=True):
    d=np.linalg.norm(points[:,None,:]-MICS[None,:,:],axis=2)
    tau=(d[:,PAIRS[:,0]]-d[:,PAIRS[:,1]])/C
    return lookup(tau,np.arange(len(PAIRS)),scan)

def local_setup(scan):
    tables=[]
    for a in range(2):
        ids=np.flatnonzero((PAIRS[:,0]>=a*8)&(PAIRS[:,1]<(a+1)*8))
        tables.append((ids,lookup(-U0@PAIRPOS[ids].T/C,ids,scan)))
    return tables

def doa(g,a,scan,tables):
    ids,table=tables[a];s=interpolate(g,ids,table)
    u=U0[s.argmax(),:2].copy();best=float(s.max())
    for step in [.01,.003,.001,.0003,.0001]:
        for _ in range(12):
            cand=u+np.array([[0,0],[step,0],[-step,0],[0,step],[0,-step],[step,step],[-step,step],[step,-step],[-step,-step]])
            cand=cand[(cand*cand).sum(1)<=1]
            uv=np.column_stack((cand,np.sqrt(np.maximum(0,1-(cand*cand).sum(1)))))
            scores=interpolate(g,ids,lookup(-uv@PAIRPOS[ids].T/C,ids,scan));k=scores.argmax()
            if scores[k]<=best+1e-10:break
            u=cand[k];best=float(scores[k])
    v=np.r_[u,np.sqrt(max(0,1-u@u))]
    return v,best

def angles(u):return [float(np.degrees(np.arctan2(u[1],u[0]))%360),float(np.degrees(np.arcsin(np.clip(u[2],0,1))))]

def intersect(us):
    a=np.column_stack((us[0],-us[1]));r=np.linalg.lstsq(a,CENTERS[1]-CENTERS[0],rcond=None)[0]
    ends=CENTERS+r[:,None]*us;point=ends.mean(0)
    separation=float(np.degrees(np.arccos(np.clip(us[0]@us[1],-1,1))))
    valid=bool(np.all(r>0) and point[2]>0 and separation>.02)
    return dict(xyz_m=point.tolist() if valid else None,ray_gap_m=float(np.linalg.norm(ends[0]-ends[1])),ray_ranges_m=r.tolist(),ray_separation_deg=separation,valid=valid)

def refine_xyz(g,p,scan):
    p=np.array(p,float);best=float(interpolate(g,np.arange(120),spherical_table(p[None,:],scan))[0])
    for scale in [.2,.08,.03,.01,.003,.001,.0003]:
        for _ in range(16):
            step=max(.001,np.linalg.norm(p)*scale)
            cand=np.r_[p+np.r_[np.zeros((1,3)),np.eye(3)*step,-np.eye(3)*step],p[None,:]*(1+scale),p[None,:]*(1-scale)]
            cand=cand[(cand[:,2]>=0)&(np.linalg.norm(cand,axis=1)>=.1)&(np.linalg.norm(cand,axis=1)<=500)]
            scores=interpolate(g,np.arange(120),spherical_table(cand,scan));k=scores.argmax()
            if scores[k]<=best+1e-10:break
            p=cand[k];best=float(scores[k])
    return p,best

def joint(g,table,scan=True,extra=None,nseed=5):
    scores=interpolate(g,np.arange(120),table)
    ranked=np.argsort(scores)[::-1];seeds=[]
    for k in ranked:
        p=COARSE[k]
        if all(np.linalg.norm(p-q)>.15*max(.5,np.linalg.norm(p)) for q in seeds):seeds.append(p)
        if len(seeds)>=nseed:break
    if extra is not None and .1<=np.linalg.norm(extra)<500 and extra[2]>0:seeds.append(extra)
    results=[refine_xyz(g,p,scan) for p in seeds]
    point,score=max(results,key=lambda z:z[1])
    return dict(xyz_m=point.tolist(),score=score,range_m=float(np.linalg.norm(point)),boundary=bool(np.linalg.norm(point)>490 or point[2]<.001),candidates=[dict(xyz_m=p.tolist(),score=s) for p,s in results])

def safe(obj):
    if isinstance(obj,np.ndarray):return obj.tolist()
    if isinstance(obj,(np.floating,np.integer)):return obj.item()
    raise TypeError(type(obj))

def main():
    noise='--noise' in sys.argv
    notch='--notch' in sys.argv
    prefix='notch_' if notch else 'noise_' if noise else ''
    manifest=json.loads((OUT/'manifest.json').read_text(encoding='utf-8'))
    tables={s:local_setup(s) for s in (False,True)}
    sphere={s:spherical_table(COARSE,s) for s in (False,True)}
    # Sign/scan/geometry check with independent synthetic delays, not recording labels.
    synth=np.array([1.3,-2.2,3.1]);dist=np.linalg.norm(synth-MICS,axis=1)
    tau=(dist[PAIRS[:,0]]-dist[PAIRS[:,1]])/C-SCAN_DIFF
    testg=np.exp(-.5*((LAGS[None,:]/(FS*IP)-tau[:,None])/8e-6)**2)
    check=joint(testg,sphere[True],True,nseed=8)
    assert np.linalg.norm(np.array(check['xyz_m'])-synth)<.08,check
    print('Synthetic sign/scan/xyz check',check['xyz_m'],flush=True)
    results=[]
    for row in manifest:
        ident=row['id'];f=np.load(OUT/f'features_{ident:02d}.npz')
        assert str(f['source_sha256'])==row['sha256']
        g=np.load(OUT/f'gcc_{prefix}{ident:02d}.npz')['gcc'] if (noise or notch) else f['gcc'];mean=np.median(g,axis=0)
        r=dict(id=ident,file=row['file'],nominal_xyz_m=row['nominal_xyz_m'],kind=row['kind'],duration_s=row['duration_s'])
        for scan in (False,True):
            key='scan_corrected' if scan else 'uncorrected'
            us=np.array([doa(mean,a,scan,tables[scan])[0] for a in range(2)])
            tri=intersect(us);jj=joint(mean,sphere[scan],scan,tri['xyz_m'])
            r[key]=dict(directions=us.tolist(),angles_deg=[angles(u) for u in us],triangulation=tri,joint=jj)
        frames=[]
        for t,gg in zip(f['time_s'],g):
            us=np.array([doa(gg,a,True,tables[True])[0] for a in range(2)])
            tri=intersect(us);jj=joint(gg,sphere[True],True,tri['xyz_m'],nseed=2)
            frames.append(dict(time_s=float(t),angles_deg=[angles(u) for u in us],triangulation=tri,joint=jj))
        r['frames']=frames
        nominal=row['nominal_xyz_m']
        if nominal is not None and all(v is not None for v in nominal):
            target=np.array(nominal)
            for key in ('scan_corrected','uncorrected'):
                for method in ('joint','triangulation'):
                    est=r[key][method]['xyz_m']
                    r[key][method]['nominal_deviation_m']=float(np.linalg.norm(np.array(est)-target)) if est is not None else None
            r['nominal_angles_deg']=[angles((target-c)/np.linalg.norm(target-c)) for c in CENTERS]
        results.append(r)
        (OUT/f'{prefix}localization_{ident:02d}.json').write_text(json.dumps(r,ensure_ascii=False,indent=2,default=safe),encoding='utf-8')
        print(ident,row['file'],'angles',np.round(r['scan_corrected']['angles_deg'],1).tolist(),'xyz',np.round(r['scan_corrected']['joint']['xyz_m'],2).tolist(),'deviation',r['scan_corrected']['joint'].get('nominal_deviation_m'),flush=True)
    (OUT/f'{prefix}localization_results.json').write_text(json.dumps(results,ensure_ascii=False,indent=2,default=safe),encoding='utf-8')

if __name__=='__main__':main()
