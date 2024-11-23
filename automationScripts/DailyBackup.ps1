# Define the source and destination paths
$source = "C:\Users\Esraa\Documents"
$destination = "E:\Documents\Backups"

# Create destination folder if it doesn't exist
if (!(Test-Path -Path $destination)) {
    New-Item -ItemType Directory -Path $destination
}

# Perform the backup using Robocopy with options
Robocopy $source $destination /MIR /Z /R:3 /W:10

# Log the result
$logFile = "E:\Documents\Backups\BackupLog.txt"

# Write a log entry correctly
$logMessage = "$timeStamp Backup completed from $source to $destination"
Add-Content -Path $logFile -Value $logMessage