REM : ���� 㤠������ 䠩��� � ९����ਨ.
REM : ���⠪��: "dead [<filter>]"
REM : ���ᠭ��:
REM :   ��� � ⥪�饬 ��⠫��� (��� ४��ᨨ �� �����⠫����) � ९����ਨ 
REM :   㤠����� 䠩��, ���室�騥 ��� 䨫���, � ᪫��뢠�� �� � ����� 
REM :   � ����䨪��஬ D.
REM :   �ਬ���: 
REM :     "c dead .sql"
REM :

if "%~1" == "" (
  for /f %%i in ('%VCS_CMD% log -l -R 2^>nul ^| find "/Attic/"') do call :putfile %%i
  c mkst "Deleted files" dead.log
) else (
  for /f %%i in ('%VCS_CMD% log -l -R 2^>nul ^| find "/Attic/" ^| find /i "%~1"') do call :putfile %%i
  c mkst "Deleted '%~1' files" dead.log
)


:putfile
set FILENAME=%~1
set FILENAME=%FILENAME:*/Attic/=%
echo D %FILENAME% >>dead.log
goto :EOF
