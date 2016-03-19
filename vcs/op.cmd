REM : Open file(s) by shell.
REM : Syntax: "op <files>"
REM : Description:
REM :   Shortcut of "open". Executes shell's "start" command for the files, i.e. 'opens' them.
REM :   Exmaple: 
REM :     "vcs op DOC/accounts.txt" - will open Notepad (or another associated program) for the file.
REM :

if "%~1" == "" %VCS_BAT% help %~n0
:loop
if not "%~1" == "" (
  start "%~1"
  shift
  goto loop
)
