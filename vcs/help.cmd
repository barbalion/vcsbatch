REM : Command help.
REM : Syntax: "help <command>"
REM : Description:
REM :   Shows full help for the command.
REM :   Example: 
REM :     "vcs help j"
REM :

if "%~1" == "" %VCS_BAT% help %~n0

set filename=%~dp0..\%VCS_BAT%\%~1
if exist "%filename%" goto par
set filename=%~dp0..\%VCS_BAT%\%~1.cmd
if exist "%filename%" goto par
set filename=%~dp0%~1
if exist "%filename%" goto par
set filename=%~dp0%~1.cmd
if exist "%filename%" goto par

echo Unknown command "%~1".
echo.
%VCS_BAT% help help

:par
set printed=0
for /F "tokens=1,* delims=:" %%i in (%filename%) do (
  if "%%i" == "REM " (
    echo.%%j
    set printed=1
  ) else (goto end)
)
:end
if %printed% == 0 echo (ho help)