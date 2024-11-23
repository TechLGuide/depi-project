The automation script developed for this project is a crucial component designed to streamline routine IT management tasks, reduce manual effort, and enhance efficiency. Below is an overview of its key functionalities and features:

📄 Script Overview

The automation script is built using PowerShell (for Windows) and Bash (for Linux) to manage and synchronize data effectively across local and cloud environments. It ensures seamless execution of regular tasks with minimal user intervention.

📂 Automation Tasks Documentation and Video
Explore the details of the automation tasks through the following resources:

📄 Documentation: https://docs.google.com/document/d/1-omqb8aDTbMAmVrs9XqkUgNU4Ps-WRTQ7YEBsZRs6pU/edit?usp=sharing

🎥 Watch on YouTube: https://youtu.be/eSwmCe1R4bg

🔑 Features
# Backup Automation:

Automates the process of backing up files and directories from a source (local system) to a destination (AWS S3 bucket).
Configured to run on a schedule (e.g., every 15 minutes) using Task Scheduler or Cron Jobs.
# Incremental Backup:

Ensures that only new or modified files are synchronized to the destination, saving bandwidth and storage costs.
# Error Logging:

Captures detailed logs of each backup process, including any errors or skipped files, for better debugging and monitoring.
# Cross-Platform Support:

Compatible with both Windows and Linux systems, ensuring flexibility in hybrid infrastructure environments.
# Secure Transfers:

Uses encrypted connections to ensure data security during transfer to AWS S3 or any other destination.
🚀 How It Works
# Input Parameters:

Source Path: Specifies the folder(s) to back up.
Destination Path: Points to the AWS S3 bucket or local backup folder.
Schedule: Configured using Task Scheduler (Windows) or Cron Jobs (Linux).
# Execution Process:

The script scans the source directory for changes.
Transfers new or updated files to the destination.
Logs the results of the operation for review.
# Scheduling:

The script is executed periodically based on predefined intervals (e.g., every 15 minutes or hourly).

⚙️ Technologies Used

PowerShell: Automates tasks on Windows systems.
Bash: Automates tasks on Linux systems.
AWS CLI: Facilitates seamless integration with AWS services.
Task Scheduler / Cron Jobs: Manages script scheduling.

🛠 How to Use

Clone the repository
Configure the script by editing the source and destination paths.
Set up the schedule using Task Scheduler (Windows) or Cron Jobs (Linux).
Run the script and monitor the logs for successful backups

📊 Benefits

Saves time by automating repetitive tasks.
Reduces errors caused by manual processes.
Enhances data security and reliability.
Ensures consistent backups and disaster recovery preparedness.
