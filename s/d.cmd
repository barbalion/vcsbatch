REM : Show local changes. Shortcut for 'diff'.
REM : Syntax: "d [<files> | <number>] [svn_options]"
REM : Description:
REM :   "svn diff". Display the differences between arguments. 
REM :   Example: 
REM :     "s d"
REM :     "s d DOC/file.txt"
REM :     "s d 3"
REM :

CHCP 1251 >nul
call svn di %* | more
endlocal