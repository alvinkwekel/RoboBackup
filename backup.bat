@echo off
REM Set title of the command window
TITLE RoboBackup
SETLOCAL DisableDelayedExpansion
SET AppPath=%cd%
SET SequenceFile=sequence.txt
REM Hard coded customer ID used in the log file
SET CustomerID=007
REM Loop over entries in the sequence file
FOR /F "usebackq delims=" %%a in (`"findstr /n ^^ %SequenceFile%"`) do (
    SET "BackupName=%%a"
    SETLOCAL EnableDelayedExpansion
    SET "BackupName=!BackupName:*:=!"
	CALL runJob.bat "!CustomerID!" "!BackupName!" "!AppPath!"
    ENDLOCAL
)
ECHO All backups are completed.
REM Shut down Windows
ECHO Going to shutdown in 60 seconds.
SHUTDOWN -s -t 60