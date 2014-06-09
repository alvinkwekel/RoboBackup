RoboBackup
==========
Robocopy based backup tool. Log will be written to stdout and log file.

Steps
-----
**1. Create jobs**<br/>
Use example from createJob.txt to create a RoboCopy Job-file (with /SAVE option). The script expects all RCJ files in sub directory named jobs. Arguments /FFT /TEE will not stored in the RCJ file but are provided by the script.<br/>
**2. Make job file read only**<br>
attrib +r *file-name*<br/>
**3. Configure sequence**<br/>The script will only run the jobs provided in the sequence.txt file in order of appearance.<br/>
**4. Run or schedule backup**<br/>
Execute the backup.bat to perform the backup.

Artifacts
---------
- **README.md:** This file.
- **backup.bat:** main script; will go over all entries in the sequence.txt passing the entries to the runJob.bat.
- **runJob.bat:** performs the actual job execution.
- **date.exe:** tool to get a nice formatted date to use as log file name.
- **sequence.txt:** contains entries of what jobs to execute.
- **createJob.txt:** example RoboCopy command to create a RCJ file.