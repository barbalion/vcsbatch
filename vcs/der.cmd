REM : Move file to Recycle Bin.
REM : Syntax: "delr <files>"
REM : Description:
REM :   Just move files to Recyle Bin (using VBScript).
REM :   Exmaples: 
REM :     "delr Client/PlanDoc/ExpBudgetReport.pas"
REM :

if "%~1" == "" %VCS_BAT% help %~n0
set DEL_SCRIPT="%~dp0del.vbs"
:loop
if "%~1" == "" goto :EOF
set filename="%~1"
set filename=%filename:/=\%
call :dodel %filename%
shift 
goto loop

:dodel
if not exist %1 (
  echo File %1 not found.
  goto :EOF
)

cscript //nologo %DEL_SCRIPT% "%~f1"
if not errorlevel 1 echo %1 moved to Recycle Bin
                 