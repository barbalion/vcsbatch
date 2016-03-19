REM : Copy string to clipboard.
REM : Syntax: "cl [<string>]"
REM : Description:
REM :   Puts all the params to system clipboard as single string.
REM :   Exmaples: 
REM :     "vcs ls cl" - copy last status to clipboard
REM :

echo %* | clip
