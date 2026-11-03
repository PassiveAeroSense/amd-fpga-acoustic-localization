@echo off
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp008_build_hls.ps1" %*
pause
