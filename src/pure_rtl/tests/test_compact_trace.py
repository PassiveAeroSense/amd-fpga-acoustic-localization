                                                                                        
from pathlib import Path
import sys,csv,json,re,tempfile
P=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(P/'scripts'))
from compact_trace_decode import read_values,decode_values

def pack_meta(**kwargs):
    from compact_trace_decode import FIELDS
    return sum((kwargs.get(name,0)&((1<<width)-1))<<bit for name,bit,width in FIELDS)

def encode(samples,seq,err,epoch,flags,metadata):
    return 1|sum((x&65535)<<(1+16*k) for k,x in enumerate(samples))|((seq&65535)<<257)|((err&65535)<<273)|((epoch&65535)<<289)|(flags<<305)|(((metadata>>((seq%64)*4))&15)<<309)

values=[];expected=[]
for n in range(2048):
    seq=(65500+n)&65535;errors=70000+(n>=1000);epoch=90000+(n>=1100)
                                                                                            
    if seq%64==0 or not n:meta=pack_meta(adc_errors_total=errors,secondary_fault_epoch=epoch,corrected_total=123456,age_tenths=5,azimuth_tenths=3456,elevation_tenths=789,x_mm=-345,y_mm=678,z_mm=999,primary_stage=31,joint_stage=65,track_mode=2,windows_low16=222)
    samples=[((n+123*k)%60000)-30000 for k in range(16)];expected.append(samples)
    values.append(encode(samples,seq,errors,epoch,13,meta))
samples,seq,result=decode_values(values,2048)
assert samples==expected and seq[36]==0
assert result["fs"]==48000 and result["duration_s"]==2048/48000
assert all(s["time_s"]==s["sample_index"]/48000 for s in result["metadata"])
assert result['continuous_primary_audio'] and not result['secondary_clean'] and result['joint_audio_usable']
assert result['adc_error_increments']==1 and result['secondary_fault_increments']==1
assert all(s['x_mm']==-345 and s['z_mm']==999 and s['joint_stage']==65 for s in result['metadata'])
for bad,description in [(values[:100]+values[101:],'missing sample'),([values[0]&~1]+values[1:],'invalid sample')]:
    try:decode_values(bad)
    except ValueError:pass
    else:raise AssertionError(description)
gapped=list(values);gapped[100]|=1<<306
assert not decode_values(gapped)[2]['continuous_primary_audio']
assert not decode_values(gapped)[2]['joint_audio_usable']

                                                                               
with tempfile.TemporaryDirectory() as tmp:
    folder=Path(tmp);f=folder/'audio_00.csv';manifest=folder/'debug_protocol.json'
    with f.open('w',newline='') as stream:
        writer=csv.writer(stream);writer.writerow(['Sample in Buffer','debug_trace[312:0]'])
        for n,value in enumerate(values):writer.writerow([n,hex(value)[2:]])
    for version in (None,'compact313_v1','compact313_v2','compact313_48k_v3'):
        if version:manifest.write_text(json.dumps(dict(version=version)))
        if version=='compact313_48k_v3':assert read_values(f)==values
        else:
            try:read_values(f)
            except ValueError:pass
            else:raise AssertionError('Legacy or unmarked capture accepted as R13')

(P/'reports/portable_decoder_test.json').write_text(json.dumps(dict(passed=True,hardware_validation=False,cases=['signed waveforms','sequence wrap','atomic metadata','missing/invalid sample rejection','raw ADC2 faults may be repaired','hard gaps still reject joint continuity']),indent=2))
print('PORTABLE COMPACT TRACE DECODER PASS')
