
$charArray = [System.Collections.ArrayList](65..90) | ForEach-Object {[char]$_}

$drivePaths = {"\\raven\programs", "\\raven\movies"}

$usedDriveLetters = Get-PSDrive -PSProvider FileSystem | Select-Object -ExpandProperty Name

$mountedDrives = Get-SmbMapping | Select-Object -ExpandProperty LocalPath

function GetRandomChar() 
{
    $random = Get-Random -Minimum 0 -Maximum ($charArray.Length - 1)
    return $charArray[$random]
}


foreach ($drive in $mountedDrives) 
{
   Remove-SmbMapping -LocalPath $drive -Force
}

$pathCount = 0

while($pathCount -Lt $drivePaths.Length)
{
    $charIndex = GetRandomChar
    $char = $charArray[$charIndex]
    if ($usedDriveLetters -NotContains $char)
    {
        $drivePath = $drivePaths[$pathCount]
        New-SmbMapping -LocalPath $char -RemotePath $drivePath -Persistent $true
        $charArray.Remove($char)
        $pathCount++
    }
    
}

