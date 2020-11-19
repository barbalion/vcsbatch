REM : GUI diff.
REM : Syntax: "sd [-r revision] <files> | <number>"
REM : Description:
REM :   View you local changes with %%DIFF_TOOL%% (env variable) tool.
REM :   Examples:
REM :     "sd foo/bar.txt"
REM :     "sd 3"
REM :

if not defined DIFF_TOOL set DIFF_TOOL="%~dp0..\ThirdParty\WinMergeU.exe"
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
%DIFF_TOOL% "%tmpfile%" %1
shift
goto loop

:end