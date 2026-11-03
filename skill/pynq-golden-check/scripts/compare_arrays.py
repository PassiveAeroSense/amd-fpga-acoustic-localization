"""Compare saved numerical results without broadcasting or implicit integer rounding."""
from pathlib import Path
import argparse,json,hashlib,math
import numpy as np

def compare(golden,actual,atol=0.0,rtol=0.0):
    if not all(math.isfinite(x) and x>=0 for x in [atol,rtol]):raise ValueError('Tolerances must be finite and nonnegative')
    g=np.asarray(golden);a=np.asarray(actual)
    if g.shape!=a.shape:raise ValueError('Shape mismatch')
    if g.dtype!=a.dtype:raise ValueError('Dtype mismatch; explicitly decode/scale both arrays first')
    if not g.size or g.dtype.kind not in 'iufc':raise ValueError('Nonempty numeric arrays required')
    if not np.isfinite(g).all() or not np.isfinite(a).all():raise ValueError('Nonfinite data')
    if g.dtype.kind in 'iu':
        if atol or rtol:raise ValueError('Integer outputs require exact comparison; decode fixed point to float for tolerance checks')
        bad=g!=a
        max_error=max(abs(int(x)-int(y)) for x,y in zip(g.flat,a.flat))
    else:
        error=np.abs(a.astype(np.complex128 if g.dtype.kind=='c' else np.float64)-g)
        bad=error>atol+rtol*np.abs(g);max_error=float(error.max())
    return {'status':'FAIL' if bad.any() else 'PASS','shape':list(g.shape),'dtype':str(g.dtype),'elements':int(g.size),'mismatches':int(bad.sum()),'max_absolute_error':max_error,'atol':atol,'rtol':rtol}

if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('golden');p.add_argument('actual');p.add_argument('--atol',type=float,default=0);p.add_argument('--rtol',type=float,default=0);p.add_argument('--output');a=p.parse_args()
    result=compare(np.load(a.golden,allow_pickle=False),np.load(a.actual,allow_pickle=False),a.atol,a.rtol)
    result['sha256']={k:hashlib.sha256(Path(v).read_bytes()).hexdigest() for k,v in [('golden',a.golden),('actual',a.actual)]}
    text=json.dumps(result,indent=2)
    if a.output:Path(a.output).write_text(text+'\n','utf-8')
    print(text);raise SystemExit(result['status']!='PASS')
