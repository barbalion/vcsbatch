REM : Устанавливает степень сжатия передаваемых в/из CVS данных.
REM : Синтаксис: "zip [level] [c_command]"
REM : Описание:
REM :   level - число от 0 до 9 
REM :     соответствует параметру коммандной строки CVS: -z0..-z9
REM :   По умолчанию используется -z9
REM :   Примеры: 
REM :     "c zip 0"
REM :     "c zip 0 s"
REM :

if "%~1" == ""  c h zip

if "%~1" == "0" (
  set CVS_COMPOPT= 
  echo Set no compression.
) else (
  set CVS_COMPOPT=-z%~1
  echo Set "%CVS_COMPOPT%".
)

set params=
:loopparams
set params=%params% %~1
shift
if not "%~1" == "" goto loopparams

c %params%
