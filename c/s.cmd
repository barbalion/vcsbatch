REM : Update status.
REM : Syntax:
REM :   "s <filter_string>"
REM : Description:
REM :   Get last status of the current dir (stored in status.log), show status brief and number the files (see "n"). 
REM :   You can specify filter to get status only for certain files.
REM : Usage examples: 
REM :   "c s"
REM :   "c s .cpp"
REM : 

if not exist CVS (
  echo ERROR: This is not CVS working directory!
  exit /b 1
)

set _REV=
if defined source set _REV=-r %source%
echo Status for %DATE% %TIME%: >status.log
if defined source echo Selected source: %source% >status.log
(
  if "%~1" == "" (
    call %VCS_CMD% -n -q update -d %_REV% 2>cvserr.log
  ) else (
    call %VCS_CMD% -n -q update -d %_REV% 2>cvserr.log | find "%~1" %2 %3 %4 %5 %6 %7 %8 %9
  )
) | sort | find "" /n /v >>status.log

type cvserr.log | find "cvs update: New directory" /v >>status.log
del cvserr.log >nul 2>&1

type status.log | more
