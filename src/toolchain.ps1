function Get-ProjectPython {
 if($env:PYTHON){return $env:PYTHON}
 return (Get-Command python -ErrorAction Stop).Source
}
function Get-VivadoBin {
 if($env:VIVADO_BIN){$candidate=$env:VIVADO_BIN}
 elseif($env:XILINX_VIVADO){$candidate=Join-Path $env:XILINX_VIVADO 'bin'}
 else{$candidate=Split-Path (Get-Command vivado.bat -ErrorAction Stop).Source -Parent}
 if(!(Test-Path -LiteralPath (Join-Path $candidate 'vivado.bat'))){throw 'Set VIVADO_BIN to the Vivado 2024.2 bin directory.'}
 return $candidate
}
function Get-ProjectWorkRoot {
 if($env:FPGA_WORK_ROOT){$candidate=$env:FPGA_WORK_ROOT}
 else{$candidate=Join-Path ([IO.Path]::GetTempPath()) 'drone_acoustic_r28'}
 New-Item -ItemType Directory -Path $candidate -Force | Out-Null
 return $candidate
}
