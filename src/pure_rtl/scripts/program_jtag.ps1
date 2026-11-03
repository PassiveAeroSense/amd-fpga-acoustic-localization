param()
$ErrorActionPreference='Stop'
. (Join-Path (Split-Path (Split-Path $PSScriptRoot -Parent) -Parent) 'toolchain.ps1')
$rtlRoot=Split-Path $PSScriptRoot -Parent

if(Test-Path -LiteralPath (Join-Path $rtlRoot 'delivery/source_updated_rebuild_required.txt')){throw 'Rebuild required'}
$bit=Join-Path $rtlRoot 'delivery/acoustic_top.bit'
$expected=((Get-Content (Join-Path $rtlRoot 'delivery/bitstream.sha256') -Raw).Trim() -split '\s+')[0]
if((Get-FileHash -LiteralPath $bit).Hash -ne $expected){throw 'Bitstream hash mismatch'}
$cfg=Get-Content (Join-Path (Split-Path $rtlRoot -Parent) 'variant.json') -Raw -Encoding UTF8 | ConvertFrom-Json
Write-Output ("Variant "+$cfg.name+"; physical array center spacing "+$cfg.baseline_mm+" mm; Current-window A1 detector.")
$work=Join-Path (Get-ProjectWorkRoot) ('r27_jtag_'+(Get-Date -Format 'yyyyMMdd_HHmmss_fff'))
New-Item -ItemType Directory -Path $work | Out-Null
Copy-Item -LiteralPath $bit -Destination (Join-Path $work 'acoustic_top.bit')
Copy-Item -LiteralPath (Join-Path $PSScriptRoot 'program_jtag.tcl') -Destination $work
Push-Location $work
try{
 & (Join-Path (Get-VivadoBin) 'vivado.bat') -mode batch -source program_jtag.tcl -log program.log -journal program.jou
 if($LASTEXITCODE -ne 0 -or (Get-Content program.log -Raw) -notmatch 'R28_SRAM_PROGRAMMED'){throw 'JTAG programming failed'}
 $out=Join-Path $rtlRoot 'reports/jtag';New-Item -ItemType Directory -Path $out -Force | Out-Null
 Copy-Item program.log (Join-Path $out ((Get-Date -Format 'yyyyMMdd_HHmmss')+'.log'))
 Write-Output 'SRAM programmed; no Flash and no readback cores. Allow quiet startup calibration.'
}finally{Pop-Location}
