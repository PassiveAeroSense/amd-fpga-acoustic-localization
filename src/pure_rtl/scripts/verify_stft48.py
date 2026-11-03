                                                                             
from pathlib import Path
import json,sys
P=Path(__file__).resolve().parents[1]
import numpy as np
a=np.loadtxt(Path(sys.argv[1])/'stft48_out.txt',dtype=np.int64)
assert a.shape==(4256,4)
got=np.empty((16,266),dtype=complex)
for ch,f,r,i in a:got[ch,f]=r+1j*i
x=((np.arange(4096)%256)-128)[None,:]*(np.arange(16)+1)[:,None]*256
x=x-x.mean(1,keepdims=True)
expected=np.fft.rfft(x*np.hanning(4096),axis=1)[:,22:288]*(64/4096)
error=abs(got-expected);strong=abs(expected)>1000
phase=abs(np.angle(got[strong]/expected[strong]))
assert error.max()<10,(error.max(),np.unravel_index(error.argmax(),error.shape))
assert phase.max()<.001,phase.max()
result=dict(passed=True,channels=16,bins=266,fft_size=4096,sample_rate=48000,
            max_complex_error=float(error.max()),max_phase_error_rad=float(phase.max()),
            reference='numpy double-precision FFT; independent of fixed-point butterfly implementation')
(P/'reports/stft48_verification.json').write_text(json.dumps(result,indent=2))
print(json.dumps(result,indent=2))
