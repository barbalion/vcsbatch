REM : �� � ��⪨.
REM : ���⠪��: "t [<files>] [cvs_options]"
REM : ���ᠭ��:
REM :   "cvs log -h" - �����뢠�� �� � ��⪨ (��� ���ਨ �������)
REM :   �ਬ���: 
REM :     "c t Client/PlanDoc/ExpBudgetReport.pas"
REM :

CHCP 1251 >nul
%VCS_CMD% log -h %* | more
