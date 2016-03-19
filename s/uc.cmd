REM : Revert local changes to files.
REM : Syntax:
REM :   "uc [files]"
REM : Description:
REM :   Runs "svn revert" for the arguments.
REM :   To revert current dir run "full uc" (without arguments)
REM : Usage examples: 
REM :   "uc foo.cpp"
REM :

if "%~1" == "" if not "%ALLOW_FULL%" == "1" (
  echo Full mode is turned off. Use "full".
  echo.
  s help %~n0
)

s revert %*
