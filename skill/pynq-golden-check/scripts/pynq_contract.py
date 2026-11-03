"""Validate a portable single-packet AXI simple DMA contract, without loading hardware."""
from pathlib import Path
import argparse, hashlib, json, math, re
import numpy as np

def validate(contract, directory=None):
    if contract.get('schema_version') != 1 or contract.get('dma_mode') != 'simple':
        raise ValueError('Schema 1 and AXI DMA simple mode required')
    for key in ('board', 'pynq_version', 'dma_instance', 'numeric_convention'):
        if not isinstance(contract.get(key),str) or not contract[key].strip():
            raise ValueError('Missing '+key)
    if contract.get('output_packet') != 'one_tlast_per_transfer':
        raise ValueError('Declare one output TLAST per transfer')
    timeout=contract.get('timeout_s')
    if isinstance(timeout,bool) or not isinstance(timeout,(float,int)) or not math.isfinite(timeout) or timeout<=0:
        raise ValueError('Positive finite timeout required')
    limit=contract.get('max_transfer_bytes')
    if type(limit) is not int or limit<=0:raise ValueError('Invalid DMA length limit')
    sizes={}
    for key in ('input','output'):
        spec=contract[key];shape=spec.get('shape')
        if not isinstance(shape,list) or not shape or any(type(x) is not int or x<=0 for x in shape):
            raise ValueError('Positive integer shape required: '+key)
        dt=np.dtype(spec['dtype'])
        if dt.kind not in 'iufc' or dt.byteorder=='>' or not dt.isnative:
            raise ValueError('Native little-endian numeric dtype required: '+key)
        size=math.prod(shape)*dt.itemsize
        if size>limit:raise ValueError('DMA length exceeds contract: '+key)
        sizes[key]=size
    for key in ('atol','rtol'):
        val=contract.get(key)
        if isinstance(val,bool) or not isinstance(val,(int,float)) or not math.isfinite(val) or val<0:
            raise ValueError('Finite nonnegative tolerance required')
    if np.dtype(contract['output']['dtype']).kind in 'iu' and (contract['atol'] or contract['rtol']):
        raise ValueError('Integer comparison is exact; decode fixed point explicitly for tolerances')
    artifacts=contract['artifacts']
    bit=Path(artifacts['bit']['file']);hwh=Path(artifacts['hwh']['file'])
    if bit.suffix!='.bit' or hwh.suffix!='.hwh' or bit.with_suffix('')!=hwh.with_suffix(''):
        raise ValueError('Matching bit/hwh names and directories required')
    for role in ('bit','hwh'):
        row=artifacts[role];p=Path(row['file'])
        if p.is_absolute() or '..' in p.parts:raise ValueError('Artifact must be relative to contract directory')
        if not re.fullmatch('[0-9a-fA-F]{64}',row['sha256']):raise ValueError('Invalid SHA-256')
        if directory is not None:
            target=Path(directory)/p
            if hashlib.sha256(target.read_bytes()).hexdigest().lower()!=row['sha256'].lower():
                raise ValueError('Artifact hash mismatch: '+role)
    return {'status':'PASS','buffer_bytes':sizes,'hardware_executed':False,
            'scope':'Contract and optional artifact hashes only; no board, IP semantics or timing validation'}

def check_metadata(contract, ip_dict):
    validate(contract)
    item=ip_dict.get(contract['dma_instance'])
    if not item or not item.get('type','').startswith('xilinx.com:ip:axi_dma:'):
        raise ValueError('Declared AXI DMA instance not found')
    params=item.get('parameters',{})
    if str(params.get('C_INCLUDE_SG'))!='0':raise ValueError('Simple DMA metadata required')
    for key in ('C_INCLUDE_MM2S','C_INCLUDE_S2MM'):
        if str(params.get(key))!='1':raise ValueError('Both DMA channels required')
    bits=int(params['C_SG_LENGTH_WIDTH'])
    if not 1<=bits<=26 or contract['max_transfer_bytes']>2**bits-1:
        raise ValueError('Contract length exceeds hardware metadata')
    return True

if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('contract');p.add_argument('--check-artifacts',action='store_true');a=p.parse_args()
    path=Path(a.contract);c=json.loads(path.read_text('utf-8'))
    print(json.dumps(validate(c,path.parent if a.check_artifacts else None),indent=2))
