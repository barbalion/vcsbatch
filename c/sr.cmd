REM : ������� ����� ���������� �� 㪠������ ��⪨.
REM : ���⠪��: "sr <branch>"
REM : 

echo Status on %DATE% %TIME%: >status.log
(
  if "%~1" == "" (
    echo ������ ����
  ) else (
    call %VCS_CMD% -n -q update -r %~1 -d 2>cvserr.log
  )
) | sort | find "" /n /v >>status.log

type cvserr.log | find "cvs update: New directory" /v >>status.log
del cvserr.log >nul 2>&1

type status.log | more
