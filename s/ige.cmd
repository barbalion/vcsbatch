REM : �������஢��� �����-����.
REM : ���⠪��: "ige [dir]"
REM : ���ᠭ��:
REM :   �������� �� ��।���� 䠩�� � 䠩� .svnignore
REM :   �ਬ���: 
REM :     "s ige"
REM :

if "%1" == "" s ige .\

call svn pe svn:ignore %~dp1
