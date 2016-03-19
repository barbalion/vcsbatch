REM : Make status from external file.
REM : Syntax: "mkst <file>"
REM : Description:
REM :   Shot cut of "make status". Auxilary command.
REM :   Puts all lines of the file into the status.
REM :   Examples: 
REM :     "vcs mkst "Deleted files" dead.log" 
REM :

if "%~2" == "" %VCS_BAT% help %~n0
if not exist "%~2" goto :EOF
echo %~1 on %DATE% %TIME%: >status.log
type "%~2" | find /v /n "" >>status.log
del "%~2"
%VCS_BAT% ls
