REM : Set source as previous commit.
REM : Syntax: "prev [-r number]"
REM : Description:
REM :   Use this command along with sd to view diffs with already commited version of your files.
REM :   Specify "-r number" to choose older revisions.
REM :   Examples:
REM :     "prev sd foobar.cpp"
REM :

if "%~1" == "-r" (
  set _num=%~2
  shift
  shift
) else (
  set _num=1
)
if defined source (
  echo Use source: %source%...
  set source=%source%~%_num%
) else (
  set source=HEAD~%_num%
)
%VCS_BAT% %1 %2 %3 %4 %5 %6 %7 %8 %9