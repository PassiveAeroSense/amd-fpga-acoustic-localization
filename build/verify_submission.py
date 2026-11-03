"""Verify the frozen submission manifest, then report filenames and directory layout."""
from pathlib import Path
import hashlib,json,re,sys
root=Path(__file__).resolve().parents[1]
ignored={'.git','__pycache__','.pytest_cache'}
manifest=json.loads((root/'build/submission_manifest.json').read_text('utf-8'))
errors=[]
for rel,digest in manifest['sha256'].items():
 p=root/rel
 if not p.is_file() or hashlib.sha256(p.read_bytes()).hexdigest()!=digest:errors.append(rel)
extra=[]
for p in root.rglob('*'):
 if ignored.intersection(p.relative_to(root).parts):continue
 if p.is_file() and p.relative_to(root).as_posix() not in manifest['sha256'] and p.name!='submission_manifest.json':extra.append(p.relative_to(root).as_posix())
bad=[p.relative_to(root).as_posix() for p in root.rglob('*') if not ignored.intersection(p.relative_to(root).parts) and p.name not in ('README.md','SKILL.md') and not re.fullmatch(r'[a-z0-9_.-]+',p.name)]
result={'status':'FAIL' if errors or extra or bad else 'PASS','verified_files':len(manifest['sha256']),'changed_or_missing':errors,'extra_files':extra,'invalid_names':bad,'naming_note':'README.md follows the guide example; SKILL.md is the skill entrypoint convention. All other submission paths use lower-case ASCII.'}
print(json.dumps(result,indent=2));sys.exit(result['status']!='PASS')
