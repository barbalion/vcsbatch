REM : Ignore extension.
REM : Syntax: "igx [<files>]"
REM : Description:
REM :   Adds extension of the passed file to ignore list.
REM :   Examples: 
REM :     "vcs igx accounts.txt" - will add '*.txt' to ignore list.
REM :

if "%1" == "" %VCS_BAT% h igx

:loop
if "%~1" == "" goto :EOF
call %VCS_BAT% ig "%~dp1*%~x1"
shift   
goto loop
