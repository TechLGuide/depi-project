# Define the report file path
$reportPath = "C:\Users\esraa\Documents\Reports\SystemReport.txt"

# Get system statistics
$cpuUsage = Get-WmiObject -Class Win32_Processor | Measure-Object -Property LoadPercentage -Average | Select-Object -ExpandProperty Average
$memory = Get-WmiObject -Class Win32_OperatingSystem
$totalMemory = [math]::round($memory.TotalVisibleMemorySize / 1MB, 2)
$freeMemory = [math]::round($memory.FreePhysicalMemory / 1MB, 2)
$usedMemory = [math]::round($totalMemory - $freeMemory, 2)

$diskSpace = Get-PSDrive C
$totalDiskSpace = [math]::round($diskSpace.Used / 1GB, 2)
$freeDiskSpace = [math]::round($diskSpace.Free / 1GB, 2)

# Create report content
$reportContent = @"
System Report - $(Get-Date)

CPU Usage: $cpuUsage%
Total Memory: $totalMemory MB
Used Memory: $usedMemory MB
Free Memory: $freeMemory MB
Total Disk Space: $totalDiskSpace GB
Free Disk Space: $freeDiskSpace GB
"@

# Write report to file
Add-Content -Path $reportPath -Value $reportContent
