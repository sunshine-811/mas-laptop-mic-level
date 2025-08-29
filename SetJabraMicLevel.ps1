
Import-Module AudioDeviceCmdlets

# Get all capture (input) devices
$devices = Get-AudioDevice -List | Where-Object { $_.Type -eq 'Capture' -and $_.Name -like '*Jabra*' }

foreach ($device in $devices) {
    Write-Host "Setting input level for: $($device.Name)"
    Set-AudioDevice -InputVolume 100 -Index $device.Index
}
