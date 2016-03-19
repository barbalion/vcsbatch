@echo off
set ANT_HOME=%~dp0ThirdParty\ant
set ANT_OPTS=-Xmx1024m
%ANT_HOME%\bin\ant %*
