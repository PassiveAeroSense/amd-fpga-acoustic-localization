$ErrorActionPreference='Stop'
$root=Split-Path $PSScriptRoot -Parent
$delivery=Join-Path $root 'src/pure_rtl/delivery'
if(Test-Path -LiteralPath (Join-Path $delivery 'source_updated_rebuild_required.txt')){throw 'HLS changed: rebuild the board first'}
foreach($name in @('acoustic_top.bit','bitstream.sha256')){
 Copy-Item (Join-Path $PSScriptRoot ('bitstream/'+$name)) (Join-Path $delivery $name) -Force
}
& (Join-Path $root 'src/01_download.ps1')
if($LASTEXITCODE -ne 0){throw 'Board programming failed'}
