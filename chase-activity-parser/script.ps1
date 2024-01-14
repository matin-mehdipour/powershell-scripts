$currentDirectory = Get-Location
$fileName = "input.csv"

$filepath = "$currentDirectory/$fileName"

$inputFile = Import-Csv -Path $filepath -Delimiter ","

# Create an ArrayList
$rows = New-Object System.Collections.ArrayList

function getMatchingRows($stringMatch)
{
    $matchingRows = @()

    foreach ($row in $rows)
    {
        if ($row.Description -imatch $stringMatch)
        {
            $matchingRows += $row
        }
    }

    return $matchingRows
}


foreach ($line in $inputFile) 
{
    $rows.Add($line) > $null
}

Write-Host "finished reading file"

while ($true)
{
    Write-Host "entered while"
    $userInput = Read-Host "Enter a command"
    $matchingRows = getMatchingRows($userInput)

    $matchingRows
    

  
}

