"""Weak-label channel phase/delay calibration using development recordings ONLY.
Finite parameter model: one phase and one delay per channel. Held-out files untouched.
"""
from algorithm_trials import *
CAL_IDS=[0,4,8,24,28,29]
VERSION='_v2' if '--v2' in sys.argv else ''

def fit():
    noise=np.load(TROOT/'noise_cov.npz')['noise'];matrices=[];weights=[]
    for i in CAL_IDS:
        c=np.load(TROOT/f'cov_{i:02d}.npz')['cov']-noise
        auto=np.maximum(np.real(np.diagonal(c,axis1=1,axis2=2)),1e-20)
        coh=np.clip(abs(c)/np.sqrt(auto[:,:,None]*auto[:,None,:]),0,1)
        point=np.array(ROWS[i]['nominal_xyz_m']);distance=np.linalg.norm(point-MICS,axis=1)
        true=np.exp(-2j*np.pi*FF[:,None]*distance[None,:]/C)
        residual=c/np.maximum(abs(c),1e-20)*true.conj()[:,:,None]*true[:,None,:]
        matrices.append(residual*coh)
    matrices=np.array(matrices)
    # Coordinate-wise complex median suppresses recording-specific movers/interferers.
    median=np.median(matrices.real,axis=0)+1j*np.median(matrices.imag,axis=0)
    median=(median+median.conj().transpose(0,2,1))*.5
    ev,v=np.linalg.eigh(median);g=v[:,:,-1];g=g*np.exp(-1j*np.angle(g[:,0]))[:,None]
    confidence=np.tile(np.clip((ev[:,-1]-ev[:,-2])/16,0,1)[:,None],(1,16))
    if VERSION:
        for start in [0,8]:
            ee,vv=np.linalg.eigh(median[:,start:start+8,start:start+8]);gg=vv[:,:,-1]
            g[:,start:start+8]=gg*np.exp(-1j*np.angle(gg[:,0]))[:,None]
            confidence[:,start:start+8]=np.clip((ee[:,-1]-ee[:,-2])/8,0,1)[:,None]
    delays=[];phases=[];qualities=[];grid=np.linspace(-100e-6,100e-6,801)
    basis=np.exp(-2j*np.pi*FF[:,None]*grid[None,:])
    for ch in range(16):
        ph=g[:,ch]/np.maximum(abs(g[:,ch]),1e-20)
        ref=(ch//8)*8 if VERSION else 0
        w=confidence[:,ch]*abs(g[:,ch])*abs(g[:,ref]);z=(w*ph)@basis
        k=int(np.argmax(abs(z)));quality=float(abs(z[k])/max(w.sum(),1e-20))
        delay=float(grid[k]);phase=float(np.angle(z[k]))
        if quality<.6:delay=phase=0.
        delays.append(delay);phases.append(phase);qualities.append(quality)
    delays[0]=0;phases[0]=0
    if VERSION:delays[8]=0;phases[8]=0
    result=dict(training_record_ids=CAL_IDS,phase_rad=phases,delay_s=delays,phase_fit_coherence=qualities,
       warning='Uses approximate nominal training positions: this is weak-label calibration, not independent physical calibration. Do not claim dynamic ground-truth accuracy.')
    (TROOT/f'weak_channel_calibration{VERSION}.json').write_text(json.dumps(result,ensure_ascii=False,indent=2),encoding='utf-8')
    print(json.dumps(result,ensure_ascii=False,indent=2))

def transform(cov,cal):
    h=np.exp(1j*(np.array(cal['phase_rad'])[None,:]+2*np.pi*FF[:,None]*np.array(cal['delay_s'])[None,:]))
    return cov*h.conj()[:,:,None]*h[:,None,:]

def run():
    cal=json.loads((TROOT/f'weak_channel_calibration{VERSION}.json').read_text(encoding='utf-8'))
    noise=transform(np.load(TROOT/'noise_cov.npz')['noise'],cal)
    ids=DEV if '--dev' in sys.argv else HOLD if '--holdout' in sys.argv else [33]
    for i in ids:
        path=TROOT/f'record_calibrated{VERSION}_{i:02d}.json'
        if path.exists():continue
        cov=np.load(TROOT/'noise_cov.npz')['heldout'] if i==33 else np.load(TROOT/f'cov_{i:02d}.npz')['cov']
        cov=transform(cov,cal);result=dict(id=i,file=ROWS[i]['file'],methods={})
        for method in ['spectral_srp','normmusic','gevd_music','harmonic_gevd']:
            whole=prepare(cov,noise,list(range(16)),method)
            far=direction(whole);near=position(whole)
            result['methods'][method]=dict(joint_direction=far,joint_position=near,fundamental_hz=whole['fundamental_hz'],comb_score=whole['comb_score'])
            print('CALIBRATED',i,method,'angles',np.round(far['angles_deg'],1).tolist(),'xyz',np.round(near['xyz_m'],2).tolist(),flush=True)
        path.write_text(json.dumps(result,ensure_ascii=False,indent=2),encoding='utf-8')

if __name__=='__main__':
    if '--fit' in sys.argv:fit()
    else:run()
