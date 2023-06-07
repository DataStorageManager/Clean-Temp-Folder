@echo off
setlocal

echo Cleaning up temporary files...
takeown /f %systemdrive%\* /r /d y > nul 2>&1
icacls %systemdrive%\* /grant administrators:F /t > nul 2>&1
del /s /q %systemdrive%\*.tmp
del /s /q %systemdrive%\*._mp
del /s /q %systemdrive%\*.log
del /s /q %systemdrive%\*.gid
del /s /q %systemdrive%\*.chk
del /s /q %systemdrive%\*.old
del /s /q %systemdrive%\recycled\*.*
del /s /q %windir%\*.bak
del /s /q %windir%\prefetch\*.*

echo Cleaning up user profile folders...
pushd %userprofile%
takeown /f * /r /d y > nul 2>&1
icacls * /grant administrators:F /t > nul 2>&1
del /s /q cookies\*.*
del /s /q recent\*.*
popd

pushd "%userprofile%\Local Settings"
takeown /f * /r /d y > nul 2>&1
icacls * /grant administrators:F /t > nul 2>&1
del /s /q "Temporary Internet Files\*.*"
del /s /q Temp\*.*
popd

echo Cleanup complete!
pause
