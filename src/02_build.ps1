$ErrorActionPreference='Stop'
& (Join-Path $PSScriptRoot 'pure_rtl/scripts/build_board.ps1') @args
