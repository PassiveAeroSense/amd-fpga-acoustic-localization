"""Check the revised paper's statistics recomputed from PDF coordinates."""
from pathlib import Path
import json
import subprocess
import sys
import tempfile


def run():
    with tempfile.TemporaryDirectory(prefix='localization_360_') as work:
        subprocess.run([sys.executable, str(Path(__file__).with_name('reproduce_localization_figures.py')),
                        '--output-dir', work, '--stats-only'], check=True, capture_output=True)
        stats = json.loads((Path(work)/'stats.json').read_text('utf-8'))
    expected = {'height_mae': .32455555555555554, 'position_median': .4068777988390473,
                'height_group_min': .056923076923076965, 'height_group_max': .7792307692307693,
                'fence': 1.2838331764833506}
    for key,value in expected.items():
        if abs(stats[key]-value)>1e-10:
            raise ValueError(f'Revised paper statistic differs: {key}')
    if stats['marked_ids'] != [5,250,255,257,277,296,318,347,351,353,354,360]:
        raise ValueError('Tukey marked sample IDs differ')
    last=stats['distance_bins'][-1]
    if (last['lo'],last['hi'],last['n']) != (14,16,9) or abs(last['angle_median']-2.509076738)>1e-8:
        raise ValueError('Terminal distance bin differs')
    return {'status':'PASS','scope':'All 360 PDF coordinate rows, including all marked samples; unrounded coordinate-derived errors.', **stats}


if __name__=='__main__':
    print(json.dumps(run(),ensure_ascii=False,indent=2))
