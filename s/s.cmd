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

if not exist .svn (
  echo ERROR: This is not Subversion working directory!
  exit /b 1
)

(
  if "%~1" == "" (
    call svn stat %S_S_U% 2>svnerr.log
  ) else (
    call svn stat %S_S_U% 2>svnerr.log | find "%~1" %2 %3 %4 %5 %6 %7 %8 %9
  )
) | sort >status.log

type nul > svnerr.log
for /f "tokens=1,* delims=+ " %%i in (status.log) do (
  if not a%%i == a if not "%%i" == "Status" if not "%%i" == "Performing" if not "%%i" == "X" (
    set _STATE=%%i
    call :addline %%j
  )
)
echo Status on %DATE% %TIME%: >status.log
type svnerr.log | find "" /v /n >>status.log
del svnerr.log >nul 2>&1

type status.log | more

goto :EOF

:addline
set _FILE=%*
if "%_STATE%" == "*" set _STATE=U
if "%_FILE%" == "" goto :EOF
echo %_STATE% %_FILE%>>svnerr.log
goto :EOF
