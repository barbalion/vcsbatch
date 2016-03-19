REM : Revert local changes to files (deprecated: use "rsh" instead).
REM : Syntax:
REM :   "uc [files]"
REM : Description:
REM :   Runs "git checkout --" for the arguments.
REM :   To revert current dir run "full uc" (without arguments) or "uc ."
REM : Usage examples: 
REM :   "uc foo.cpp"
REM :

if "%~1" == "" if not "%ALLOW_FULL%" == "1" (
  echo Full mode is turned off. Use "full".
  echo.
  s help %~n0
)

%VCS_CMD% checkout -f HEAD -- %*
