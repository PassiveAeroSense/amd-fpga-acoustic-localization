"""Portable tool lookup for the Windows Vivado / Vitis 2024.2 workflow."""
from pathlib import Path
import os,shutil,tempfile
def work_root():
    p=Path(os.environ.get('FPGA_WORK_ROOT',str(Path(tempfile.gettempdir())/'drone_acoustic_r28')))
    p.mkdir(parents=True,exist_ok=True)
    return p
def executable(program,bin_env,root_env):
    candidates=[]
    if os.environ.get(bin_env):candidates.append(Path(os.environ[bin_env])/(program+'.bat'))
    if os.environ.get(root_env):candidates.append(Path(os.environ[root_env])/'bin'/(program+'.bat'))
    found=shutil.which(program+'.bat') or shutil.which(program)
    if found:candidates.append(Path(found))
    for p in candidates:
        if p.is_file():return str(p)
    raise FileNotFoundError(f'Set {bin_env} to the tool bin directory, or initialize the vendor environment: {program}')
