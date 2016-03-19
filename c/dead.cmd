REM : Поиск удаленных файлов в репозитарии.
REM : Синтаксис: "dead [<filter>]"
REM : Описание:
REM :   Ищет в текущем каталоге (без рекурсии по подкаталогам) в репозитарии 
REM :   удаленные файлы, подходящие под фильтр, и складывает их в статус 
REM :   с модификатором D.
REM :   Примеры: 
REM :     "c dead .sql"
REM :

if "%~1" == "" (
  for /f %%i in ('%VCS_CMD% log -l -R 2^>nul ^| find "/Attic/"') do call :putfile %%i
  c mkst "Deleted files" dead.log
) else (
  for /f %%i in ('%VCS_CMD% log -l -R 2^>nul ^| find "/Attic/" ^| find /i "%~1"') do call :putfile %%i
  c mkst "Deleted '%~1' files" dead.log
)


:putfile
set FILENAME=%~1
set FILENAME=%FILENAME:*/Attic/=%
echo D %FILENAME% >>dead.log
goto :EOF
