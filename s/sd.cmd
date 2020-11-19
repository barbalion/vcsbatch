REM : GUI diff.
REM : Syntax: "sd <files> | <number>"
REM : Description:
REM :   View you local changes with %%DIFF_TOOL%% (env variable) tool.
REM :   Examples:
REM :     "sd foo/bar.txt"
REM :     "sd 3"
REM :

if not defined DIFF_TOOL set DIFF_TOOL="%~dp0..\ThirdParty\WinMergeU.exe"
:loop
if "%~1" == "" goto end
set afile=%~1
set basefile=%~dp1.svn\text-base\%~nx1.svn-base
%DIFF_TOOL% "%basefile:/=\%" "%afile:/=\%"
shift
goto loop

:end