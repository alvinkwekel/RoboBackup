@ECHO OFF
REM Expand %1 and %2 removing any surrounding quotes (")
SET CustomerID=%~1
SET BackupName=%~2
REM Expand %3 to a fully qualified path name
SET AppPath=%~f3
REM Use UnxUtils date.exe to format current date-time
FOR /f "tokens=*" %%i IN ('date.exe +"%%Y-%%m-%%dT%%H-%%M-%%S"') DO SET DateTime=%%i
SET LogFile=%CustomerID%_%BackupName%_%DateTime%.log
REM Output command as is going to be executed in same format as RoboCopy states its Job File and Log File
ECHO  Command: ROBOCOPY /JOB:"%AppPath%\jobs\%BackupName%.RCJ" /LOG+:"%AppPath%\log\%LogFile%" /FFT /TEE
REM Actual command
ROBOCOPY /JOB:"%AppPath%\jobs\%BackupName%.RCJ" /LOG+:"%AppPath%\log\%LogFile%" /FFT /TEE
ECHO.
ECHO Backup %BackupName% completed. Review log for details.
ECHO.