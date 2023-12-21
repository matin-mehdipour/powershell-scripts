
$charArray = (65..90) | ForEach-Object {[char]$_}

$usedDriveLetters = Get-PSDrive -PSProvider FileSystem | Select-Object -ExpandProperty Name

$mountedDrives = Get-SmbDrive | Select-Object -ExpandProperty LocalPath

