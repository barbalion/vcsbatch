REM : ����� ��������� 䠩���.
REM : ���⠪��: "l [<files>] [cvs_options]"
REM : ���ᠭ��:
REM :   "cvs log -N" - �����뢠�� ����� ������� 䠩��� (��� ���)
REM :   �ਬ���: 
REM :     "c l Client/PlanDoc/ExpBudgetReport.pas"
REM :

CHCP 1251 >nul
call %VCS_CMD% log -N %* | more
