REM : GUI diff by Beyond viewer.
REM : Syntax: "sd [-r revision] <files> | <number>"
REM : Description:
REM :   View you local changes with "‚eyond Compare" tool.
REM :   Examples:
REM :     "c sd DOC/accounts.txt"
REM :     "c sd 3 -r branch1"
REM :

set BEYOND="%~dp0..\ThirdParty\beyond32.exe"
if "%~1" == "-r" (
  set _REV=-r %~2
  shift
  shift
) else if "%~1" == "-D" (
  set _REV=-D %~2
  shift
  shift
) else if defined source set _REV=-r %source%
:loop
if "%~1" == "" goto end
set afile=%~1
set afile=%afile:/=\%
set tmpfile=%TEMP%\%afile:\=_%.orig
call %VCS_CMD% update -p %_REV% %1 > "%tmpfile%"
%BEYOND% "%tmpfile%" "%afile%"
shift
goto loop

:end