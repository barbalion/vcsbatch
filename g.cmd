@echo off
set VCS_BAT=g
set VCS_CMD=git.cmd
set EDITOR="%~dp0ThirdParty\npp\notepad++.exe"

%~dp0vcs %*
