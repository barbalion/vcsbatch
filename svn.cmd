@if DEFINED _VCS_DEBUG echo DEBUG: "%~dp0ThirdParty\svn\svn" %* > con
@"%~dp0ThirdParty\svn\svn" %*
