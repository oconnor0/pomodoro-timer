@echo off
SET THEFILE=E:\Source\pomodoro-timer\PomodoroTimer.exe
echo Linking %THEFILE%
D:\lazarus\fpc\3.0.4\bin\x86_64-win64\ld.exe -b pei-x86-64  --gc-sections   --subsystem windows --entry=_WinMainCRTStartup    -o E:\Source\pomodoro-timer\PomodoroTimer.exe E:\Source\pomodoro-timer\link.res
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occurred while assembling %THEFILE%
goto end
:linkend
echo An error occurred while linking %THEFILE%
:end
