"""Check all 360 transcribed PDF rows and print reproducible summary statistics.

Uses only the standard library. Does not run audio inference or FPGA hardware.
"""
from pathlib import Path
import json
import math
import statistics

ROOT = Path(__file__).resolve().parents[2]


def percentile(values, q):
    values = sorted(values)
    index = (len(values) - 1) * q
    lo = math.floor(index)
    hi = math.ceil(index)
    return values[lo] + (values[hi] - values[lo]) * (index - lo)


def main():
    rows = json.loads((ROOT / 'data/measured_localization/localization_360_points.json').read_text('utf-8'))
    assert [r['id'] for r in rows] == list(range(1, 361))
    groups = {}
    for r in rows:
        assert r['pdf_page'] == (r['id'] - 1) // 30 + 1
        p, v = r['reference_xyz_m'], r['array_xyz_m']
        groups.setdefault(tuple(p[:2]), []).append(r)
        distance = math.dist(p, v)
        angle = math.degrees(math.acos(max(-1, min(1, sum(a*b for a, b in zip(p, v)) / (math.hypot(*p) * math.hypot(*v))))))
        azimuth = abs((math.degrees(math.atan2(v[1], v[0])) - math.degrees(math.atan2(p[1], p[0])) + 180) % 360 - 180)
        assert abs(distance - r['reported_spatial_distance_m']) <= 0.00051, r['id']
        assert abs(angle - r['reported_spatial_angle_deg']) <= 0.0051, r['id']
        reported = r['reported_azimuth_error_deg']
        assert (azimuth < 0.01 if reported == '<0.01' else abs(azimuth - float(reported)) <= 0.0051), r['id']
    assert len(groups) == 72 and all(len(g) == 5 for g in groups.values())
    summary = {'status': 'PASS', 'rows': len(rows), 'horizontal_positions': len(groups),
               'basis': 'PDF reported error columns, all rows retained; P95 uses linear interpolation at (n-1)*0.95',
               'metrics': {}}
    for key in ('reported_spatial_distance_m', 'reported_spatial_angle_deg'):
        values = [r[key] for r in rows]
        summary['metrics'][key] = {
            'mean': statistics.mean(values), 'median': statistics.median(values),
            'rmse': math.sqrt(statistics.mean(x*x for x in values)),
            'p95': percentile(values, 0.95), 'max': max(values),
            'max_id': rows[values.index(max(values))]['id']}
    summary['distance_le_1m_count'] = sum(r['reported_spatial_distance_m'] <= 1 for r in rows)
    summary['angle_le_5deg_count'] = sum(r['reported_spatial_angle_deg'] <= 5 for r in rows)
    print(json.dumps(summary, ensure_ascii=False, indent=2))


if __name__ == '__main__':
    main()
