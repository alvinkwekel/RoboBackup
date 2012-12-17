@ECHO OFF
SET CustomerID=%1
SET BackupName=%2
SET AppPath=%3
SET DateTime=%date%_%time%
SET DateTime=%DateTime:/=-%
SET DateTime=%DateTime: =_%
SET DateTime=%DateTime::=-%
SET DateTime=%DateTime:~,-3%
SET LogFile=%CustomerID%_%BackupName%_%DateTime:/=-%.log
ROBOCOPY /JOB:%AppPath%\jobs\%BackupName%.RCJ /LOG:%AppPath%\log\%LogFile%
ECHO.
ECHO Backup %BackupName% completed. Review log for details.
ECHO.