REM : ��ᬮ�� ᤥ������ �������� ��������� � �eyond.
REM : ���⠪��: "sd <files> | <number>"
REM : ���ᠭ��:
REM :   ��ᬮ�� �� ����� "�eyond Compare" �������� ��������� � 䠩���.
REM :   �ਬ���:
REM :     "s sd DOC/accounts.txt"
REM :     "s sd 3"
REM :

set BEYOND="%~dp0..\ThirdParty\beyond32.exe"
:loop
if "%~1" == "" goto end
set afile=%~1
set basefile=%~dp1.svn\text-base\%~nx1.svn-base
%BEYOND% "%basefile:/=\%" "%afile:/=\%"
shift
goto loop

:end