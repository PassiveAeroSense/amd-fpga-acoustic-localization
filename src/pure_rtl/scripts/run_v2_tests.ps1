param([string]$WorkRoot='',[string[]]$Names=@('r27_key','r27_pages','live_detection','r20_radar','r24_control'))
$Kind='TingKong_DualArray'
$ErrorActionPreference='Stop'
. (Join-Path (Split-Path (Split-Path $PSScriptRoot -Parent) -Parent) 'toolchain.ps1')
$rtlRoot=Split-Path $PSScriptRoot -Parent
foreach($name in $Names){
 if($name -notmatch '^[a-z0-9_]+$' -or !(Test-Path -LiteralPath (Join-Path $rtlRoot "tests/tb_$name.sv"))){throw "Unknown or missing testbench: $name"}
}
if(!$WorkRoot){$WorkRoot=Get-ProjectWorkRoot}
New-Item -ItemType Directory -Path $WorkRoot -Force | Out-Null
$simRoot=Join-Path $WorkRoot ('verify_'+$Kind+'_'+(Get-Date -Format 'yyyyMMdd_HHmmss_fff'))
$vivadoBin=Get-VivadoBin
New-Item -ItemType Directory -Path $simRoot -Force | Out-Null
Copy-Item "$rtlRoot\rtl\*.sv","$rtlRoot\rtl\*.vh","$rtlRoot\rom\*.mem","$rtlRoot\tests\*.sv","$rtlRoot\tests\*.vh" -Destination $simRoot -Force
Get-ChildItem "$rtlRoot\tests\*.mem" | Copy-Item -Destination $simRoot -Force
$snapshot=Get-ChildItem -LiteralPath $simRoot -File | Where-Object {$_.Extension -in '.sv','.vh','.mem'} | ForEach-Object {[pscustomobject]@{name=$_.Name;sha256=(Get-FileHash -LiteralPath $_.FullName -Algorithm SHA256).Hash}}
$snapshot | ConvertTo-Json | Set-Content (Join-Path $rtlRoot 'reports/test_source_manifest.json') -Encoding utf8
$hlsRoot=Join-Path (Split-Path $rtlRoot -Parent) 'hls'
$ipNames=Get-Content -LiteralPath (Join-Path $hlsRoot 'active_ips.json') -Raw | ConvertFrom-Json
foreach($ipName in $ipNames){
 $ipRtl=Join-Path $hlsRoot ("ip_repo/"+$ipName+"/rtl")
 Get-ChildItem -LiteralPath $ipRtl -File | Where-Object {$_.Extension -in '.v','.dat'} | Copy-Item -Destination $simRoot
}
Push-Location $simRoot
try {
 $sources=@(Get-ChildItem -File | Where-Object {$_.Extension -in '.sv','.v'} | ForEach-Object Name)
 $sources | ForEach-Object {'sv work "'+$_+'"'} | Set-Content -LiteralPath 'sources.prj' -Encoding ascii
 & "$vivadoBin\xvlog.bat" --prj sources.prj > compile.log 2>&1
 if($LASTEXITCODE -ne 0){Get-Content compile.log -Tail 30;throw 'compile failed'}
 & "$vivadoBin\xvlog.bat" "$vivadoBin\..\data\verilog\src\glbl.v" >> compile.log 2>&1
 foreach($name in $Names){
  $tops=@("tb_$name");if($name -in @('health','detection_independence','v2_integration','scope_top','r3_integration','debug_layout','dual_integration','innovation_integration','xyz_integration','dual_repair_integration','r13_pipeline','r27_pipeline')){$tops+='glbl'}
  & "$vivadoBin\xelab.bat" @tops -s "test_$name" -L unisims_ver > "elaborate_$name.log" 2>&1
  if($LASTEXITCODE -ne 0){Get-Content "elaborate_$name.log" -Tail 25;throw "elaborate $name"}
  & "$vivadoBin\xsim.bat" "test_$name" -runall -log "test_$name.log" > "console_$name.log" 2>&1
  $simExitCode=$LASTEXITCODE
  $result=Get-Content "test_$name.log" -Raw
  Copy-Item "test_$name.log" "$rtlRoot\reports" -Force
  $caseSnapshot=Get-ChildItem -LiteralPath $simRoot -File | Where-Object {$_.Extension -in '.sv','.vh','.v','.mem','.dat'} | ForEach-Object {[pscustomobject]@{name=$_.Name;sha256=(Get-FileHash -LiteralPath $_.FullName -Algorithm SHA256).Hash}}
  New-Item -ItemType Directory -Path (Join-Path $rtlRoot 'reports/test_snapshots') -Force | Out-Null
  [pscustomobject]@{work=$simRoot;files=$caseSnapshot} | ConvertTo-Json -Depth 4 | Set-Content (Join-Path $rtlRoot ("reports/test_snapshots/"+$name+".json")) -Encoding utf8
  if($simExitCode -ne 0 -or $result -match '(?im)\bFatal:|\bError:|ERROR:' -or $result -notmatch '\$finish called'){Get-Content "test_$name.log" -Tail 30;throw "failed $name"}
  Write-Output "PASS $Kind $name"
 }
 Get-ChildItem -File -Filter '*_out.txt' | Copy-Item -Destination "$rtlRoot\reports" -Force
 if(($Names -contains 'rate48') -or ($Names -contains 'stft16_schedule')){
  $pythonPath=Get-ProjectPython
  if($Names -contains 'rate48'){
   & $pythonPath (Join-Path $PSScriptRoot 'generate_48k.py') $simRoot
   if($LASTEXITCODE -ne 0){throw '48k filters numeric comparison failed'}
  }
  if($Names -contains 'stft16_schedule'){
   & $pythonPath (Join-Path $PSScriptRoot 'verify_stft48.py') $simRoot
   if($LASTEXITCODE -ne 0){throw '48k FFT numeric comparison failed'}
  }
 }
} finally {Pop-Location}
