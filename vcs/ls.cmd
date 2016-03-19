REM : Last status.
REM : Syntax: "ls [-f <filter_string>] [<c-command>]"
REM : Description:
REM :   Short cut of "last status". If there is no <c-command> defined
REM :   then shows last status i.e. status.log file content. 
REM :   (see. also "s") filtered by <filter_string> containing
REM :   (if the param set). 
REM :   If commnd is defined then runs the command for every selected file.
REM :   Examples: 
REM :     "vcs ls" - last status
REM :     "vcs ls edt" - edit (call 'edt') all the files listed in last status
REM :     "vcs ls -f .dsk del" - remove all files with ".dsk" in the name 
REM :     in last status.
REM :

setlocal

if not exist status.log (
  echo File "status.log" not found. Run "%VCS_BAT% s" first.
  goto :EOF
)

type nul > found.log
set filter=
set multi_filter=0
:loop
if /i "%~1" == "-f" (
  set filter=%~2
  shift
  shift
)
if "%filter%" == "" (
  type status.log > found.log
) else (
  for /f "tokens=*" %%i in ('type status.log ^| find "%filter%"') do (
    call :addtofound %%i
  )
  if /i "%~1" == "-f" (
    set multi_filter=1
    goto loop
  )
)
if "%~1" == "" (
  type found.log | more
  del found.log > nul
  goto :EOF
)

set params=
:loopparams
set params=%params% %1
shift
if not "%~1" == "" goto loopparams

for /f "tokens=1,2,3,* delims=] " %%h in ('type found.log') do (
  if "%%l" == "is no longer in the repository" (
    call :addfile %%k
  ) else (
    if NOT "%%h" == "Status" if NOT "%%i" == "Merging" (
      call :addfile %%j %%k
    )
  )
)
del found.log > nul

call :runfiles

goto :EOF

:addtofound
if %multi_filter% == 1 (
  find "%*" found.log >nul
  if ERRORLEVEL 1 echo %* >>found.log
) else echo %* >>found.log
goto :EOF

:addfile
echo ls=%*
set testfilelist=%filelist% "%*"
set testfilelist=%testfilelist:~1000,2%
set testfilelist >nul 2>&1
if "%ERRORLEVEL%" == "0" (
  call :runfiles
  set filelist=
)
set filelist=%filelist% "%*"
goto :EOF

:runfiles
if defined filelist call %VCS_BAT% %params% %filelist%
goto :EOF
