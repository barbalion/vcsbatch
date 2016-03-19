REM : Show local changes. Shortcut for 'diff'.
REM : Syntax: "d [<files> | <number>] [svn_options]"
REM : Description:
REM :   "svn diff". Display the differences between arguments. 
REM :   Example: 
REM :     "d"
REM :     "d foo/bar.txt"
REM :     "d 3"
REM :

CHCP 1251 >nul
%VCS_CMD% diff %* | more
endlocal