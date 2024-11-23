# Backup script (backup.sh)
#!/bin/bash
rsync -a /source/home /backup/

# Make it executable
chmod +x /path/to/backup.sh

# Schedule it in cron (edit cron jobs)
crontab -e

# Add this line to schedule the backup every day at 2 AM
0 2 * * * /var/backups/backup.sh
#!/bin/bash

#Source Directory
SOURCE_DIR="/home/"

#Destination Directory
DEST_DIR="/var/backups/"

#Backup File
BACKUP_FILE="$DEST_DIR/home_backup_$(date +%Y%m%d_%H%M%S).tar.gz"

#print a massege when starting the backup
echo "Starting backup from $SOURCE_DIR to $BACKUP_FILE"

# create backup using tar
tar -czvf "$BACKUP_FILE" "$SOURCE_DIR"

# check if the backup is success or not
if [ $? -eq 0 ]; then
  echo "Backup completed successfully!"
else
  echo "Backup failed!"
fi
