$ErrorActionPreference='Stop'
$root=Split-Path $PSScriptRoot -Parent
& (Join-Path $root 'src/02_build.ps1')
if($LASTEXITCODE -ne 0){throw 'Board build failed'}
New-Item -ItemType Directory -Force -Path (Join-Path $root 'build/results'),(Join-Path $root 'board/bitstream') | Out-Null
Copy-Item (Join-Path $root 'src/pure_rtl/delivery/*') (Join-Path $root 'build/results') -Force
foreach($name in @('acoustic_top.bit','acoustic_top.bin','bitstream.sha256')){
 Copy-Item (Join-Path $root ('src/pure_rtl/delivery/'+$name)) (Join-Path $root ('board/bitstream/'+$name)) -Force
}
Write-Output 'Build and bitstream copies updated. Validate the new bitstream on the board.'
