REM : Поиск файлов в репозитарии.
REM : Синтаксис: "find <filter>"
REM : Описание:
REM :   Ищет в репозитарии файлы, имя которых подходит под фильтр (в том числе удаленные)
REM :   и складывает их в статус с модификатором F.
REM :   Примеры: 
REM :     "c find AdjustmentBase_Form.pas"
REM :

for /f %%i in ('%VCS_CMD% log -R 2^>nul ^| find /i "%~1" ') do call :putfile %%i

c mkst "Found '%~1'" found.log

:putfile
set FILENAME=%~1
set FILENAME=%FILENAME:*/cvsroot/=/%
echo F %FILENAME%>>found.log
goto :EOF
