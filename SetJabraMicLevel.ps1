
Import-Module AudioDeviceCmdlets

# Get all capture (input) devices
$devices = Get-AudioDevice -List | Where-Object { $_.Type -eq 'Recording' -and $_.Name -like '*Jabra*' }

$devices | ForEach-Object {
    Write-Host "Setting input level for: $($_.Index) - $($_.Name)"
    $_ | Set-AudioDevice
    Set-AudioDevice -RecordingMute 0
    Set-AudioDevice -RecordingVolume 100
    Set-AudioDevice -RecordingCommunicationVolume 100
}
