"""Check internal consistency of frozen offline results; not a hardware test."""
from pathlib import Path
import hashlib
import json
import numpy as np

ROOT = Path(__file__).resolve().parents[2]
EVIDENCE = ROOT / 'data/paper_evidence'
ORIGINAL = EVIDENCE / 'original/data/analysis'

def read(path):
    return json.loads(path.read_text(encoding='utf-8-sig'))

def run():
    summary_path = ORIGINAL / 'optimized_detection_20261024/detection_summary.json'
    scores_path = EVIDENCE / 'detection_plot_data.npz'
    summary = read(summary_path)
    row = next(r for r in summary['heights'] if r['height'] == 120)
    with np.load(scores_path, allow_pickle=False) as scores:
        values = scores['smoothed_scores']
        time_s = scores['time_s']
        threshold = float(scores['threshold'])
        assert values.shape == (len(time_s), 2)
        assert np.isfinite(values).all() and np.isfinite(threshold)
        assert np.all(np.diff(time_s) > 0)
        hits = (values > threshold).sum(axis=0).tolist()
        assert hits == row['hits'] == [0, 34]
        assert len(time_s) == row['windows'] == 124
    assert row['previous_hits'] == [0, 3]
    backgrounds = [(r['windows'], sum(r['hits'])) for r in summary['background_calibration']]
    assert backgrounds == [(226, 0), (99, 0)]
    phone_path = ORIGINAL / 'optimized_detection_20261024/additional_audio_20261024/background_results.json'
    phone = read(phone_path)['m4a']
    assert phone['windows'] == 116 and phone['hits'] == [0, 0, 0]
    stream_path = ORIGINAL / 'algorithm_trials_20261024/final_stream_results.json'
    stream = read(stream_path)
    cases = []
    for index, expected in [(2, (5.34, 3.70)), (26, (5.11, 3.22)), (9, (9.44, 2.08))]:
        frames = [f for f in stream[index]['frames'] if f['valid_direction']]
        old = float(np.median([f['baseline_coarse_direction_deviation_deg'] for f in frames]))
        new = float(np.median([f['coarse_direction_deviation_deg'] for f in frames]))
        assert np.isfinite([old, new]).all()
        assert abs(old-expected[0]) < .011 and abs(new-expected[1]) < .011
        cases.append(dict(record_id=index, valid_windows=len(frames), baseline_median_deg=old, improved_median_deg=new))
    return dict(status='PASS', scope='Internal consistency of supplied frozen JSON/NPZ offline evaluation results. No raw-audio rerun, new accuracy experiment or hardware execution.',
                detection_120m=dict(a2_hits=hits[1], windows=124, previous_a2_hits=3),
                backgrounds=[dict(windows=n, hits=h) for n,h in backgrounds]+[dict(windows=116,hits=0)],
                offline_doa_cases=cases,
                input_sha256={p.relative_to(ROOT).as_posix(): hashlib.sha256(p.read_bytes()).hexdigest() for p in [summary_path,scores_path,phone_path,stream_path]})

if __name__ == '__main__':
    result = run()
    destination = ROOT / 'sim/results/frozen_evidence_check.json'
    destination.parent.mkdir(parents=True, exist_ok=True)
    destination.write_text(json.dumps(result, ensure_ascii=False, indent=2)+'\n', encoding='utf-8')
    print(json.dumps(result, ensure_ascii=False, indent=2))
