REM : Select file by number.
REM : Syntax: "n <numbers> <vcs-command>"
REM : Description:
REM :   Selects numbered files from status (see "s") by space-delimited <numbers>
REM :   and executes <vcs-command>.
REM :   Exmaples: 
REM :     "vcs n 2 4 edt" - edit files ## [2] and [4]
REM :   vcs.cmd Supports this command natively, so you can use this syntax:
REM :     "vcs edt 2 4" - the same as above
REM :   vcs.cmd while parsing comman-line checks parameters (2nd, 3rd etc.) to be valid integers 
REM :   and implicitely executes 'n' command.
REM :

if "%~1" == "" %VCS_BAT% help %~n0
set filelist=

:loop
for /f "tokens=1,2,* skip=1 delims=[] " %%i in (status.log) do (
  if "%%i" == "%~1" (
    echo %%i=%%k > con
    call :addfile %%k
    shift
    goto loop
  )
)

set param=
:paramloop
if "%~1" == "" goto paramend
set param=%param% "%~1"
shift
goto paramloop
:paramend

call %VCS_BAT% %C_CMD% %param% %filelist%

goto :eof

:addfile
set filelist=%filelist% "%*"
goto :eof
