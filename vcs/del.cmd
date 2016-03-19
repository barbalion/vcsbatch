REM : Delete files.
REM : Syntax: "del <files>"
REM : Description:
REM :   'Deleting' of the file. Actually renaming to temporary file 
REM :   with ".#" prefix, which will be typically ignored by your VCS.
REM :   Examples: 
REM :     "del Client/PlanDoc/ExpBudgetReport.pas"
REM :

if "%~1" == "" %VCS_BAT% help %~n0
:loop
if "%~1" == "" goto :EOF
set filename="%~1"
set filename=%filename:/=\%
call :dodel %filename%
shift 
goto loop

:dodel
set newname=.#%~nx1.deleted
set fullnewname=%~dp1%newname%

if not exist %1 (
  echo File %1 not found.
  goto :EOF
)

if exist "%fullnewname%" (
  del "%fullnewname%"
  if not exist "%fullnewname%" echo Deleted old: "%fullnewname%"
)

ren %1 "%newname%"

if exist "%fullnewname%" echo Renamed to: "%fullnewname%"
                 