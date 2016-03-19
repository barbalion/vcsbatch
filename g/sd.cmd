REM : GUI diff by Beyond viewer.
REM : Syntax: "sd [-r revision] <files> | <number>"
REM : Description:
REM :   View you local changes with "Beyond Compare" tool.
REM :   Examples:
REM :     "sd foo/bar.txt"
REM :     "sd 3"
REM :

set BEYOND="%~dp0..\ThirdParty\beyond32.exe"
set _REV=HEAD
if defined source (
  echo Use source: %source%...
  set _REV=%source%
)
:loop
if "%~1" == "" goto end
set tmpfile=%~1
set tmpfile=%tmpfile:\=_%
set tmpfile=%tmpfile:/=_%
set tmpfile=%TEMP%\%tmpfile%.orig
call %VCS_CMD% show "%_REV%:./%~1" > "%tmpfile%"
%BEYOND% "%tmpfile%" %1
shift
goto loop

:end