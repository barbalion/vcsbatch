REM : Add and delete files to/from version contorl.
REM : Syntax: "new"
REM : Description:
REM :   1) Looks for new files (marked by "?") and adds them ("add"). 
REM :   2) Looks for deleted files (marked by "!") and removes them ("remove"). 
REM :   3) Looks for previously added but then dissapered files and rejects the adding.
REM :   Usage examples: 
REM :     "new"      
REM :

setlocal
echo Modifing repository...
SET addfiles=
SET delfiles=
for /f "tokens=2,3,5,7,* delims='`] " %%i in ('call s ls') do (
  echo %%i %%j %%k
  if "%%i" == "?" call :toadd %%j
  if "%%i" == "!" call :todel %%j
  if "%%l" == "disappeared" call :todel %%k
)

call :doaddfiles
call :dodelfiles

goto :EOF

:doaddfiles
if "%addfiles%" == "" (echo Nothing to add.   ) else (call svn add %addfiles%)
goto :EOF

:dodelfiles
if "%delfiles%" == "" (echo Nothing to delete.) else (call svn remove %delfiles%)
goto :EOF

:toadd
set testfilelist=%addfiles% "%~1"
if not "%testfilelist:~512,1%" == "" (
  call :doaddfiles
  set addfiles=
)
set addfiles=%addfiles% "%~1"
goto :EOF

:todel
set testfilelist=%delfiles% "%~1"
if not "%testfilelist:~512,1%" == "" (
  call :dodelfiles
  set delfiles=
)
set delfiles=%delfiles% "%~1"
goto :EOF
