REM : Branch join.
REM : Syntax: "j <files>"
REM : Description:
REM :   join (merge) your changes from one branch to another. 
REM :   It will merge all changes to current working dir branch.
REM :   You should have SOURCE environment variable defined before call. See 'head.cmd' file for example.
REM :     Set SOURCE=source_branch_tag_name.
REM :   To join a directory (not single files) use "full" command (not recomended) followed with "j".
REM :   See also "unj".
REM :   Usage examples: 
REM :     "c head j Client/PlanDoc/ExpBudgetReport.pas"
REM :

if "%source%" == "" goto err

if "%~1" == "" if not "%ALLOW_FULL%" == "1" (
  echo Full mode is turned off. Use "full" to set 'full mode'.
  echo.
  c help %~n0
)

%VCS_CMD% up -d %*

:loop
if "%~1" == "" (set NN="current directory") else set NN=file "%~1"

rem check file state
set choice=Y
%VCS_CMD% status %~1 | find "Locally Modified" >nul 2>&1
if not errorlevel 1 (
  set choice=N
  echo Warning! %NN% locally modified.
  set /P choice=Continue? ^(Y/N^) [N]
)
if /i not "%choice%" == "Y" goto end

rem set destination
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

rem join...
call c jh %~1 | find "%jointag%" >nul 2>&1
if errorlevel 1 (
  echo First join %NN% from "%source%" to "%destination%"...
  %VCS_CMD% up -j %source% %~1
) else (
  echo Re-join %NN% from "%source%" to "%destination%"...
  %VCS_CMD% tag -r %jointag% -F %prevjoin% %~1 > nul
  %VCS_CMD% up -j %jointag% -j %source% %~1 
)
%VCS_CMD% tag -r %source% -F %jointag% %~1 >nul

shift
if "%~1" == "" goto :EOF
goto loop

:err
echo ERROR! Environment variable SOURCE is not assigned.
goto :EOF

:end
goto :EOF
