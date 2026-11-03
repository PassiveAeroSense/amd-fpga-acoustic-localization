"""Design report appendix A/B entrypoint for archived numerical checks.

Run from the submission root: python sim/analysis/reproduce_paper_checks.py
Checks archived evidence and source configuration; does not rerun audio or FPGA.
"""
from contextlib import redirect_stdout
from io import StringIO
from pathlib import Path
import hashlib
import json
import re

from check_frozen_evidence import run as check_frozen
from check_measured_localization import main as check_measured
from check_localization_statistics import run as check_revised_statistics

ROOT = Path(__file__).resolve().parents[2]


def check_configuration():
    variant_path = ROOT / 'src/variant.json'
    config_path = ROOT / 'src/pure_rtl/rtl/r19_config.vh'
    grid_path = ROOT / 'src/pure_rtl/rom/r19_grid.mem'
    variant = json.loads(variant_path.read_text('utf-8'))
    defines = dict(re.findall(r'`define\s+(R19_\w+)\s+(\d+)', config_path.read_text('utf-8')))
    fields = {'horizontal_mm': ('R19_HORIZONTAL_MM', 11000),
              'vertical_mm': ('R19_VERTICAL_MM', 10000),
              'baseline_mm': ('R19_BASELINE_MM', 2000),
              'frames': ('R19_FRAMES', 7),
              'grid_points': ('R19_GRID_POINTS', 12479)}
    for key, (macro, expected) in fields.items():
        if variant[key] != expected or int(defines[macro]) != expected:
            raise ValueError(f'Configuration mismatch: {key}')
    grid = [line.strip() for line in grid_path.read_text('ascii').splitlines() if line.strip()]
    if len(grid) != variant['grid_points'] or any(not re.fullmatch(r'[0-9a-fA-F]+', x) for x in grid):
        raise ValueError('Grid ROM length or encoding mismatch')
    if variant['window_samples'] != 22528 or abs(variant['window_seconds'] - 22528 / 48000) > 1e-12:
        raise ValueError('Window configuration mismatch')
    return {'status': 'PASS', **{key: variant[key] for key in fields},
            'window_samples': variant['window_samples'],
            'window_seconds': variant['window_seconds'],
            'sample_rate_hz_derived_from_window': 48000,
            'input_sha256': {p.relative_to(ROOT).as_posix(): hashlib.sha256(p.read_bytes()).hexdigest()
                             for p in (variant_path, config_path, grid_path)}}


def main():
    frozen = check_frozen()
    configuration = check_configuration()
    output = StringIO()
    with redirect_stdout(output):
        check_measured()
    measured = json.loads(output.getvalue())
    result = {'status': 'PASS',
              'scope': 'Archived JSON/NPZ numerical consistency, source configuration and 360 measured rows. No raw-audio inference or hardware execution.',
              'frozen_evidence': frozen, 'configuration': configuration,
              'measured_localization': measured,
              'revised_localization_statistics': check_revised_statistics()}
    print(json.dumps(result, ensure_ascii=False, indent=2))


if __name__ == '__main__':
    main()
