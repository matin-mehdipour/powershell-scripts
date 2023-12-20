# Specify the network path and credentials
$networkPath = "\\server\share"



# Get available drive letters
$usedDriveLetters = Get-WmiObject Win32_LogicalDisk | Select-Object -ExpandProperty DeviceID
$availableDriveLetters = [char]('C'..'Z' | Where-Object { $_ -notin $usedDriveLetters })

# Check if there are available drive letters
if ($availableDriveLetters.Count -eq 0) {
    Write-Host "No available drive letters."
} else {
    # Choose a random available drive letter
    $driveLetter = $availableDriveLetters | Get-Random

    # Map the network drive
    New-PSDrive -Name $driveLetter -PSProvider FileSystem -Root $networkPath -Persist -Credential $credentials

    # Optionally, display the mapped drive
    Get-PSDrive -Name $driveLetter
}
