REM : История изменения файлов.
REM : Синтаксис: "l [<files>] [cvs_options]"
REM : Описание:
REM :   "cvs log -N" - показывает историю измений файлов (без тэгов)
REM :   Примеры: 
REM :     "c l Client/PlanDoc/ExpBudgetReport.pas"
REM :

CHCP 1251 >nul
call %VCS_CMD% log -N %* | more
