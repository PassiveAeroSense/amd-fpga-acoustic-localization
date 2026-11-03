from pathlib import Path
import importlib.util,json,tempfile,numpy as np
root=Path(__file__).resolve().parents[1]
def module(name,path):
    spec=importlib.util.spec_from_file_location(name,path);m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m);return m
r=module('reports',root/'skill/fpga-evidence-check/scripts/check_reports.py')
c=module('arrays',root/'skill/pynq-golden-check/scripts/compare_arrays.py')
checks=[]
def check(name,condition):
    assert condition,name;checks.append({'test':name,'status':'PASS'})
def raises(name,fn):
    try:fn()
    except ValueError:checks.append({'test':name,'status':'PASS'});return
    raise AssertionError(name)
u=root/'build/reference_build/board_routed_utilization.rpt';t=root/'build/reference_build/board_routed_timing.rpt'
v=r.parse(u,t);check('actual_vivado_report',v['status']=='PASS' and v['lut']['used']==52106 and v['bram36']['used']==324.5)
with tempfile.TemporaryDirectory() as td:
    bad=Path(td)/'timing.rpt';bad.write_text(t.read_text().replace('0.686','-0.686'))
    check('reject_negative_slack',r.parse(u,bad)['status']=='FAIL')
    missing=Path(td)/'util.rpt';missing.write_text(u.read_text().replace('Slice LUTs','Missing LUTs'))
    raises('reject_missing_resource',lambda:r.parse(missing,t))
g=np.array([1.,2.,3.]);a=np.array([1.,2.0001,3.])
check('floating_tolerance',c.compare(g,a,atol=.001)['status']=='PASS')
check('reject_wrong_value',c.compare(g,a,atol=.00001)['status']=='FAIL')
raises('reject_shape',lambda:c.compare(g,a.reshape(1,3)))
raises('reject_nan',lambda:c.compare(g,np.array([1.,2.,np.nan])))
raises('reject_dtype',lambda:c.compare(g,a.astype(np.float32)))
raises('reject_bad_tolerance',lambda:c.compare(g,a,rtol=-1))
check('preserve_uint64_precision',c.compare(np.array([2**63],dtype=np.uint64),np.array([2**63+1],dtype=np.uint64))['status']=='FAIL')
result={'status':'PASS','checks':checks,'hardware_pynq_execution':False,'scope':'Desktop report and numeric validation; PYNQ device workflow documented separately.'}
(root/'sim/skill_validation.json').write_text(json.dumps(result,indent=2),'utf-8');print(json.dumps(result,indent=2))
