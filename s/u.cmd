REM : ������.
REM : ���⠪��: "u [svn_options] [<files>]"
REM : ���ᠭ��:
REM :   "svn update". �᫨ 䠩�� �� 㪠����, � ���������� ⮫쪮 䠩��, 
REM :   ����祭�� � ��᫥���� ����� (�. ������� "s") ��� U,C,M 
REM :   (�� ����������, ���䫨���, ���������). 
REM :   �������� �믮������ �������� ᪫��뢠���� � 䠩� update.log.
REM :   �ਬ���: 
REM :     "s u"
REM :     "s u Client/PlanDoc/ExpBudgetReport.pas"
REM :

echo.>> update.log
echo %DATE%, %TIME%>> update.log
if "%~1" == "" (
  call s ls -f "]U" -f "]C" -f "]M" -f "update:" u
  goto :EOF
) 
echo Update %DATE% %TIME%
call svn up %* >> update.log
