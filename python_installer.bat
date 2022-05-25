@echo off
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)


"%~dp0python-3.10.4-amd64.exe" /quiet InstallAllUsers=1 PrependPath=1
exit