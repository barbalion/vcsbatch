@if DEFINED _VCS_DEBUG echo DEBUG: "%~dp0ThirdParty\cvs" %* >con
@"%~dp0ThirdParty\cvs" %*
