REM : Update status.
REM : Syntax:
REM :   "s <filter_string>"
REM : Description:
REM :   Get last status of the current dir (stored in status.log), show status brief and number the files (see "n"). 
REM :   You can specify filter to get status only for certain files.
REM : Usage examples: 
REM :   "s"
REM :   "s .cpp"
REM : 

(
  if "%~1" == "" (
    %VCS_CMD% status -s . | find /v "../"
  ) else (
    %VCS_CMD% status -s . | find /v "../"
  ) | find "%~1" %2 %3 %4 %5 %6 %7 %8 %9
) | sort >status.log

type nul > svnerr.log
for /f "tokens=1,*" %%i in (status.log) do call :addline %%i %%j
echo Status on %DATE% %TIME%: >status.log
type svnerr.log | find "" /v /n >>status.log
del svnerr.log >nul 2>&1

type status.log | more

goto :EOF

:addline
if a%~1 == a goto :EOF
if "%1" == "Status" goto :EOF
if "%1" == "Performing" goto :EOF
if "%1" == "X" goto :EOF
set _STATE=%~1
set _FILE=%~2 %~3 %~4 %~5 %~6 %~7
if "%_STATE%" == "C" set _STATE=m
if "%_STATE%" == "K" set _STATE=D
if "%_FILE%" == "" goto :EOF
echo %_STATE% %_FILE%>>svnerr.log
goto :EOF
