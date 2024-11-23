# Define the OU where users will be created
$OU = "OU=Development-Team,DC=techwave,DC=local"
# Define the group to which users will be assigned
$group = "Developers"

#Make sure if the group is already excist
if (-not (Get-ADGroup -Filter { Name -eq $group })) {
    # If Not! create a new one
    New-ADGroup -Name $group -GroupScope Global -Path $OU -Description "Group for developers Team"
    Write-Host "Group $group created."
} else {
    Write-Host "Group $group already exists."
}

# Define the users with names
$users = @(
    @{Name = "Samy Ahmed"; Password = "P@ssw0rd123"},
    @{Name = "Peter Mark"; Password = "P@ssw0rd123"},
    @{Name = "Mariam Saeed"; Password = "P@ssw0rd123"}
)

# Loop through each user and create them in AD, then add to the group
foreach ($user in $users) {
    $username = $user.Name
    $password = ConvertTo-SecureString $user.Password -AsPlainText -Force
    
    # Create user in Active Directory
    New-ADUser -Name $username -GivenName $username -SamAccountName $username -UserPrincipalName "$username@techwave.local" `
               -Path $OU -AccountPassword $password -Enabled $true
    
    # Add user to group
    Add-ADGroupMember -Identity $group -Members $username
    
    Write-Host "User $username created and added to $group group."
}

Write-Host "All users created and assigned to the group."