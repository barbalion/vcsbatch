REM : Commit changes.
REM : Syntax: "c [options] [<files>]"
REM : Description:
REM :   Shortcut for "commit". The end. 
REM : Exmaples: 
REM :   "c"
REM :   "c DOC/accounts.txt Client/PlanDoc/ExpBudgetReport.pas"
REM :

echo.>>commit.log
echo %DATE% %TIME%>>commit.log
echo Commit %DATE% %TIME%
%VCS_CMD% commit %* >>commit.log
