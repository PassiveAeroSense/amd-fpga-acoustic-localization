"""Normalize generated HLS filenames while preserving case-sensitive HDL identifiers."""
from pathlib import Path
root=Path(__file__).resolve().parents[1]/'src/hls/ip_repo'
changes={p.name:p.name.lower() for p in root.rglob('*') if p.name!=p.name.lower() and '.Xil' not in p.parts}
for p in root.rglob('*'):
    if p.is_file() and '.Xil' not in p.parts and p.suffix.lower() in ['.v','.sv','.vh','.vhd','.xml','.tcl','.json','.prj','.txt']:
        try:text=p.read_text('utf-8-sig')
        except UnicodeDecodeError:continue
        original=text
        for before,after in changes.items():text=text.replace(before,after)
        if text!=original:p.write_text(text,'utf-8')
for p in sorted(root.rglob('*'),key=lambda x:len(x.parts),reverse=True):
    if p.name in changes:
        tmp=p.with_name(p.name+'.rename_tmp');p.rename(tmp);tmp.rename(p.with_name(changes[p.name]))
print('Normalized generated filenames:',len(changes))
