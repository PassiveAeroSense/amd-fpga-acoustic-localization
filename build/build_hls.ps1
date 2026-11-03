$ErrorActionPreference='Stop'
$root=Split-Path $PSScriptRoot -Parent
& (Join-Path $root 'src/08_build_hls.ps1')
if($LASTEXITCODE -ne 0){throw 'HLS build failed'}
. (Join-Path $root 'src/toolchain.ps1')
$pythonPath=Get-ProjectPython
& $pythonPath (Join-Path $PSScriptRoot 'normalize_exports.py')
if($LASTEXITCODE -ne 0){throw 'HLS filename normalization failed'}
