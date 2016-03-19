REM : Тэги и ветки.
REM : Синтаксис: "t [<files>] [cvs_options]"
REM : Описание:
REM :   "cvs log -h" - показывает тэги в ветки (без истории измений)
REM :   Примеры: 
REM :     "c t Client/PlanDoc/ExpBudgetReport.pas"
REM :

CHCP 1251 >nul
%VCS_CMD% log -h %* | more
