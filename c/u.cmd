REM : ������.
REM : ���⠪��: "u [cvs_options] [<files>]"
REM : ���ᠭ��:
REM :   "cvs update". �᫨ 䠩�� �� 㪠����, � ���������� ⮫쪮 䠩��, 
REM :   ����祭�� � ��᫥���� ����� (�. ������� "s") ��� U,C,M 
REM :   (�� ����������, ���䫨���, ���������). 
REM :   �������� �믮������ �������� ᪫��뢠���� � 䠩� update.log.
REM :   �ਬ���: 
REM :     "c u"
REM :     "c u Client/PlanDoc/ExpBudgetReport.pas"
REM :

echo.>> update.log
echo %DATE%, %TIME%>> update.log
if "%~1" == "" (
  call c ls -f "]U" -f "]C" -f "]M" -f "update:" u
  goto :EOF
) 
echo Update %DATE% %TIME%
%VCS_CMD% up -d -P %* >> update.log
