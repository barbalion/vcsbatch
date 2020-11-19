REM : GUI diff.
REM : Syntax: "sd [-r revision] <files> | <number>"
REM : Description:
REM :   View you local changes with %%DIFF_TOOL%% (env variable) tool.
REM :   Examples:
REM :     "sd foo/bar.txt"
REM :     "sd 3"
REM :

if not defined DIFF_TOOL set DIFF_TOOL="%~dp0..\ThirdParty\WinMergeU.exe"
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
%DIFF_TOOL% "%tmpfile%" "%afile%"
shift
goto loop

:end