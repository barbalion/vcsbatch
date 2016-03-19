REM : Show local changes. Shortcut for 'diff'.
REM : Syntax: "d [<files> | <number>] [svn_options]"
REM : Description:
REM :   "svn diff". Display the differences between arguments. 
REM :   Example: 
REM :     "c d"
REM :     "c d DOC/text.txt"
REM :     "c d 3"
REM :

CHCP 1251 >nul
call %VCS_CMD% -q di %* | more
endlocal