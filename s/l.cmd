REM : История изменения файлов.
REM : Синтаксис: "l [<files>] [svn_options]"
REM : Описание:
REM :   "svn log -N" - показывает историю измений файлов (без тэгов)
REM :   Примеры: 
REM :     "s l Client/PlanDoc/ExpBudgetReport.pas"
REM :

CHCP 1251 >nul
call svn log %* | more
