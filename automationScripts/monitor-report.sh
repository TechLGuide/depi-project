#!/bin/bash

# Define the report file path
report_path="/var/reports/system_report.txt"

# Get system statistics
cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
memory_info=$(free -m)
used_memory=$(echo "$memory_info" | awk 'NR==2{printf "%.2f", $3}')
total_memory=$(echo "$memory_info" | awk 'NR==2{printf "%.2f", $2}')
free_memory=$(echo "$memory_info" | awk 'NR==2{printf "%.2f", $4}')
disk_space=$(df -h / | awk 'NR==2{printf "%s", $4}')

# Create report content
report_content="System Report - $(date)\n
CPU Usage: $cpu_usage%\n
Total Memory: $total_memory MB\n
Used Memory: $used_memory MB\n
Free Memory: $free_memory MB\n
Free Disk Space: $disk_space\n"

# Write report to file
echo -e "$report_content" > $report_path