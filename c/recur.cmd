REM : ������ 㤠����� 䠩�.
REM : ���⠪��: "recur <files>"
REM : ���ᠭ��:
REM :   �⬥���� ������� �� 㤠����� 䠩��, ��᫥ ⮣� ��� �� �� 䨧��᪨ 㤠��� 
REM :   � ����祭 CVS �� 㤠�����, �� �� �� �������祭.
REM :   �ਬ���: 
REM :     "c recur DOC/accounts.txt"
REM :

:loop
if "%~1" == "" goto :EOF

set TMPFILE=".#recur.tmp"
if exist %TMPFILE% del %TMPFILE% > nul
copy "%~dp1CVS\Entries" %TMPFILE% > nul
type %TMPFILE% | find /v "%~nx1" > "%~dp1CVS\Entries"
call c upd %1
del %TMPFILE% > nul

shift
goto loop