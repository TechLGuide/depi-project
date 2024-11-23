# Update-Windows.ps1
# Automatically checks for and installs Windows updates

Write-Output "Checking for updates..."
# Check for updates
Install-WindowsUpdate -AcceptAll -AutoReboot
Write-Output "Updates installed successfully."

# Import the Update module if not already loaded
Import-Module PSWindowsUpdate

# Search for available updates
$updates = Get-WindowsUpdate -AcceptAll -Install -AutoReboot

# Log the results
$logPath = "C:\Logs\MonthlyPatchUpdate.log"
$updates | Out-File -FilePath $logPath -Append

Write-Host "Monthly patch updates applied successfully on $(Get-Date)." | Out-File $logPath -Append
