@echo off
if defined GIT_HOME goto run
if exist %ProgramFiles(x86)%/git/cmd/git.exe (
  set GIT_HOME=%ProgramFiles(x86)%/git
  goto run
)
if exist %ProgramFiles%\git\cmd\git.exe (
  set GIT_HOME=%ProgramFiles%\git
  goto run
)
if exist %~dp0ThirdParty\git\cmd\git.exe (
  set GIT_HOME=%~dp0ThirdParty\git
  goto run
)
echo GIT_HOME is undeffined. Unable to find git.
goto :EOF
:run
@if DEFINED _VCS_DEBUG echo DEBUG: "%GIT_HOME%\cmd\git.exe" %* > con
@"%GIT_HOME%\cmd\git.exe" %*
