REM : ��᫥���� ��������� � ९����ਨ.
REM : ���⠪��: "rd [svn_options] <files>"
REM : ���ᠭ��:
REM :   �������� ��᫥���� ��������� ᤥ����� ��� 䠩���� (�� �������). 
REM :   �.�. �ࠢ������ ��᫥���� ��� ॢ����. 
REM :   ����⠥� ⮫쪮 ��� �᭮��� �⢮��� ९������ (�� ࠡ�⠥� �� ��⪠�).
REM :   �ਬ���: 
REM :     "s rd -u DOC/accounts.txt"
REM :

setlocal

if "%~1" == "" s help %~n0
:loop
if "%~1" == "" goto end

set params=
:findfile
set param=%~1
if "%param:~0,1%" == "-" (
  shift
  set params=%params%%~1 
  goto findfile
)

CHCP 1251
call svn diff -r PREV:BASE %params% "%~1"

shift
goto loop

:end
endlocal
