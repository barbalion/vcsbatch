REM : Последние изменения в репозитарии.
REM : Синтаксис: "rd [cvs_options] <files>"
REM : Описание:
REM :   Показать последние изменения сделанные над файлами (не локальные). 
REM :   Т.е. сравнивает последние две ревизии. 
REM :   Работает только над основным стволом репозитария (не работает на ветках).
REM :   Примеры: 
REM :     "c rd -u DOC/accounts.txt"
REM :

setlocal

if "%~1" == "" c help %~n0
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

if "%~1" == "" goto end
for /f "tokens=2,3 delims=. " %%i in ('call %VCS_CMD% log "%~1" ^| find "revision "') do (
  set lv1=%%i
  set lv2=%%j
  goto exit1
)
:exit1
set /a v2=%lv2%-1
if "%v2%" == "0" goto end

CHCP 1251 >nul
call %VCS_CMD% diff -r %lv1%.%v2% -r %lv1%.%lv2% %params% "%~1"

shift
goto loop

:end
endlocal
