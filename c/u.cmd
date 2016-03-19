REM : Апдейт.
REM : Синтаксис: "u [cvs_options] [<files>]"
REM : Описание:
REM :   "cvs update". Если файлы не указаны, то апдейтятся только файлы, 
REM :   помеченные в последнем статусе (см. коммаду "s") как U,C,M 
REM :   (на обновление, конфликты, измененные). 
REM :   Результаты выполнения комманды складываются в файл update.log.
REM :   Примеры: 
REM :     "c u"
REM :     "c u Client/PlanDoc/ExpBudgetReport.pas"
REM :

echo.>> update.log
echo %DATE%, %TIME%>> update.log
if "%~1" == "" (
  call c ls -f "]U" -f "]C" -f "]M" -f "update:" u
  goto :EOF
) 
echo Update %DATE% %TIME%
%VCS_CMD% up -d -P %* >> update.log
