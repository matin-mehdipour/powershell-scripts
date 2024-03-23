

function Main 
{
    if (Get-AzContext -ErrorAction SilentlyContinue) {
        Write-Host "Connected to Azure"
    } else {
        Write-Host "Not connected to Azure"
        Read-Host "Press Enter to connect to Azure"
        #Connect-AzAccount
    }
    #Connect-AzAccount

    $fileContent = Get-Content -Path "input.csv"
    foreach ($line in $fileContent)
    {   
        Write-Host "Processing line: $line"
        $lineArray = $line -split ","
        $email = $lineArray[0]
        $name = $lineArray[1]

        Write-Host "Email: $email"
        Write-Host "Name: $name"

        $nameSplit = $name -split " "

        
    }
}

Main