REM : Add a file to ignore list.
REM : Syntax: "ig [<files>]"
REM : Description:
REM :   Add all arguments to .cvsignore
REM :   Usage examples: 
REM :     "ig accounts.txt"
REM :

if "%1" == "" c h ig

:loop
if "%1" == "" goto :EOF
echo Ignoring "%~nx1"...
echo %~nx1>>%~dp1.cvsignore
shift   
goto loop
