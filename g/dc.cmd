REM : Show changes after index. Shortcut for 'diff --cached'.
REM : Syntax: "dc [<files> | <number>] [svn_options]"
REM : Description:
REM :   "svn diff". Display the differences between arguments. 
REM :   Example: 
REM :     "d"
REM :     "d foo.txt"
REM :     "d 3"
REM :

CHCP 1251 >nul
%VCS_CMD% diff --cached %* | more
endlocal