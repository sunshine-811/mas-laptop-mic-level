
Import-Module AudioDeviceCmdlets

# Get all Jabra recording (input) devices
$devices = Get-AudioDevice -List | Where-Object { $_.Type -eq 'Recording' -and $_.Name -like '*Jabra*' }

$devices | ForEach-Object {
    Write-Host "Setting input level for: $($_.Index) - $($_.Name)"
    $_ | Set-AudioDevice -Verbose
    Set-AudioDevice -RecordingMute 0
    Set-AudioDevice -RecordingCommunicationMute 0
    Set-AudioDevice -RecordingVolume 100
    Set-AudioDevice -RecordingCommunicationVolume 100
}

# Get all Jabra playback (output) devices
$devices = Get-AudioDevice -List | Where-Object { $_.Type -eq 'Playback' -and $_.Name -like '*Jabra*' }

$devices | ForEach-Object {
    Write-Host "Setting playback for: $($_.Index) - $($_.Name)"
    $_ | Set-AudioDevice -Verbose
    Set-AudioDevice -PlaybackMute 0
    Set-AudioDevice -PlaybackCommunicationMute 0
}
