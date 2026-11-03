"""Reproducible blind TDOA evaluation for the dual planar arrays, 2026-10-23.
Filename coordinates are used only for evaluation, never for direction search.
"""
from pathlib import Path
import sys,json,re,struct,itertools,hashlib,time
import numpy as np
sys.path.insert(0,str(Path('tools').resolve()))
from smq_stream import SmqReader
ROOT=Path('data/daq/双阵列-夜间')
OUT=Path('data/analysis/dual_night_20261023');OUT.mkdir(parents=True,exist_ok=True)
FS=15000;C=343.;N=2048;IP=16
LOCAL=np.array([[7,-7,0],[0,-7,0],[-7,-7,0],[-7,0,0],[-7,7,0],[0,7,0],[7,7,0],[7,0,0]])*.01
CENTERS=np.array([[-.5,0,0],[.5,0,0]])
MICS=np.concatenate([LOCAL+v for v in CENTERS])
PAIRS=np.array(list(itertools.combinations(range(16),2)))
FREQ=np.fft.rfftfreq(N,1/FS)
LAGS=np.arange(-900,901)
SCAN=np.arange(16)/(FS*16)

def load(path):
    r=SmqReader(path,16);blocks=[]
    while r.file.tell()<path.stat().st_size:
        block=r.read_block()
        if block is None:raise ValueError('Truncated SMQ')
        blocks.append(block[1])
    r.close();return np.concatenate(blocks)

def label(p):
    ss=p.stem.strip('（）()').split('，')
    if len(ss)==3:
        return [None if s=='未知' else float(s)/(100 if i<2 else 1) for i,s in enumerate(ss)]
    return None

def extract():
    configs=[]
    for p in ROOT.glob('*.smqinf'):
        b=p.read_bytes();fs,count=struct.unpack_from('>II',b,20);idx=28;active=[]
        for i in range(count):
            enabled,span,size=struct.unpack_from('>BfI',b,idx);idx+=9+size
            if enabled:active.append(i)
        assert fs==FS and active==list(range(16))
        configs.append(dict(name=p.name,fs=fs,active=active))
    rows=[];win=np.hanning(N);norm=FS*(win**2).sum()
    for ident,p in enumerate(sorted(ROOT.glob('*.smq'))):
        dest=OUT/f'features_{ident:02d}.npz'
        x=load(p);true=label(p)
        row=dict(id=ident,file=p.name,path=str(p),nominal_xyz_m=true,kind='background' if '环境' in p.stem else 'unlabelled' if true is None else 'position',
            fs_hz=FS,samples=len(x),duration_s=len(x)/FS,sha256=hashlib.sha256(p.read_bytes()).hexdigest(),
            dc_v=x.mean(0).tolist(),rms_ac_v=x.std(0).tolist(),min_v=x.min(0).tolist(),max_v=x.max(0).tolist(),rail_fraction=(abs(x)>10).mean(0).tolist())
        rows.append(row)
        if dest.exists():
            with np.load(dest) as cached:
                valid='source_sha256' in cached and str(cached['source_sha256'])==row['sha256']
            if valid:print('Cached',ident,p.name,flush=True);continue
        psds=[];gcc=[];cohs=[];ts=[];stft=[];st=[];mean_cross=[]
        # Independent one-second blocks; discard partial start/end transients.
        for start in range(FS//2,len(x)-FS,FS):
            a=x[start:start+FS];seg=np.stack([a[q:q+N] for q in range(0,len(a)-N+1,N//2)])
            seg-=seg.mean(1,keepdims=True)
            f=np.fft.rfft(seg*win[None,:,None],axis=1)
            auto=np.mean(abs(f)**2,axis=0)
            cs=np.mean(f[:,:,PAIRS[:,0]]*f[:,:,PAIRS[:,1]].conj(),axis=0)
            coh=np.clip(abs(cs)**2/np.maximum(auto[:,PAIRS[:,0]]*auto[:,PAIRS[:,1]],1e-40),0,1)
            # Coherence-weighted PHAT suppresses independent sensor noise.
            mask=(FREQ>=250)&(FREQ<=4500)
            spec=cs/np.maximum(abs(cs),1e-30)*coh*mask[:,None]
            corr=np.fft.irfft(spec,n=N*IP,axis=0)*IP
            gcc.append(corr[LAGS%(N*IP)].T.astype(np.float32))
            psd=auto/norm;psd[1:-1]*=2
            psds.append(psd.T.astype(np.float32));cohs.append(coh[mask].mean(0).astype(np.float32))
            mean_cross.append(cs.astype(np.complex64));ts.append((start+FS/2)/FS)
        # Fine spectrogram and beam PSD, with scan correction explicitly applied.
        n2=4096;w2=np.hanning(n2);f2=np.fft.rfftfreq(n2,1/FS)
        for start in range(0,len(x)-n2+1,FS//4):
            a=x[start:start+n2];a=a-a.mean(0)
            f=np.fft.rfft(a*w2[:,None],axis=0)
            f*=np.exp(-2j*np.pi*f2[:,None]*SCAN[None,:])
            # Mean of the TWO individual zenith beams; no one-metre coherent sum.
            beam=np.stack([f[:,:8].mean(1),f[:,8:].mean(1)],axis=1)
            p2=abs(beam)**2/(FS*(w2**2).sum());p2[1:-1]*=2
            stft.append(p2.T.astype(np.float32));st.append((start+n2/2)/FS)
        np.savez_compressed(dest,psd=np.array(psds),gcc=np.array(gcc),coherence=np.array(cohs),time_s=ts,
            cross=np.mean(mean_cross,axis=0),stft=np.array(stft),stft_time_s=st,fine_frequency_hz=f2,source_sha256=row['sha256'])
        print('Extracted',ident,p.name,'seconds',round(len(x)/FS,2),'frames',len(ts),'rms_uV',np.round(x.std(0)*1e6).astype(int).tolist(),flush=True)
    (OUT/'manifest.json').write_text(json.dumps(rows,ensure_ascii=False,indent=2),encoding='utf-8')
    (OUT/'acquisition.json').write_text(json.dumps(dict(configurations=configs,mics_m=MICS.tolist(),assumed_scan_offsets_us=(SCAN*1e6).tolist(),speed_sound_m_s=C,notes='15 kHz per channel from all 35 SMQINF; scan offset model assumes uniform sequential 240 kS/s conversion. No acoustic/electrical calibration supplied.'),indent=2),encoding='utf-8')

if __name__=='__main__':extract()
