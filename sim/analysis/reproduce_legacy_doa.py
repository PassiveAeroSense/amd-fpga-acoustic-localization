"""Rebuild the paper's paired streaming DOA examples from archived raw SMQ files.

No archived covariance, calibration, gate or inference output is used as input.
Run --help for stages. Outputs must be outside the submission directory.
"""
from pathlib import Path, PurePosixPath
import argparse
import hashlib
import json
import os
import sys
import zipfile

ROOT = Path(__file__).resolve().parents[2]
CODE = Path(__file__).parent / 'legacy_doa'
STAGES = ['prepare', 'features', 'calibrate', 'gates', 'infer', 'evaluate']


def read(p):
    return json.loads(p.read_text('utf-8-sig'))


def write(p, value):
    p.parent.mkdir(parents=True, exist_ok=True)
    p.write_text(json.dumps(value, ensure_ascii=False, indent=2) + '\n', 'utf-8')


def digest(p):
    h = hashlib.sha256()
    with p.open('rb') as f:
        for block in iter(lambda: f.read(1024 * 1024), b''):
            h.update(block)
    return h.hexdigest()


def prepare(work):
    index = read(ROOT / 'data/recording_index.json')
    # Keep original names: their lexical ordering defines the historical IDs.
    selected = [r for r in index if PurePosixPath(r['original_path'].replace('\\', '/')).parent.name == '\u53cc\u9635\u5217-\u591c\u95f4']
    if not selected:
        raise ValueError('No dual-array night recordings in archive index')
    with zipfile.ZipFile(ROOT / 'data/recordings.zip') as archive:
        members = {PurePosixPath(n).name: n for n in archive.namelist() if not n.endswith('/')}
        for row in selected:
            rel = PurePosixPath(row['original_path'].replace('\\', '/'))
            if rel.is_absolute() or '..' in rel.parts or ':' in str(rel):
                raise ValueError('Unsafe index path')
            dest = work.joinpath(*rel.parts)
            dest.parent.mkdir(parents=True, exist_ok=True)
            if not dest.exists() or digest(dest) != row['sha256']:
                with archive.open(members[row['file']]) as src, dest.open('wb') as out:
                    for block in iter(lambda: src.read(1024 * 1024), b''):
                        out.write(block)
            if dest.stat().st_size != row['bytes'] or digest(dest) != row['sha256']:
                raise ValueError(f'Raw recording verification failed: {row["file"]}')
    import dual_night as night
    archived = read(ROOT / 'data/paper_evidence/original/data/analysis/dual_night_20261023/manifest.json')
    rows = []
    by_name = {PurePosixPath(r['original_path'].replace('\\', '/')).name: r for r in selected}
    for i, p in enumerate(sorted(night.ROOT.glob('*.smq'))):
        row = dict(id=i, file=p.name, path=str(p), nominal_xyz_m=night.label(p),
                   kind='background' if '\u73af\u5883' in p.stem else 'unlabelled' if night.label(p) is None else 'position',
                   sha256=by_name[p.name]['sha256'])
        # Archived metadata is only a cross-check of IDs, labels and raw hashes.
        for key in ['id', 'file', 'nominal_xyz_m', 'kind', 'sha256']:
            if row[key] != archived[i][key]:
                raise ValueError(f'Record mapping differs: {i}, {key}')
        rows.append(row)
    if len(rows) != len(archived):
        raise ValueError('Recording count differs')
    write(night.OUT / 'manifest.json', rows)
    write(work / 'recording_mapping.json', selected)
    print('Verified and restored', len(selected), 'archive members;', len(rows), 'SMQ recordings', flush=True)


def features():
    import algorithm_trials as trials
    trials.plan()
    trials.extract()


def calibrate():
    import numpy as np
    import algorithm_trials as trials
    import algorithm_calibrate as calibration
    calibration.VERSION = '_v2'
    calibration.fit()
    noise = np.load(trials.TROOT / 'noise_cov.npz')['noise']
    # The rotor gate needs only this deterministic harmonic feature, not the
    # exploratory near-field search also performed by algorithm_trials.main().
    for i in trials.DEV:
        cov = np.load(trials.TROOT / f'cov_{i:02d}.npz')['cov']
        model = trials.prepare(cov, noise, list(range(16)), 'harmonic_gevd')
        write(trials.TROOT / f'record_harmonic_{i:02d}.json',
              {'id': i, 'methods': {'harmonic_gevd': {'fundamental_hz': float(model['fundamental_hz'])}}})


def gates():
    import dual_improved_doa as doa
    # This intermediate was formerly produced interactively and not scripted.
    diagnostics = []
    for t, cov, _ in doa.frames(Path(doa.ROWS[33]['path'])):
        score, f0 = doa.gate_evidence(cov)
        diagnostics.append(dict(t=t, score=score, f0=f0))
    write(doa.SOUT / 'background_gate_diagnostics.json', diagnostics)
    doa.fit_gate()
    doa.fit_rotor_gate()
    doa.fit_persistent_gate()


def infer(ids):
    import dual_improved_doa as doa
    for i in ids:
        doa.run_one(Path(doa.ROWS[i]['path']), i)


def evaluate(work, ids):
    import numpy as np
    import dual_improved_doa as doa
    frozen = read(ROOT / 'data/paper_evidence/original/data/analysis/algorithm_trials_20261024/final_stream_results.json')
    cases = []
    for i in ids:
        row = doa.ROWS[i]
        labels = row['nominal_xyz_m']
        if labels is None or any(x is None for x in labels):
            continue
        result = read(doa.SOUT / f'record_{i:02d}.json')
        assert result['source_sha256'] == row['sha256']
        target = np.array(labels) / np.linalg.norm(labels)
        frames = [f for f in result['frames'] if f['valid_direction']]
        original = [f for f in frozen[i]['frames'] if f['valid_direction']]
        deviation = lambda u: float(np.degrees(np.arccos(np.clip(np.dot(u, target), -1, 1))))
        old = float(np.median([deviation(f['baseline']['direction']) for f in frames])) if frames else None
        new = float(np.median([deviation(f['direction']) for f in frames])) if frames else None
        expected_old = float(np.median([f['baseline_coarse_direction_deviation_deg'] for f in original])) if original else None
        expected_new = float(np.median([f['coarse_direction_deviation_deg'] for f in original])) if original else None
        matched = len(frames) == len(original) and all(a is None and b is None or a is not None and b is not None and abs(a-b) < 1e-6 for a,b in [(old,expected_old),(new,expected_new)])
        cases.append(dict(record_id=i, raw_sha256=row['sha256'], windows=len(result['frames']), valid_windows=len(frames),
                          baseline_median_deg=old, improved_median_deg=new, archived_valid_windows=len(original),
                          archived_baseline_median_deg=expected_old, archived_improved_median_deg=expected_new, matches_archive=matched))
    report = dict(status='PASS' if cases and all(c['matches_archive'] for c in cases) else 'MISMATCH',
                  scope='Raw SMQ -> covariance -> weak-label calibration -> background/rotor/persistence gates -> paired per-window DOA. Archived inference is used only for final comparison.', cases=cases)
    write(work / 'doa_comparison.json', report)
    print(json.dumps(report, ensure_ascii=False, indent=2), flush=True)
    if report['status'] != 'PASS':
        raise SystemExit(1)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--work-dir', type=Path, required=True)
    parser.add_argument('--stage', choices=['all'] + STAGES, default='all')
    parser.add_argument('--records', type=int, nargs='+', default=[2, 26, 9], help='Historical zero-based IDs; default: three paper examples')
    args = parser.parse_args()
    work = args.work_dir.resolve()
    if work == ROOT or ROOT in work.parents:
        parser.error('--work-dir must be outside the submission directory')
    if any(i < 0 or i >= 35 for i in args.records):
        parser.error('record IDs must be in 0..34')
    work.mkdir(parents=True, exist_ok=True)
    signature = {p.relative_to(ROOT).as_posix(): digest(p) for p in [Path(__file__).resolve(), ROOT/'data/recording_index.json', *sorted(CODE.glob('*.py'))]}
    stamp = work / 'pipeline_inputs.json'
    if stamp.exists() and read(stamp) != signature:
        parser.error('Code or input index changed; use a new work directory to avoid stale caches')
    if not stamp.exists() and any(work.iterdir()):
        parser.error('Use an empty directory or a workspace created by this pipeline')
    write(stamp, signature)
    os.environ['OPENBLAS_NUM_THREADS'] = '1'
    os.environ['OMP_NUM_THREADS'] = '1'
    os.chdir(work)
    sys.path.insert(0, str(CODE))
    stages = STAGES if args.stage == 'all' else [args.stage]
    for stage in stages:
        print('STAGE', stage, flush=True)
        if stage == 'prepare': prepare(work)
        elif stage == 'infer': infer(args.records)
        elif stage == 'evaluate': evaluate(work, args.records)
        else: globals()[stage]()
        write(work / f'{stage}_complete.json', {'status': 'PASS', 'stage': stage})


if __name__ == '__main__':
    main()
