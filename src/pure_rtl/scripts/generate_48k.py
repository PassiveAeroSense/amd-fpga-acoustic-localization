                                                                                
from pathlib import Path
import sys,json
P=Path(__file__).resolve().parents[1]
import numpy as np
from scipy.signal import firwin,freqz

def put(path,a,bits):
    path.write_text(''.join(f'{int(v)&((1<<bits)-1):0{bits//4}x}\n' for v in a))

det=np.rint(firwin(2047,6750,fs=240000,window=('kaiser',8.6))*5*2**22).astype(np.int64)
loc=np.rint(firwin(383,[180,3400],pass_zero=False,fs=48000,window=('kaiser',6))*2**22).astype(np.int64)
def response(c,fs,gain=1):
    f,h=freqz(c/2**22/gain,worN=131072,fs=fs)
    return f,20*np.log10(np.maximum(abs(h),1e-15))
f,d=response(det,240000,5)
det_metrics=dict(passband_300_6000_max_abs_db=float(np.max(abs(d[(f>=300)&(f<=6000)]))),
                 stopband_7500plus_max_db=float(np.max(d[f>=7500])),delay_ms=1023/240000*1000)
f,d=response(loc,48000)
loc_metrics=dict(passband_350_3000_max_abs_db=float(np.max(abs(d[(f>=350)&(f<=3000)]))),
                 stopband_0_50_max_db=float(np.max(d[f<=50])),
                 stopband_4500plus_max_db=float(np.max(d[f>=4500])),delay_ms=191/48000*1000)
assert det_metrics['passband_300_6000_max_abs_db']<.02 and det_metrics['stopband_7500plus_max_db']< -70,det_metrics
assert loc_metrics['passband_350_3000_max_abs_db']<1 and loc_metrics['stopband_4500plus_max_db']< -60,loc_metrics
n=4800;t=np.arange(n)/48000
x=np.rint(900*np.sin(2*np.pi*1000*t)+700*np.sin(2*np.pi*10000*t)+
          500*np.sin(2*np.pi*40*t)+np.random.default_rng(13).normal(0,7,n)).astype(np.int64)*256
def oracle(coeff,L,M):
    out=[]
    for m in range((n*L+M-1)//M):
        k=m*M//L;phase=m*M%L;c=coeff[phase::L]
        if k>=n:break
        if k<(len(coeff)+L-1)//L-1:continue
        value=(int(x[k-np.arange(len(c))]@c)+(1<<21))>>22
        out.append(np.clip(value,-2**23,2**23-1))
    return np.array(out,dtype=np.int64)
yd=oracle(det,5,16);yl=oracle(loc,1,1)
result=dict(adc_rate=48000,localization_rate=48000,detector_rate=15000,
            localization_fft=4096,hop_samples=3072,frames=8,window_samples=25600,window_seconds=25600/48000,
            first_fft_bin=22,last_fft_bin=287,selected_low_hz=30*48000/4096,selected_high_hz=256*48000/4096,
            detector_filter=det_metrics,localization_filter=loc_metrics,
            adc_fractional_period_clocks=[2083,2083,2084],input_samples=n,detector_outputs=len(yd),localization_outputs=len(yl))
if len(sys.argv)>1:
    root=Path(sys.argv[1]);ad=np.loadtxt(root/'rate48_det_out.txt',dtype=np.int64);al=np.loadtxt(root/'rate48_loc_out.txt',dtype=np.int64)
    assert np.array_equal(ad,yd),('detector mismatch',ad.shape,yd.shape)
    assert np.array_equal(al,yl),('localization mismatch',al.shape,yl.shape)
    result.update(bit_exact=True,all16_channels_checked_by_rtl=True)
    (P/'reports/rate48_verification.json').write_text(json.dumps(result,indent=2))
else:
    put(P/'rom/resamp_48k_15k.mem',det,24);put(P/'rom/loc_bandpass48.mem',loc,24)
    put(P/'rom/rate48_test_input.mem',x,24)
    f=np.arange(22,288)*48000/4096
    put(P/'rom/joint15_phase_mm.mem',np.rint(f/343000*2**32),32)
    xy=np.array([[-430,-70],[-500,-70],[-570,-70],[-570,0],[-570,70],[-500,70],[-430,70],[-430,0],
                 [570,-70],[500,-70],[430,-70],[430,0],[430,70],[500,70],[570,70],[570,0]])/1000
    mic=np.c_[xy,np.zeros(16)];power=np.ones(266)
                                                                         
    for k in range(15,225,19):power[k:k+2]=20
    entries=[(i,i) for i in range(16)]+[(i,j) for i in range(16) for j in range(i)]
    for name,target in [('joint15_fixture_cov',[-.5,.5,1]),('position_check_0',[0,0,1]),('position_check_1',[.6,-.4,1.5])]:
        distance=np.linalg.norm(np.array(target)-mic,axis=1)
        a=np.exp(-2j*np.pi*f[:,None]*distance/343)
        covariance=power[:,None,None]*a[:,:,None]*a[:,None,:].conj()*2**20
        packed=[]
        for k in range(266):
            for i,j in entries:
                v=covariance[k,i,j];packed.append(((round(v.imag)&0xffffffff)<<32)|(round(v.real)&0xffffffff))
        dest=P/('rom' if name=='joint15_fixture_cov' else 'tests')/(name+'.mem');put(dest,packed,64)
        if name=='joint15_fixture_cov' and (P/'tests'/dest.name).exists():put(P/'tests'/dest.name,packed,64)
    (P/'reports/rate48_design.json').write_text(json.dumps(result,indent=2))
print(json.dumps(result,indent=2))
