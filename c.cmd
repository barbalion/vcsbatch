@echo off
if not defined CVS_COMPOPT set CVS_COMPOPT=-z9
set VCS_BAT=c
set VCS_CMD=call cvs %CVS_COMPOPT%

%~dp0vcs %*
