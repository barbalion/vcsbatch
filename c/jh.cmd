REM : История слияния веток.
REM : Синтаксис: "jh [<files>]"
REM : Описание:
REM :   Показывает ревизии файлов, когда производились слияния веток.
REM :   Примеры: 
REM :     "c jh Client/PlanDoc/ExpBudgetReport.pas"
REM :

c log -h %* | find "join"
