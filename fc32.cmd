@echo off
if not defined DIFF_TOOL set DIFF_TOOL="%~dp0ThirdParty\WinMergeU.exe"
%DIFF_TOOL% %*
