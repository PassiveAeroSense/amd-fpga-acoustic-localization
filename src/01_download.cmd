@echo off

powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp001_download.ps1"

if errorlevel 1 echo FAILED - read the error above.

pause

