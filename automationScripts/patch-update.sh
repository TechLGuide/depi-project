#!/bin/bash

# Script for updating Red Hat Enterprise Linux (RHEL) and rebooting if necessary

# Log file location
LOG_FILE="/var/log/system_update.log"

# Print the start time of the update
echo "Starting system update at $(date)" | tee -a "$LOG_FILE"

# Update the package list and install available updates using dnf
echo "Checking for updates using DNF package manager" | tee -a "$LOG_FILE"
sudo dnf check-update | tee -a "$LOG_FILE"
sudo dnf update -y | tee -a "$LOG_FILE"

# Check if a reboot is required (for RHEL, there's no specific reboot-required file, so we assume updates could require a reboot)
if [[ $? -eq 0 ]]; then
    echo "System update completed successfully." | tee -a "$LOG_FILE"
else
    echo "Update failed. Please check the log for details." | tee -a "$LOG_FILE"
    exit 1
fi

# Optionally force a reboot if updates require it (RHEL does not have a reboot-required file like Ubuntu)
# We will reboot in case of any kernel updates
KERNEL_UPDATED=$(rpm -q --last kernel | head -n 1 | grep "$(uname -r)")

if [ -z "$KERNEL_UPDATED" ]; then
    echo "Kernel updated. Rebooting system in 1 minute" | tee -a "$LOG_FILE"
    sudo shutdown -r +1
else
    echo "No reboot required." | tee -a "$LOG_FILE"
fi

# Log the completion of the update
echo "System update process finished at $(date)" | tee -a "$LOG_FILE"
