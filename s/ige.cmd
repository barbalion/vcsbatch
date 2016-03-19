REM : Рекдактировать игнор-лист.
REM : Синтаксис: "ige [dir]"
REM : Описание:
REM :   Добавляет все переданные файлы в файл .svnignore
REM :   Примеры: 
REM :     "s ige"
REM :

if "%1" == "" s ige .\

call svn pe svn:ignore %~dp1
