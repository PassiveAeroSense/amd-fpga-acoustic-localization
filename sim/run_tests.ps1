$ErrorActionPreference='Stop'
$root=Split-Path $PSScriptRoot -Parent
$names=@('r27_key','r27_pages','live_detection','r20_radar','r24_control','r19_grid_interface')
& (Join-Path $root 'src/03_test.ps1') -Names $names
if($LASTEXITCODE -ne 0){throw 'RTL regression failed'}
New-Item -ItemType Directory -Force -Path (Join-Path $PSScriptRoot 'results') | Out-Null
Copy-Item (Join-Path $root 'src/pure_rtl/reports/*') (Join-Path $PSScriptRoot 'results') -Recurse -Force
[ordered]@{
 status='PASS'
 completed_at=(Get-Date -Format o)
 rtl_cases=$names
 scope='Six RTL module/interface/display regressions. No microphone-to-position end-to-end acoustic accuracy claim.'
 logs=@($names | ForEach-Object {"results/test_$_.log"})
} | ConvertTo-Json -Depth 4 | Set-Content -LiteralPath (Join-Path $PSScriptRoot 'validation_record.json') -Encoding utf8
