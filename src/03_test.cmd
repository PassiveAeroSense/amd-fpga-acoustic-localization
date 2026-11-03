@echo off

powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp003_test.ps1"

if errorlevel 1 echo FAILED - read the error above.

pause

