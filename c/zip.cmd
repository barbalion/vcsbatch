REM : ��⠭�������� �⥯��� ᦠ�� ��।������� �/�� CVS ������.
REM : ���⠪��: "zip [level] [c_command]"
REM : ���ᠭ��:
REM :   level - �᫮ �� 0 �� 9 
REM :     ᮮ⢥����� ��ࠬ���� ���������� ��ப� CVS: -z0..-z9
REM :   �� 㬮�砭�� �ᯮ������ -z9
REM :   �ਬ���: 
REM :     "c zip 0"
REM :     "c zip 0 s"
REM :

if "%~1" == ""  c h zip

if "%~1" == "0" (
  set CVS_COMPOPT= 
  echo Set no compression.
) else (
  set CVS_COMPOPT=-z%~1
  echo Set "%CVS_COMPOPT%".
)

set params=
:loopparams
set params=%params% %~1
shift
if not "%~1" == "" goto loopparams

c %params%
