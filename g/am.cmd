REM : Add all modified file to the index (stage).
REM : Syntax: "am"
REM : Description:
REM :   Calls 'ls-files -m' and runs 'add' for each file. 
REM :

setlocal
echo Modifing repository...
SET addfiles=
for /f "tokens=*" %%i in ('%VCS_CMD% ls-files -m') do (
  call :toadd %%i
)

call :doaddfiles

goto :EOF

:doaddfiles
echo Add %addfiles%...
if "%addfiles%" == "" (echo Nothing to add.) else (%VCS_CMD% add --all -- %addfiles%)
goto :EOF

:toadd
set testfilelist=%addfiles% "%~1"
if not "%testfilelist:~512,1%" == "" (
  call :doaddfiles
  set addfiles=
)
set addfiles=%addfiles% "%~1"
goto :EOF

