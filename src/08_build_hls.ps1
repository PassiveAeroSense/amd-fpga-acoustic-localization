$ErrorActionPreference='Stop'
. (Join-Path $PSScriptRoot 'toolchain.ps1')
$pythonPath=Get-ProjectPython
$testByTop=[ordered]@{
 fft4096_hls='test_fft.cpp';fir_loc_hls='test_fir.cpp';fir_det_hls='test_fir.cpp'
 sqrt_hls='test_numeric.cpp';divide_hls='test_numeric.cpp';cordic_hls='test_numeric.cpp'
 power_db_hls='test_numeric.cpp';covariance_hls='test_numeric.cpp'
 detector_hls='test_detector.cpp';joint_search_hls='test_search.cpp'
}
foreach($top in $testByTop.Keys){
 & $pythonPath (Join-Path $PSScriptRoot 'hls/scripts/build_hls.py') $top --test $testByTop[$top] --cosim
 if($LASTEXITCODE -ne 0){throw "HLS build failed: $top"}
}
Write-Output 'Ten HLS IPs rebuilt and C/RTL verified. Run 02_build.cmd to rebuild the board bitstream.'
