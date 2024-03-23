

function Main 
{
    if (Get-AzContext -ErrorAction SilentlyContinue)
    {
        Write-Host "Connected to Azure"
    }
    else
    {
        Write-Host "Not connected to Azure"
        Read-Host "Press Enter to connect to Azure"
        Connect-AzAccount
    }
    #Connect-AzAccount

    $fileContent = Get-Content -Path "input.csv"
    foreach ($line in $fileContent)
    {   
        #Write-Host "Processing line: $line"
        $lineArray = $line -split ","
        $email = $lineArray[0]
        $name = $lineArray[1]

        $emailSplit = $email -split "@"

        Write-Host "Email: $email"
        #Write-Host "Name: $name"
        $name = $name.Trim()

        $displayName = $name
        $userPrincipalName = $emailSplit[0].Trim() + "@egnyteinternal.com"
        $password = ConvertTo-SecureString "Egnyte$Welcome1234!!!" -AsPlainText -Force 
        $accountEnabled = $true

        # Create the new user
        Write-Host $emailSplit[0]
        $result = New-AzADUser -DisplayName $displayName -UserPrincipalName $userPrincipalName -AccountEnabled $accountEnabled -Password $password -MailNickname $emailSplit[0].Trim()
        Write-Host $result
        Write-Host "----------------------------------------------------------------------------------"
    }
}

Main