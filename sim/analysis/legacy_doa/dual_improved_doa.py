"""Reusable DOA prototype: calibrated noise-whitened MUSIC + acoustic activity gate.
Outputs directions only. Never reads a target coordinate during inference.
No temporal smoothing; paired SRP baseline uses the same 0.75 s windows.
"""
from algorithm_trials import *
from algorithm_calibrate import transform
from dual_direction_only import estimate as baseline_estimate
SOUT=TROOT/'stream';SOUT.mkdir(exist_ok=True)
CAL=json.loads((TROOT/'weak_channel_calibration_v2.json').read_text(encoding='utf-8'))
NOISE=np.load(TROOT/'noise_cov.npz')['noise'];CNOISE=transform(NOISE,CAL)
WINDOW=.75;HOP=.25

def frames(path):
    x=load(path);length=int(WINDOW*FS);hop=int(HOP*FS)
    for start in range(FS//2,len(x)-length+1,hop):
        a=x[start:start+length];seg=np.stack([a[k:k+N] for k in range(0,len(a)-N+1,512)])
        seg-=seg.mean(1,keepdims=True)
        f=np.fft.rfft(seg*WIN[None,:,None],axis=1)
        f*=np.exp(-2j*np.pi*FREQ[None,:,None]*SCAN[None,None,:])
        cov=covariance(f[:,FI])
        yield (start+length/2)/FS,cov,f

def gate_evidence(cov):
    # Source-agnostic harmonic activity statistic. No localization is used here.
    # Reuse harmonic comb definition fixed during development.
    model=prepare(cov,NOISE,list(range(16)),'harmonic_gevd')
    return float(model['comb_score']),float(model['fundamental_hz'])

def infer(cov):
    model=prepare(transform(cov,CAL),CNOISE,list(range(16)),'gevd_music')
    result=direction(model);evidence,f0=gate_evidence(cov)
    # Independent frequency subsets expose ambiguity without using a location label.
    selected=np.flatnonzero(model['weight']>0)
    half=[]
    for partition in [selected[::2],selected[1::2]]:
        sub=model.copy()
        for k in ['frequency','weight','cov','whiten','v']:sub[k]=model[k][partition]
        sub['weight']=sub['weight']/max(sub['weight'].sum(),1e-20)
        half.append(direction(sub))
    agreement=float(np.degrees(np.arccos(np.clip(np.dot(half[0]['direction'],half[1]['direction']),-1,1))))
    return dict(**result,harmonic_evidence=evidence,fundamental_hz=f0,frequency_split_disagreement_deg=agreement)

def baseline(f):
    # Restore acquisition scan phase for the previously verified SRP delay lookup.
    raw=f*np.exp(2j*np.pi*FREQ[None,:,None]*SCAN[None,None,:])
    auto=np.mean(abs(raw)**2,axis=0)
    cs=np.mean(raw[:,:,PAIRS[:,0]]*raw[:,:,PAIRS[:,1]].conj(),axis=0)
    coh=abs(cs)**2/np.maximum(auto[:,PAIRS[:,0]]*auto[:,PAIRS[:,1]],1e-30)
    mask=(FREQ>=250)&(FREQ<=4500)&~((FREQ>=2500)&(FREQ<=2800))
    spec=cs/np.maximum(abs(cs),1e-20)*coh*mask[:,None]
    corr=np.fft.irfft(spec,n=N*IP,axis=0)*IP;g=corr[LAGS%(N*IP)].T.astype(np.float32)
    return baseline_estimate(g,'joint_120')

def fit_gate():
    split=float(np.load(TROOT/'noise_cov.npz')['time_split_s']);scores=[]
    # Entire fit portion, including its initial transients, participates in threshold fitting.
    for t,cov,_ in frames(Path(ROWS[33]['path'])):
        if t+WINDOW/2>=split:continue
        scores.append(gate_evidence(cov)[0])
    result=dict(threshold=float(np.quantile(scores,.99)),training_scores=scores,background_split_time_s=split,
         definition='99th percentile of rotor-comb evidence on the background fit portion; test later on untouched final third. Not calibrated drone probability.',
         frequency_split_disagreement_limit_deg=20.,window_s=WINDOW,hop_s=HOP)
    (SOUT/'activity_gate.json').write_text(json.dumps(result,ensure_ascii=False,indent=2),encoding='utf-8');print('GATE',result['threshold'],len(scores),flush=True)

def fit_rotor_gate():
    # A drone-specific acoustic prior, learned from development recordings only.
    ids=[i for i in DEV if np.linalg.norm(ROWS[i]['nominal_xyz_m'])<=8]
    f0=[json.loads((TROOT/f'record_harmonic_{i:02d}.json').read_text(encoding='utf-8'))['methods']['harmonic_gevd']['fundamental_hz'] for i in ids]
    centre=float(np.median(f0));width=max(20.,2*float(np.median(abs(np.array(f0)-centre))))
    split=float(np.load(TROOT/'noise_cov.npz')['time_split_s'])
    diagnostics=json.loads((SOUT/'background_gate_diagnostics.json').read_text(encoding='utf-8'))
    scores=[q['score'] if abs(q['f0']-centre)<=width else 0. for q in diagnostics if q['t']+WINDOW/2<split]
    threshold=float(np.quantile(scores,.95))
    result=dict(threshold=threshold,training_record_ids=ids,training_record_fundamentals_hz=f0,
        fundamental_centre_hz=centre,fundamental_halfwidth_hz=width,
        background_split_time_s=split,background_training_windows=len(scores),
        background_fit_exceedance_fraction=float(np.mean(np.array(scores)>threshold)),
        frequency_split_disagreement_limit_deg=20.,window_s=WINDOW,hop_s=HOP,
        definition='Development-only median fundamental +/-max(20Hz,2*MAD); 95th percentile on complete background-fit portion including transients. No position label used by inference.',
        limitation='Specific to this drone and acquisition. Not a general drone classifier or a calibrated probability. Report missed outputs and held-out background false outputs.')
    (SOUT/'rotor_activity_gate.json').write_text(json.dumps(result,ensure_ascii=False,indent=2),encoding='utf-8');print('ROTOR_GATE',json.dumps(result,ensure_ascii=False),flush=True)

def gate_pass(q,gate):
    inband=('fundamental_centre_hz' not in gate or abs(q['fundamental_hz']-gate['fundamental_centre_hz'])<=gate['fundamental_halfwidth_hz'])
    activity=bool(q['harmonic_evidence']>gate['threshold'] and inband)
    valid=bool(activity and q['frequency_split_disagreement_deg']<=gate['frequency_split_disagreement_limit_deg'])
    return activity,valid

def fit_persistent_gate():
    base=json.loads((SOUT/'rotor_activity_gate.json').read_text(encoding='utf-8'))
    conservative=json.loads((SOUT/'activity_gate.json').read_text(encoding='utf-8'))
    base.update(threshold=float(np.median(conservative['training_scores'])),persistence_windows=8,persistence_required=6,
       definition='Drone-specific fundamental band from development recordings; activity floor = median on complete background fit portion. Require at least 6 of the latest 8 windows active, and current frequency-split disagreement <=20 deg.',
       startup_latency_s=WINDOW+7*HOP,
       limitation='Retrospective prototype. Persistence filters transient interference, not motion. It cannot establish target identity or guarantee angular/xyz accuracy. Very near sources may violate common plane-wave model.')
    (SOUT/'persistent_activity_gate.json').write_text(json.dumps(base,ensure_ascii=False,indent=2),encoding='utf-8')
    print('PERSISTENT_GATE',base['threshold'],flush=True)

def apply_persistent_gate(frames,gate):
    active=[];result=[]
    for k,q in enumerate(frames):
        act,_=gate_pass(q,gate);active.append(act)
        n=gate.get('persistence_windows',1);need=gate.get('persistence_required',1)
        enough=k>=n-1 and sum(active[max(0,k-n+1):k+1])>=need
        valid=bool(act and enough and q['frequency_split_disagreement_deg']<=gate['frequency_split_disagreement_limit_deg'])
        result.append(dict(activity_pass=act,persistence_pass=bool(enough),valid_direction=valid))
    return result

def run_one(path,record_id=None):
    gate_path=SOUT/'persistent_activity_gate.json'
    if not gate_path.exists():gate_path=SOUT/'rotor_activity_gate.json'
    if not gate_path.exists():gate_path=SOUT/'activity_gate.json'
    gate=json.loads(gate_path.read_text(encoding='utf-8'));out=[];beg=time.perf_counter()
    for t,cov,f in frames(path):
        q=infer(cov);q['time_s']=t
        q['activity_pass'],q['valid_direction']=gate_pass(q,gate)
        if '--no-baseline' not in sys.argv:q['baseline']=baseline(f)
        out.append(q)
    for q,status in zip(out,apply_persistent_gate(out,gate)):q.update(status)
    result=dict(source=str(path),source_sha256=hashlib.sha256(path.read_bytes()).hexdigest(),record_id=record_id,
        window_s=WINDOW,hop_s=HOP,elapsed_compute_s=time.perf_counter()-beg,gate_model=gate_path.name,
        warning='Candidates below the gate are withheld, not interpreted as detections. Gate measures drone-compatible acoustic activity, not verified target identity. No certified range.',frames=out)
    name=f'record_{record_id:02d}.json' if record_id is not None else path.stem+'_directions.json'
    (SOUT/name).write_text(json.dumps(result,ensure_ascii=False,indent=2),encoding='utf-8')
    print('STREAM',record_id,path.name,len(out),'valid',sum(q['valid_direction'] for q in out),'activity',sum(q['activity_pass'] for q in out),'sec',round(result['elapsed_compute_s'],2),flush=True)
    return result

if __name__=='__main__':
    if '--fit-gate' in sys.argv:fit_gate()
    elif '--fit-rotor-gate' in sys.argv:fit_rotor_gate()
    elif '--fit-persistent-gate' in sys.argv:fit_persistent_gate()
    elif '--file' in sys.argv:run_one(Path(sys.argv[sys.argv.index('--file')+1]))
    else:
        for row in ROWS:
            if (SOUT/f"record_{row['id']:02d}.json").exists():continue
            run_one(Path(row['path']),row['id'])
