REM : Undo branch join.
REM : Syntax: "unj -f <files>"
REM : Description:
REM :   Undo for "j" command. Revert tags of last join. Undo works only for ONE STEP(!) of join. 
REM :   Subsequent calls of "unj" will not have any effect.
REM :   If "-F" parameter was passed, then command will remove all join history instead of one-step-undo.
REM :   (as it where no any joins of these branches).
REM :   You must have environment variables to be defined before call. See help of "j" for details.
REM :   To process a directory use "full" command (not recomended).
REM :   See also "j".
REM :   Usage examples: 
REM :     "c head unj Client/PlanDoc/ExpBudgetReport.pas"
REM :

if "%source%" == "" goto err

if "%~1" == "" if not "%ALLOW_FULL%" == "1" (
  echo Full mode is turned off. Use "full".
  echo.
  c help %~n0
)

set fulluntag=0

:loop
if /i "%~1" == "-F" (
  set fulluntag=1
  echo Full un-tagging...
  shift
  goto loop
)

if "%~1" == "" (set NN="current directory") else set NN=file "%~1"

rem установка destination
set tagdir=%~dp1CVS
if not exist %tagdir% (
  echo ERROR! CVS repository not found for %NN%!
  goto :EOF
)
if not exist %tagdir%\Tag (set destination=HEAD) else for /f "tokens=* delims=T" %%i in (%tagdir%\Tag) do set destination=%%i

if "%source%" == "%destination%" (
  echo ERROR for %NN%: SOURCE == "%source%" == DESTINATION.
  goto :EOF
)

set jointag=last_joined_%source%_with_%destination%
set prevjoin=prev_joined_%source%_with_%destination%

rem сам unjoin...
call c jh %~1 | find "%jointag%" >nul 2>&1
if errorlevel 1 (
  %VCS_CMD% tag -d %jointag% %~1 > nul
) else (
  %VCS_CMD% tag -r %prevjoin% -F %jointag% %~1 > nul
)

if "%fulluntag%" == "1" (
  %VCS_CMD% tag -d %prevjoin% %~1 > nul
  %VCS_CMD% tag -d %jointag% %~1 > nul
)

%VCS_CMD% up -C %~1

shift
if "%~1" == "" goto :EOF
goto loop

:err
echo ERROR! Environment variable SOURCE is not assigned.
goto :EOF

:end
goto :EOF
