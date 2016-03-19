REM : ��᫥���� ��������� � ९����ਨ.
REM : ���⠪��: "rd [cvs_options] <files>"
REM : ���ᠭ��:
REM :   �������� ��᫥���� ��������� ᤥ����� ��� 䠩���� (�� �������). 
REM :   �.�. �ࠢ������ ��᫥���� ��� ॢ����. 
REM :   ����⠥� ⮫쪮 ��� �᭮��� �⢮��� ९������ (�� ࠡ�⠥� �� ��⪠�).
REM :   �ਬ���: 
REM :     "c rd -u DOC/accounts.txt"
REM :

setlocal

if "%~1" == "" c help %~n0
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

if "%~1" == "" goto end
for /f "tokens=2,3 delims=. " %%i in ('call %VCS_CMD% log "%~1" ^| find "revision "') do (
  set lv1=%%i
  set lv2=%%j
  goto exit1
)
:exit1
set /a v2=%lv2%-1
if "%v2%" == "0" goto end

CHCP 1251 >nul
call %VCS_CMD% diff -r %lv1%.%v2% -r %lv1%.%lv2% %params% "%~1"

shift
goto loop

:end
endlocal
