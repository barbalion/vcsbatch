REM : Add a file to ignore list.
REM : Syntax: "ig [<files>]"
REM : Description:
REM :   Add all arguments to svn:ignore folder property
REM :   Usage examples: 
REM :     "ig accounts.txt"
REM :

if "%1" == "" s h ig

:loop
if "%1" == "" goto :EOF
call svn pg svn:ignore --strict %~dp1 > prop.log

set filename=%~1
:nameloop
set filename=%filename:*\=%
if not "%filename%" == "%filename:*\=%" goto nameloop

echo Ignoring "%filename%" in "%~dp1"
echo %filename%>>prop.log
call svn ps svn:ignore -F prop.log %~dp1
del prop.log > nul
shift   
goto loop
