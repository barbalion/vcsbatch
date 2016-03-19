REM : Апдейт.
REM : Синтаксис: "u [svn_options] [<files>]"
REM : Описание:
REM :   "svn update". Если файлы не указаны, то апдейтятся только файлы, 
REM :   помеченные в последнем статусе (см. коммаду "s") как U,C,M 
REM :   (на обновление, конфликты, измененные). 
REM :   Результаты выполнения комманды складываются в файл update.log.
REM :   Примеры: 
REM :     "s u"
REM :     "s u Client/PlanDoc/ExpBudgetReport.pas"
REM :

echo.>> update.log
echo %DATE%, %TIME%>> update.log
if "%~1" == "" (
  call s ls -f "]U" -f "]C" -f "]M" -f "update:" u
  goto :EOF
) 
echo Update %DATE% %TIME%
call svn up %* >> update.log
