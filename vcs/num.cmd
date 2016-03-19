REM : Execute .
REM : Syntax: "num <command> [params]"
REM : Description:
REM :   Auxilary command. 
REM :   "vcs num edt 1 2" - will call "vcs n 1 2 edt"
REM :

if "%~1" == "" %VCS_BAT% help %~n0

set C_CMD=%~1

set param=
:paramloop
shift
if "%~1" == "" goto paramend
set param=%param% "%~1"
goto paramloop
:paramend

call %VCS_BAT% n %param%
