REM : ���⢥ত���� ��ࠢ����� ���䫨��.
REM : ���⠪��: "res [svn_options] [<files>]"
REM : ���ᠭ��:
REM :   �������筮 "svn resolve".
REM :   ��� ࠡ��� � 楫� ��⠫����, � �� �⤥��묨 䠩���� �ᯮ���� "full"
REM :   �ਬ���: 
REM :     "s res"
REM :     "s res Client/PlanDoc/ExpBudgetReport.pas"
REM :

if "%~1" == "" if not "%ALLOW_FULL%" == "1" (
  echo Full mode is turned off. Use "full".
  echo.
  s help %~n0
)

s resolved %*
