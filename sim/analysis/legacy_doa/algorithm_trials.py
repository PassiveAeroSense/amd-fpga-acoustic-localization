"""Record-held-out exploration of spectral SRP, NormMUSIC and noise-whitened MUSIC.
Labels are used only in a separate evaluation step. Run from project root.
"""
import os
os.environ.setdefault('OPENBLAS_NUM_THREADS','1')
from dual_localize import *
TROOT=Path('data/analysis/algorithm_trials_20261024');TROOT.mkdir(parents=True,exist_ok=True)
DEV=[0,4,8,12,14,18,21,24,27,28,29]
ROWS=json.loads((OUT/'manifest.json').read_text(encoding='utf-8'))
VALID=[r['id'] for r in ROWS if r['nominal_xyz_m'] is not None and all(x is not None for x in r['nominal_xyz_m'])]
HOLD=[i for i in VALID if i not in DEV]
FI=np.flatnonzero((FREQ>=250)&(FREQ<=2200));FF=FREQ[FI]
WIN=np.hanning(N)
UU=np.stack(np.meshgrid(np.arange(-1,1.0001,.05),np.arange(-1,1.0001,.05)),axis=-1).reshape(-1,2)
UU=UU[(UU*UU).sum(1)<=1+1e-10];UU=np.c_[UU,np.sqrt(np.maximum(0,1-(UU*UU).sum(1)))]
AZZ,ELL,RRR=np.meshgrid(np.arange(0,360,10),np.arange(0,91,10),[.25,.5,.8,1.2,1.8,2.5,3.5,5,7,10,15,25,40,70,120,250],indexing='ij')
PP=np.stack([RRR*np.cos(np.radians(ELL))*np.cos(np.radians(AZZ)),RRR*np.cos(np.radians(ELL))*np.sin(np.radians(AZZ)),RRR*np.sin(np.radians(ELL))],axis=-1).reshape(-1,3)
PP=np.unique(PP.round(8),axis=0)

def plan():
    p=dict(development_record_ids=DEV,heldout_record_ids=HOLD,background_fit_fraction=2/3,
       note='Retrospective recording holdout for NEW algorithm selection; all files appeared in earlier TDOA reports. Not a new prospective blind test. No coordinate used in inference.',
       methods=['spectral_srp','normmusic','gevd_music'],freq_range_hz=[250,2200],fft=N,hop=512,
       noise_cov_shrinkage=.15,noise_eigen_floor_fraction=.03,selected_frequency_count=48,
       output='independent array directions and triangulation; joint direction and spherical-wave xyz',
       metrics='Altitude consistency +/-1 m, ray gap sensitivity, coarse nominal angular deviation (not true dynamic accuracy), background rejection, no xy-stationarity score')
    path=TROOT/'trial_plan.json'
    if not path.exists():path.write_text(json.dumps(p,ensure_ascii=False,indent=2),encoding='utf-8')

def stft(path):
    x=load(path);starts=range(FS//2,len(x)-N-FS//2+1,512)
    seg=np.stack([x[t:t+N] for t in starts]);seg-=seg.mean(1,keepdims=True)
    f=np.fft.rfft(seg*WIN[None,:,None],axis=1)[:,FI,:]
    f*=np.exp(-2j*np.pi*FF[None,:,None]*SCAN[None,None,:])
    return f.astype(np.complex64),np.array([(t+N/2)/FS for t in starts])

def covariance(f,robust=False):
    if robust:
        power=np.sum(abs(f)**2,axis=2);weights=np.minimum(1,np.median(power,axis=0)[None,:]/np.maximum(power,1e-20))
    else:weights=np.ones(f.shape[:2])
    return np.einsum('tfi,tfj,tf->fij',f,f.conj(),weights,optimize=True)/weights.sum(axis=0)[:,None,None]

def extract():
    for row in ROWS:
        p=TROOT/f"cov_{row['id']:02d}.npz"
        if p.exists():continue
        assert hashlib.sha256(Path(row['path']).read_bytes()).hexdigest()==row['sha256']
        f,t=stft(Path(row['path']));cov=covariance(f)
        if row['kind']=='background':
            cut=int(len(f)*2/3);noise=covariance(f[:cut],True);held=covariance(f[cut:])
            np.savez_compressed(TROOT/'noise_cov.npz',noise=noise,heldout=held,time_split_s=t[cut],source_sha256=row['sha256'])
        np.savez_compressed(p,cov=cov,source_sha256=row['sha256']);print('COV',row['id'],flush=True)

def white(noise):
    m=noise.shape[-1];diag=np.zeros_like(noise);ii=np.arange(m);diag[:,ii,ii]=noise[:,ii,ii]
    rn=.85*noise+.15*diag
    val,v=np.linalg.eigh(rn);floor=.03*np.mean(val,axis=1)
    w=(v*(1/np.sqrt(np.maximum(val,floor[:,None])))[:,None,:])@v.conj().transpose(0,2,1)
    return w

def prepare(cov,noise,chs,method):
    c=cov[:,chs][:,:,chs];b=noise[:,chs][:,:,chs];m=len(chs)
    trace=np.real(np.trace(c,axis1=1,axis2=2));bn=np.real(np.trace(b,axis1=1,axis2=2))
    local=np.array([np.median(trace[max(0,k-6):min(len(trace),k+7)]) for k in range(len(trace))])
    prominence=np.clip(trace/np.maximum(local,1e-20)-1,0,8)
    excess=np.clip(1-bn/np.maximum(trace,1e-20),0,1)
    spectral=.05+prominence*(.1+excess)
    if method in ['gevd_music','harmonic_gevd','signature_gevd']:
        w=white(b);c=w@c@w.conj().transpose(0,2,1)
    else:w=np.tile(np.eye(m),(len(FF),1,1))
    ev,vec=np.linalg.eigh(c);v=vec[:,:,-1]
    rank=np.clip(1-ev[:,-2]/np.maximum(ev[:,-1],1e-20),0,1)
    # Fixed signal-only ranking; never looks at recording coordinates.
    rankweight=spectral*rank
    if method in ['gevd_music','harmonic_gevd','signature_gevd']:rankweight*=np.clip(1-1.5/np.maximum(ev[:,-1],1e-20),0,1)
    fundamental=None;comb_score=None
    if method in ['harmonic_gevd','signature_gevd']:
        # Harmonics 2..6; find rotor-like comb from audio, never a coordinate.
        candidates=np.arange(180.,421.,1.)
        if method=='signature_gevd':
            sig=json.loads((TROOT/'stream/rotor_activity_gate.json').read_text(encoding='utf-8'))
            fc=sig['fundamental_centre_hz'];fw=sig['fundamental_halfwidth_hz'];candidates=np.arange(fc-fw,fc+fw+1)
        comb=[]
        for fundamental in candidates:
            harmonic_values=[]
            for n in range(2,7):
                mask=abs(FF-fundamental*n)<=12
                if mask.any():harmonic_values.append(float(np.max(np.log1p(prominence[mask])*(.1+excess[mask])*rank[mask])))
            if method=='signature_gevd':
                top=np.sort(harmonic_values)[-3:];comb.append(float(np.prod(np.maximum(top,1e-12))**(1/3)))
            else:comb.append(sum(harmonic_values)/max(len(harmonic_values),1))
        k=int(np.argmax(comb));fundamental=float(candidates[k]);comb_score=float(comb[k])
        harmonic_mask=np.any(abs(FF[:,None]-fundamental*np.arange(2,7)[None,:])<=14,axis=1)
        rankweight*=harmonic_mask
    # Include many disjoint narrowband peaks, capped at 48 frequency bins.
    chosen=[]
    for k in np.argsort(rankweight)[::-1]:
        if all(abs(k-q)>=2 for q in chosen):chosen.append(int(k))
        if len(chosen)==48:break
    fi=np.array(chosen);weights=rankweight[fi];weights=weights/max(weights.sum(),1e-20)
    if method=='spectral_srp':
        c=cov[:,chs][:,:,chs];auto=np.real(np.diagonal(c,axis1=1,axis2=2))
        denom=np.sqrt(auto[:,:,None]*auto[:,None,:]);coh=abs(c)**2/np.maximum(denom**2,1e-30)
        c=c/np.maximum(abs(c),1e-20)*coh
        ii=np.arange(m);c[:,ii,ii]=0
    return dict(chs=np.array(chs),method=method,frequency=FF[fi],weight=weights,cov=c[fi],whiten=w[fi],v=v[fi],
        evidence_eig_median=float(np.median(ev[:,-1])),frequency_indices=fi,fundamental_hz=fundamental,comb_score=comb_score)

def steering(points,model,near):
    mic=MICS[model['chs']]
    if near:
        dd=np.linalg.norm(points[:,None,:]-mic[None,:,:],axis=2);dd-=dd.mean(axis=1,keepdims=True)
        delay=-dd/C
    else:delay=points@mic.T/C
    return np.exp(2j*np.pi*model['frequency'][:,None,None]*delay[None,:,:])

def score(points,model,near=False):
    out=[]
    for start in range(0,len(points),256):
        a=steering(points[start:start+256],model,near)
        if model['method']=='spectral_srp':
            value=np.einsum('fki,fij,fkj->fk',a.conj(),model['cov'],a,optimize=True).real/(a.shape[-1]*(a.shape[-1]-1))
        else:
            a=np.einsum('fij,fkj->fki',model['whiten'],a,optimize=True)
            dot=np.einsum('fi,fki->fk',model['v'].conj(),a,optimize=True)
            alignment=np.clip(abs(dot)**2/np.maximum(np.sum(abs(a)**2,axis=2),1e-20),0,1)
            # Log-MUSIC limits tonal domination without flattening range curvature.
            value=-np.log(np.maximum(1-alignment,1e-8))
        out.extend((model['weight']@value).tolist())
    return np.array(out)

def direction(model):
    scores=score(UU,model);u=UU[scores.argmax()].copy();best=float(max(scores))
    for step in [.025,.01,.003,.001,.0003]:
        for _ in range(10):
            xy=u[:2]+np.r_[np.zeros((1,2)),np.eye(2)*step,-np.eye(2)*step]
            xy=xy[(xy*xy).sum(1)<=1];pts=np.c_[xy,np.sqrt(np.maximum(0,1-(xy*xy).sum(1)))]
            ss=score(pts,model);k=ss.argmax()
            if ss[k]<=best+1e-10:break
            u=pts[k];best=float(ss[k])
    return dict(direction=u.tolist(),angles_deg=angles(u),score=best)

def position(model):
    ss=score(PP,model,True);rank=np.argsort(ss)[::-1];seeds=[]
    for k in rank:
        p=PP[k]
        if all(np.linalg.norm(p-q)>.2*max(1,np.linalg.norm(p)) for q in seeds):seeds.append(p.copy())
        if len(seeds)==4:break
    candidates=[]
    for p in seeds:
        best=float(score(p[None],model,True)[0])
        for scale in [.15,.05,.015,.005,.001]:
            for _ in range(12):
                step=max(.002,np.linalg.norm(p)*scale)
                points=np.r_[p[None],p+np.eye(3)*step,p-np.eye(3)*step,p[None]*(1+scale),p[None]*(1-scale)]
                points=points[(points[:,2]>=0)&(np.linalg.norm(points,axis=1)>=.15)&(np.linalg.norm(points,axis=1)<=300)]
                s=score(points,model,True);k=s.argmax()
                if s[k]<=best+1e-10:break
                p=points[k];best=float(s[k])
        candidates.append(dict(xyz_m=p.tolist(),score=best,range_m=float(np.linalg.norm(p)),boundary=bool(p[2]<.01 or np.linalg.norm(p)>290)))
    return max(candidates,key=lambda q:q['score'])

def main():
    plan()
    if '--extract' in sys.argv:extract();return
    noise=np.load(TROOT/'noise_cov.npz')['noise']
    ids=DEV if '--dev' in sys.argv else HOLD if '--holdout' in sys.argv else [33]
    harmonic='--harmonic' in sys.argv
    methods=['harmonic_gevd'] if harmonic else ['spectral_srp','normmusic','gevd_music']
    for i in ids:
        path=TROOT/(f'record_harmonic_{i:02d}.json' if harmonic else f'record_trial_{i:02d}.json')
        if path.exists():continue
        cov=np.load(TROOT/f'cov_{i:02d}.npz')['cov']
        if i==33:cov=np.load(TROOT/'noise_cov.npz')['heldout']
        result=dict(id=i,file=ROWS[i]['file'],methods={})
        for method in methods:
            models=[prepare(cov,noise,list(range(j*8,j*8+8)),method) for j in range(2)]
            dr=[direction(m) for m in models];tri=intersect(np.array([q['direction'] for q in dr]))
            whole=prepare(cov,noise,list(range(16)),method)
            far=direction(whole);near=position(whole)
            result['methods'][method]=dict(arrays=dr,triangulation=tri,joint_direction=far,joint_position=near,
                 frequencies_hz=whole['frequency'].tolist(),frequency_weights=whole['weight'].tolist(),
                 fundamental_hz=whole['fundamental_hz'],comb_score=whole['comb_score'])
            print('TRIAL',i,method,'angles',[np.round(q['angles_deg'],1).tolist() for q in dr],'joint',np.round(far['angles_deg'],1).tolist(),'xyz',np.round(near['xyz_m'],2).tolist(),flush=True)
        path.write_text(json.dumps(result,ensure_ascii=False,indent=2),encoding='utf-8')

if __name__=='__main__':main()
