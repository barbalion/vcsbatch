REM : ���� 䠩��� � ९����ਨ.
REM : ���⠪��: "find <filter>"
REM : ���ᠭ��:
REM :   ��� � ९����ਨ 䠩��, ��� ������ ���室�� ��� 䨫��� (� ⮬ �᫥ 㤠�����)
REM :   � ᪫��뢠�� �� � ����� � ����䨪��஬ F.
REM :   �ਬ���: 
REM :     "c find AdjustmentBase_Form.pas"
REM :

for /f %%i in ('%VCS_CMD% log -R 2^>nul ^| find /i "%~1" ') do call :putfile %%i

c mkst "Found '%~1'" found.log

:putfile
set FILENAME=%~1
set FILENAME=%FILENAME:*/cvsroot/=/%
echo F %FILENAME%>>found.log
goto :EOF
