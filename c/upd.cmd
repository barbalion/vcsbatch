REM : ����� ������.
REM : ���⠪��: "upd"
REM : ���ᠭ��:
REM :   �������筮 "c up -d -P". � �⫨稥 �� "u" ����� ᮧ������ ��⠫��� �� ������ � 
REM :   ����� �믮������ ��� �ᥬ ९����ਥ�, � �� �⤥��묨 䠩����.
REM :   �ਬ���: 
REM :     "c upd"
REM :     "c upd Client"
REM :

if "%~1" == "" (%VCS_CMD% up -d -P) else (%VCS_CMD% up -d -P %*)
