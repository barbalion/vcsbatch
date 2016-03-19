@echo off
set VCS_BAT=s
set VCS_CMD=call svn
set SVN_EDITOR=notepad

%~dp0vcs %*
