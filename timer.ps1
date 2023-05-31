$waitTime = Read-Host "How long to wait (in minutes)"
$waitTime = New-TimeSpan -Minutes $waitTime
$startTime = Get-Date
$currentTime = $startTime
$endTime = $startTime + $waitTime
$message = "Waiting until {0:HH:mm}" -f $endTime

while ($currentTime -lt $endTime) {
    $remainingSeconds = ($endTime - $currentTime).TotalSeconds
    $waitedTime = $currentTime - $startTime 
    $progress = [int](($waitedTime.TotalSeconds / $waitTime.TotalSeconds) * 100)
    Write-Progress -Activity $message -Status "$progress% Complete:" -PercentComplete $progress -SecondsRemaining $remainingSeconds
    Start-Sleep -Seconds 1
    $currentTime = Get-Date
}


$wshell = New-Object -ComObject Wscript.Shell
$wshell.Popup("Time is over.")
