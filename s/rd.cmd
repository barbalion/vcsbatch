REM : Последние изменения в репозитарии.
REM : Синтаксис: "rd [svn_options] <files>"
REM : Описание:
REM :   Показать последние изменения сделанные над файлами (не локальные). 
REM :   Т.е. сравнивает последние две ревизии. 
REM :   Работает только над основным стволом репозитария (не работает на ветках).
REM :   Примеры: 
REM :     "s rd -u DOC/accounts.txt"
REM :

setlocal

if "%~1" == "" s help %~n0
:loop
if "%~1" == "" goto end

set params=
:findfile
set param=%~1
if "%param:~0,1%" == "-" (
  shift
  set params=%params%%~1 
  goto findfile
)

CHCP 1251
call svn diff -r PREV:BASE %params% "%~1"

shift
goto loop

:end
endlocal
