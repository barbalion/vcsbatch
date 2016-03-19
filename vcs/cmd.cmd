REM : Run cmd's command.
REM : Syntax: "cmd <command>" 
REM : Description:
REM :   Auxilary command. Simply executes the passed command by shell.
REM : Examples: 
REM :   "cmd copy file.txt dir\"      
REM :

if "%~1" == "" %VCS_BAT% help %~n0
%*