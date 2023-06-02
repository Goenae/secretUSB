@echo off
REM SLEEP 20
REM type NUL > EmptyFile.txt
Powershell.exe -NoLogo -WindowStyle Hidden -executionpolicy remotesigned -File  logs.ps1
