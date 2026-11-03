                                                                                          
from pathlib import Path
import subprocess,hashlib,json,shutil,sys,datetime,os,re,time
root=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(root.parent))
from toolchain import work_root,executable
name=root.parent.name
pending_allowed='--pending-cosim' in sys.argv
work=work_root()/('r28_'+name+'_'+datetime.datetime.now().strftime('%Y%m%d_%H%M%S'))
work.mkdir(parents=True,exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest().upper()
files=list((root/'rtl').glob('*.sv'))+list((root/'rtl').glob('*.vh'))+list((root/'rom').glob('*.mem'))+list(root.glob('*.xdc'))+[root/'scripts/build_board.tcl']
manifest=[dict(name=p.name,sha256=sha(p)) for p in files]
for f in files:shutil.copy2(f,work/f.name)
(work/'source_manifest.json').write_text(json.dumps(manifest,indent=2))
hls=root.parent/'hls';hm=[]
for top in json.loads((hls/'active_ips.json').read_text()):
 folder=hls/'ip_repo'/top;info=json.loads((folder/'build.json').read_text())
 assert info['csim'] and info['csynth'] and (info['cosim'] or (pending_allowed and info.get('pending_cosim') and top=='joint_search_hls')),top
 shutil.copytree(folder/'ip',work/'hls_ip_repo'/top)
 for f in (folder/'rtl').glob('*.dat'):shutil.copy2(f,work/f.name)
 for f in sorted((folder/'ip').rglob('*')):
  if f.is_file():hm.append(dict(path=f.relative_to(hls).as_posix(),sha256=sha(f)))
(work/'hls_manifest.json').write_text(json.dumps(hm,indent=2))
print('BUILD WORK',work,flush=True)
tool=executable('vivado','VIVADO_BIN','XILINX_VIVADO')
with (work/'console.log').open('w') as log:
 result=subprocess.run([tool,'-mode','batch','-source','build_board.tcl','-log','build_board.log','-journal','build_board.jou'],cwd=work,stdout=log,stderr=subprocess.STDOUT,creationflags=0x08000000)
text=(work/'build_board.log').read_text(errors='replace')
if result.returncode or 'BOARD_BUILD_TIMING_PASS' not in text:
 print(text[-8000:]);raise SystemExit('Build failed: '+str(work))
assert 'NO_DEBUG_NETLIST_AUDIT_PASS' in text
assert 'All user specified timing constraints are met.' in (work/'board_routed_timing.rpt').read_text()
assert 'VIOLATED' not in (work/'board_bus_skew.rpt').read_text()
                                                                              
                                                                               
validation_start=time.monotonic()
while True:
 pending=[]
 for top in json.loads((hls/'active_ips.json').read_text()):
  info=json.loads((hls/'ip_repo'/top/'build.json').read_text())
  if info.get('validation_failed'):raise RuntimeError('HLS validation failed: '+top)
  if not (info.get('csim') and info.get('csynth') and info.get('cosim')):pending.append(top)
 if not pending:break
 if not pending_allowed or time.monotonic()-validation_start>7200:raise RuntimeError('Unverified HLS IP: '+str(pending))
 print('ROUTED CANDIDATE ONLY; awaiting C/RTL verification of '+','.join(pending),flush=True)
 time.sleep(30)
for f,row in zip(files,manifest):assert sha(f)==row['sha256'],f
for row in hm:assert sha(hls/row['path'])==row['sha256'],row
dest=root/'delivery';dest.mkdir(exist_ok=True)
for f in list(work.glob('board_*.rpt'))+[work/n for n in ('acoustic_top.bit','acoustic_top.bin','source_manifest.json','hls_manifest.json','build_board.log','no_debug_audit.txt')]:shutil.copy2(f,dest/f.name)
(dest/'bitstream.sha256').write_text(sha(dest/'acoustic_top.bit')+'  acoustic_top.bit\n')
(dest/'source_updated_rebuild_required.txt').unlink(missing_ok=True)
(dest/'build_record.json').write_text(json.dumps(dict(work=str(work),bit_sha256=sha(dest/'acoustic_top.bit'),no_debug=True,variant=name),indent=2))
print('R28 TIMING-QUALIFIED NO-DEBUG BUILD COMPLETE',dest)
