"""Fail-closed extraction of Vivado routed utilization and timing summaries."""
from pathlib import Path
import argparse,json,re,hashlib

def parse(util_path,timing_path):
    u=Path(util_path).read_text(errors='replace');t=Path(timing_path).read_text(errors='replace')
    result={}
    for key,label in [('lut','Slice LUTs'),('ff','Slice Registers'),('bram36','Block RAM Tile'),('dsp','DSPs')]:
        m=re.search(r'^\|\s*'+re.escape(label)+r'\s*\|\s*([\d.]+)\s*\|\s*\d+\s*\|\s*\d+\s*\|\s*([\d.]+)\s*\|',u,re.M)
        if not m:raise ValueError('Missing resource row: '+label)
        used,total=map(float,m.groups())
        if total<=0 or not 0<=used<=total:raise ValueError('Invalid capacity: '+label)
        result[key]={'used':used,'available':total,'percent':used/total*100}
    lines=t.splitlines();values=None
    for i,line in enumerate(lines):
        if line.lstrip().startswith('WNS(ns)') and 'WHS(ns)' in line:
            for row in lines[i+1:i+5]:
                parts=row.split()
                if len(parts)==12:
                    try:values=list(map(float,parts));break
                    except ValueError:pass
            break
    if values is None:raise ValueError('Timing summary missing or unsupported')
    result['timing']={k:values[j] for k,j in [('wns_ns',0),('tns_ns',1),('setup_failures',2),('whs_ns',4),('ths_ns',5),('hold_failures',6),('wpws_ns',8),('pulse_failures',10)]}
    result['status']='PASS' if all(values[i]>=0 for i in [0,4,8]) and all(values[i]==0 for i in [1,2,5,6,9,10]) else 'FAIL'
    result['sha256']={Path(p).name:hashlib.sha256(Path(p).read_bytes()).hexdigest() for p in [util_path,timing_path]}
    result['scope']='Reported constraints only; review CDC, DRC and timing exceptions separately.'
    return result

if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('utilization');p.add_argument('timing');p.add_argument('--output');a=p.parse_args()
    result=parse(a.utilization,a.timing);text=json.dumps(result,indent=2)
    if a.output:Path(a.output).write_text(text+'\n','utf-8')
    print(text);raise SystemExit(result['status']!='PASS')
