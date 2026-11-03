param([string]$BuildDir='')
$ErrorActionPreference='Stop'
. (Join-Path (Split-Path (Split-Path $PSScriptRoot -Parent) -Parent) 'toolchain.ps1')
$pythonPath=Get-ProjectPython
if($BuildDir){$env:FPGA_WORK_ROOT=$BuildDir}
& $pythonPath (Join-Path $PSScriptRoot 'build_portable.py')
if($LASTEXITCODE -ne 0){throw 'Build failed; the prior delivery was not replaced.'}
