REM : Commit all modified files.
REM : Syntax: "cm"
REM : Description:
REM :   Runs "am" then "c"
REM :
call g am
if errorlevel 1 goto :EOF
call g c %*
