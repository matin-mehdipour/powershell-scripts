$currentDirectory = Get-Location
$fileName = "input.csv"

$filepath = "$currentDirectory/$fileName"

$inputFile = Import-Csv -Path $filepath -Delimiter ","

foreach ($line in $inputFile) {
    $line
}