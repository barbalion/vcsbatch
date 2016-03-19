@echo off
if DEFINED _VCS_DEBUG echo DEBUG: %0 %* >con
if not defined VCS_BAT (
  echo VCS_BAT variable must be set!
  goto :EOF
)
if not defined VCS_CMD (
  echo VCS_CMD variable must be set!
  goto :EOF
)

:begin
rem MODE CON: CP SELECT=1251 >nul
setlocal
call :stamp2ticks %TIME%
call :push %_TIMETICKS%

if defined VCS_IGNORE_NUMERIC goto skip_numbering
set VCS_IGNORE_NUMERIC=1
if "%~2" == "" (set num=all) else (set /a num=%~2 2>nul )
if not "%~n1" == "n" if "%num%" == "%~2" %0 num %*
:skip_numbering

if "%~1" == "" goto err
if "%~1" == "?" goto showCommands
set filename=%~dp0%VCS_BAT%\%~1
if exist "%filename%" goto par
set filename=%~dp0%VCS_BAT%\%~1.cmd
if exist "%filename%" goto par
set filename=%~dp0vcs\%~1
if exist "%filename%" goto par
set filename=%~dp0vcs\%~1.cmd
if exist "%filename%" goto par
goto nofile

:par

shift
set param=
:loop
if "%~1" == "" goto endloop
set param=%param% "%~1"
shift
goto loop
:endloop

call %filename% %param%

goto ok

:nofile
%VCS_CMD% %*
goto ok

:err
call %0 ? | sort | more
goto ok

:showCommands
(
for %%i in (%~dp0%VCS_BAT%\*.cmd) do call :showCommand %%i
for %%i in (%~dp0vcs\*.cmd) do call :showCommand %%i
echo.
echo Run "%0 help <command> for full help.
) 
goto :EOF

:showCommand
set hlp= (no help)
for /F "tokens=1,* delims=:" %%i in (%1) do if "%%i" == "REM " (
  set hlp=%%j
  goto :showCommandBreak
)
:showCommandBreak
echo "%~n1"	%hlp%
goto :EOF

:stamp2ticks
for /f "tokens=1,2,3,4 delims=:.," %%i in ("%~1") do (set _TTHOUR=%%i)&(set _TTMIN=%%j)&(set _TTSEC=%%k)&(set _TTMSEC=%%l)
set /a _TIMETICKS=((_TTHOUR*60 + _TTMIN)*60 + _TTSEC)*100 + _TTMSEC
goto :EOF

:ticks2stamp
set /a _TIMESTAMP=%*
if %_TIMESTAMP% LSS 0 set /a _TIMESTAMP=_TIMESTAMP+8640000
if %_TIMESTAMP% GEQ 8639999 set _TIMESTAMP=0
set /a _TIMESTAMP=1000000000+(_TIMESTAMP/360000) * 1000000 + (_TIMESTAMP-(_TIMESTAMP/360000)*360000)/6000 * 10000 + (_TIMESTAMP-(_TIMESTAMP/6000)*6000)/100 * 100 + (_TIMESTAMP-(_TIMESTAMP/100)*100)
set _TIMESTAMP=%_TIMESTAMP:~-9,3%:%_TIMESTAMP:~-6,2%:%_TIMESTAMP:~-4,2%.%_TIMESTAMP:~-2,2%
goto :EOF

:push
call :push_shift 1
set _stack0=%*
goto :EOF
:push_shift
set /a _stack_pos=%*
if defined _stack%_stack_pos% call :push_shift %_stack_pos%+1
set /a _stack_pos=%*
set /a _stack_prev=%*-1
call set _stack%_stack_pos%=%%_stack%_stack_prev%%%
goto :EOF

:pop
set %1=%_stack0%
call :pop_shift 0
goto :EOF
:pop_shift
set /a _stack_pos=%*
set /a _stack_next=%*+1
call set _stack%_stack_pos%=%%_stack%_stack_next%%%
if defined _stack%_stack_next% call :pop_shift %_stack_pos%+1
goto :EOF

:length
set %~1=0
:length_loop
set _TEST=%~2
call call set _TEST=%%%%_TEST:~%%%~1%%,1%%%%
if "%_TEST%" == "" exit /b 1
set /a %~1=%~1+1
goto length_loop

:ok
call :stamp2ticks %TIME%
call :pop ROUTINE_START_TIME
call :ticks2stamp %_TIMETICKS%-%ROUTINE_START_TIME%
echo                           -=^("%*": Execution time: %_TIMESTAMP%^)=- >con
endlocal
goto :EOF
