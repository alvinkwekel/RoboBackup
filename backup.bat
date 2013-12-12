@echo off
TITLE RoboBackup
SETLOCAL DisableDelayedExpansion
SET AppPath=%cd%
SET SequenceFile=sequence.txt
SET CustomerID=007
FOR /F "usebackq delims=" %%a in (`"findstr /n ^^ %SequenceFile%"`) do (
    SET "BackupName=%%a"
    SETLOCAL EnableDelayedExpansion
    SET "BackupName=!BackupName:*:=!"
	CALL runJob.bat "!CustomerID!" "!BackupName!" "!AppPath!"
    ENDLOCAL
)
ECHO All backups are completed.
ECHO Going to shutdown in 60 seconds.
SHUTDOWN -s -t 60