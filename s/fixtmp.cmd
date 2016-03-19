REM : Fix tmp folder issue with old subversion woring copies.
REM : Syntax: "fixtmp"
REM : Description:
REM :   This command will create required subfolders in every '.svn' folder. This will allow to work with old working copies without checking them out again.
REM :   Exmaples: 
REM :     "s fixtmp"
REM :

for /f "tokens=*" %%i in ('dir .svn* /a:d /b /s') do (
  mkdir "%%i\prop-base" 2>nul
  mkdir "%%i\props" 2>nul
  mkdir "%%i\text-base" 2>nul
  mkdir "%%i\tmp" 2>nul
  mkdir "%%i\tmp\prop-base" 2>nul
  mkdir "%%i\tmp\props" 2>nul
  mkdir "%%i\tmp\text-base" 2>nul
)