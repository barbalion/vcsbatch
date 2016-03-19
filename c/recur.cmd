REM : Вернуть удаленный файл.
REM : Синтаксис: "recur <files>"
REM : Описание:
REM :   Отменить задание на удаление файла, после того как он был физически удален 
REM :   и помечен CVS на удаление, но еще не закоммичен.
REM :   Примеры: 
REM :     "c recur DOC/accounts.txt"
REM :

:loop
if "%~1" == "" goto :EOF

set TMPFILE=".#recur.tmp"
if exist %TMPFILE% del %TMPFILE% > nul
copy "%~dp1CVS\Entries" %TMPFILE% > nul
type %TMPFILE% | find /v "%~nx1" > "%~dp1CVS\Entries"
call c upd %1
del %TMPFILE% > nul

shift
goto loop