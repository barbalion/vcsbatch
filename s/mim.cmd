REM : Редактирование файлов в notepad'е.
REM : Синтаксис: "edt <files>"
REM : Описание:
REM :   Запускает notepad для всех файлов по очереди. Можно что-то быстро поправить
REM :   Примеры: 
REM :     "vcs edt Client/PlanDoc/ExpBudgetReport.pas"
REM :

if "%~1" == "" %VCS_BAT% help %~n0
:loop
if "%~1" == "" goto :EOF

if "%~x1" == "" goto unknownFile

if /I "%~x1" EQU ".java" goto textFile
if /i "%~x1" EQU ".xml" goto textFile
if /i "%~x1" EQU ".xsd" goto textFile
if /i "%~x1" EQU ".xsl" goto textFile
if /i "%~x1" EQU ".xslt" goto textFile
if /i "%~x1" EQU ".cmd" goto textFile
if /i "%~x1" EQU ".sh" goto textFile
if /i "%~x1" EQU ".ipr" goto textFile
if /i "%~x1" EQU ".iml" goto textFile
if /i "%~x1" EQU ".stg" goto textFile
if /i "%~x1" EQU ".txt" goto textFile
if /i "%~x1" EQU ".html" goto textFile
if /i "%~x1" EQU ".js" goto textFile
if /i "%~x1" EQU ".css" goto textFile
if /i "%~x1" EQU ".svg" goto textFile
if /i "%~x1" EQU ".properties" goto textFile


if /i "%~x1" EQU ".jar" goto binFile
if /i "%~x1" EQU ".dll" goto binFile
if /i "%~x1" EQU ".exe" goto binFile
if /i "%~x1" EQU ".gif" goto binFile
if /i "%~x1" EQU ".png" goto binFile
if /i "%~x1" EQU ".jpg" goto binFile
if /i "%~x1" EQU ".jpeg" goto binFile
if /i "%~x1" EQU ".xls" goto binFile

goto unknownFile

:textFile
call svn propset svn:mime-type text/plain %1
call svn propset svn:eol-style native %1
goto continue

:binFile
call svn propset svn:mime-type application/octet-stream %1
goto continue
 
:unknownFile
echo ERROR: Unknow file extension %1!
goto continue

:continue
shift
goto loop
                
