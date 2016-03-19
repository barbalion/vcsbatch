REM : Clean up current dir and its subdirs from temporary files.
REM : Syntax: "clean"
REM : Description:
REM :   Deletes all files by masks *.bak, *.log, .#*, *.deleted, etc.
REM :   Example: 
REM :     "vcs clean"
REM :

call :clean .#*
call :clean *.deleted
call :clean *.~*
call :clean *.bak
call :clean *.log
call :clean *.orig
call :clean *.orig
call :clean *.BACKUP.*
call :clean *.BASE.*
call :clean *.LOCAL.*
call :clean *.REMOTE.*

goto :EOF

:clean
echo Clean %*
if a%1 == a goto :EOF
for /f "tokens=*" %%i in ('dir "%~1" /b /s') do (
  echo   del "%%i"
  del "%%i"
)
goto :EOF
