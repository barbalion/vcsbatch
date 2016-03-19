REM : Подтверждение исправления конфликта.
REM : Синтаксис: "res [svn_options] [<files>]"
REM : Описание:
REM :   Аналогично "svn resolve".
REM :   Для работы с целым каталогом, а не отдельными файлами используйте "full"
REM :   Примеры: 
REM :     "s res"
REM :     "s res Client/PlanDoc/ExpBudgetReport.pas"
REM :

if "%~1" == "" if not "%ALLOW_FULL%" == "1" (
  echo Full mode is turned off. Use "full".
  echo.
  s help %~n0
)

s resolved %*
