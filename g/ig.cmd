REM : Add a file to ignore list.
REM : Syntax: "ig [<files>]"
REM : Description:
REM :   Add all arguments to .gitignore
REM :   Usage examples: 
REM :     "ig accounts.txt"
REM :

if "%1" == "" g h ig

:loop
if "%1" == "" goto :EOF

if "%~nx1" == "" (
  call %0 "%~1\."
) else (
  echo Ignoring "%~nx1"...
  echo %~nx1>>"%~dp1.gitignore"
)
shift   
goto loop
