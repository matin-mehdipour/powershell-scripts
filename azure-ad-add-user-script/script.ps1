

function Main 
{
    if (Get-AzContext -ErrorAction SilentlyContinue)
    {
        Write-Host "Connected to Azure"
        exit
    }
    else
    {
        Write-Host "Not connected to Azure"
        Read-Host "Press Enter to connect to Azure"
        if (Get-Process -Name Connect-AzAccount -ErrorAction SilentlyContinue)
        {
            # If it's still running, stop the process
            Stop-Process -Name Connect-AzAccount -Force
        }       
        $result = Connect-AzAccount
        Write-Host $result
        exit
    }
    #Connect-AzAccount

    $fileContent = Get-Content -Path "input.csv"
    foreach ($line in $fileContent)
    {   
        #Write-Host "Processing line: $line"
        $lineArray = $line -split ","
        $email = $lineArray[0]
        $name = $lineArray[1]

        Write-Host "Email: $email"
        #Write-Host "Name: $name"
        $name = $name.Trim()
        $nameSplit = $name -split " "

        $displayName = "John Doe"
        $userPrincipalName = "johndoe@example.com"
        $password = "YourStrongPasswordHere"
        $accountEnabled = $true

        # Create the new user
        New-AzureADUser -DisplayName $displayName -UserPrincipalName $userPrincipalName -AccountEnabled $accountEnabled -Password $password
    }
}

Main