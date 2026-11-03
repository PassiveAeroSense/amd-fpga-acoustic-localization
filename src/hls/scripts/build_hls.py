from pathlib import Path
import argparse,subprocess,json,hashlib,shutil,datetime,sys
root=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(root.parent))
from toolchain import work_root,executable
parser=argparse.ArgumentParser();parser.add_argument('top');parser.add_argument('--test',default='test_fft.cpp');parser.add_argument('--cosim',action='store_true');parser.add_argument('--csim-only',action='store_true');args=parser.parse_args()
work=work_root()/('r19_hls_'+args.top+'_'+datetime.datetime.now().strftime('%Y%m%d_%H%M%S'))
work.mkdir(parents=True);shutil.copytree(root/'src',work/'src');shutil.copy2(root/'tests'/args.test,work/args.test)
for f in (root/'tests').glob('*.mem'):shutil.copy2(f,work/f.name)
for f in (root/'tests').glob('*.hpp'):shutil.copy2(f,work/f.name)
top=args.top
assert top in json.loads((root/'active_ips.json').read_text()),top
tcl=['open_project -reset core',f'set_top {top}']
for f in sorted((work/'src').glob('*.cpp')):tcl.append(f'add_files src/{f.name} -cflags "-Isrc -std=c++14"')
for f in work.glob('*.mem'):tcl.append(f'add_files -tb {f.name}')
tcl += [f'add_files -tb {args.test} -cflags "-Isrc -std=c++14"','open_solution -reset solution1 -flow_target vivado','set_part xc7a200tfbg484-2',f'create_clock -period {10 if top.startswith("fir_") else 20}', 'config_rtl -reset_level low -reset control','csim_design -O']
if not args.csim_only:
 tcl+=['csynth_design']
 if args.cosim:tcl+=['cosim_design -rtl verilog -tool xsim']
 tcl+=['export_design -format ip_catalog -rtl verilog -vendor drone.self -library compute -version 1.0']
tcl+=['exit'];(work/'build.tcl').write_text('\n'.join(tcl))
tool=executable('vitis-run','VITIS_BIN','XILINX_VITIS')
print('HLS WORK',work,flush=True)
with (work/'console.log').open('w') as log:
 r=subprocess.run([tool,'--mode','hls','--tcl','build.tcl'],cwd=work,stdout=log,stderr=subprocess.STDOUT,creationflags=0x08000000)
text=(work/'console.log').read_text(errors='replace')
if r.returncode or 'CSim done with 0 errors' not in text:
 print(text[-12000:]);sys.exit(r.returncode or 1)
if args.csim_only:
 print('CSIM_ONLY_PASS',work);sys.exit(0)
sol=work/'core/solution1';out=root/'ip_repo'/top;out.mkdir(parents=True,exist_ok=True)
if not args.csim_only:
 assert (sol/'syn/verilog'/f'{top}.v').exists()
 (root.parent/'pure_rtl/delivery/source_updated_rebuild_required.txt').write_text('HLS IP changed; run 02_build.cmd before programming.\n')
                                                                                         
 for sub in ('rtl','ip','report'):
  target=(out/sub).resolve();assert target.is_relative_to((root/'ip_repo').resolve())
  if target.exists():shutil.rmtree(target)
 shutil.copytree(sol/'syn/verilog',out/'rtl',dirs_exist_ok=True)
 shutil.copytree(sol/'impl/ip',out/'ip',dirs_exist_ok=True)
 shutil.copytree(sol/'syn/report',out/'report',dirs_exist_ok=True)
 if args.cosim:
  rpt=sol/'sim/report'/f'{top}_cosim.rpt'
  assert 'Pass' in rpt.read_text(),rpt
  shutil.copy2(rpt,out/rpt.name)
sha=lambda f:hashlib.sha256(f.read_bytes()).hexdigest().upper()
manifest={f.name:sha(f) for f in (work/'src').iterdir() if f.is_file()}
result=dict(top=top,work=str(work),csim=True,csynth=not args.csim_only,cosim=args.cosim,source_sha256=manifest)
(out/'build.json').write_text(json.dumps(result,indent=2));shutil.copy2(work/'console.log',out/'build.log')
shutil.copytree(work/'src',out/'source_snapshot',dirs_exist_ok=True)
shutil.copy2(work/'build.tcl',out/'source_snapshot/build.tcl')
shutil.copy2(work/args.test,out/'source_snapshot'/args.test)
print(json.dumps(result,indent=2))
