REM : Show commit history in compact format. Similar to "log --format=oneline", but cooler.
CHCP 1251 >nul
%VCS_CMD% log --pretty="%%h (%%ci) by %%cN: %%f" %*
