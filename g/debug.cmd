REM : Enables Git debug-mode (more verbose output) for current operation.
set _VCS_DEBUG=1
set GIT_TRACE=1
set GIT_TRACE_CURL=true
set GIT_TRACE_PERFORMANCE=1
set GIT_TRACE_PACK_ACCESS=1 
set GIT_TRACE_PACKET=1
set GIT_TRACE_PACKFILE=1
set GIT_TRACE_SETUP=1
set GIT_TRACE_SHALLOW=1
set GIT_SSH_COMMAND="ssh -vvv"
%VCS_BAT% %*
