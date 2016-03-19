REM : Enable folder processing.
REM : Syntax: "full <command> [options]"
REM : Description:
REM :   This is a foolproof command. It enables 'full' mode for folder processing 
REM :   (rather than simple files)  for some commands like "j", "unj", "uc"...
REM :   Examples: 
REM :     "c full uc" - will get 'clean copy' of CVS for the current dir. 
REM :   Without this mode enabled "c uc" will fail. This is a part of foolproof policy.
REM :

SET ALLOW_FULL=1
%VCS_BAT% %*