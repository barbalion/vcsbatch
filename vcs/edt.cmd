REM : Edit files in Notepad.
REM : Syntax: "edt <files>"
REM : Description:
REM :   Runs Notepad for all siles one by one. Useful for quick fixes.
REM :   Exmaple: 
REM :     "vcs edt Client/PlanDoc/ExpBudgetReport.pas"
REM :

if "%~1" == "" %VCS_BAT% help %~n0
:loop
if "%~1" == "" goto :EOF
notepad "%~1"
shift
goto loop
