REM : ����� ��������� 䠩���.
REM : ���⠪��: "l [<files>] [svn_options]"
REM : ���ᠭ��:
REM :   "svn log -N" - �����뢠�� ����� ������� 䠩��� (��� ���)
REM :   �ਬ���: 
REM :     "s l Client/PlanDoc/ExpBudgetReport.pas"
REM :

CHCP 1251 >nul
call svn log %* | more
