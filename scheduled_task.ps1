# PowerShell script to create a scheduled task with a description

# Path to the script to be executed
$scriptPath = "C:\path\script.ps1"

# Task name
$taskName = "ShadowCopyTask"

# Description of the task
$description = "Your description"

# Create a new trigger to run the task every 5 minutes
$trigger = New-ScheduledTaskTrigger -MinutesInterval 5 -MinutesDuration ([int]::MaxValue)

# Create an action to run the PowerShell script
$action = New-ScheduledTaskAction -Execute "Powershell.exe" -Argument "-WindowStyle Hidden -File `"$scriptPath`""

# Set the principal to run with highest privileges
$principal = New-ScheduledTaskPrincipal -UserId "SYSTEM" -RunLevel Highest

# Register the task
Register-ScheduledTask -TaskName $taskName -Description $description -Trigger $trigger -Action $action -Principal $principal -Force

# Output for confirmation
Write-Host "Task '$taskName' with description '$description' has been created and will run every 5 minutes."
