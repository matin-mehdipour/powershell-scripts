Import-Module ActiveDirectory

$inputPath = ''


function Main 
{
    $inputPath = "input.csv"

    if ($inputPath -eq '') 
    {
        Write-Host "Please provide a path to the file"
        return
    }
    parseInput
}
function parseInput()
{
    $inputLines = Get-Content $inputPath

    foreach ($line in $inputLines)
    {
       $fullName = $line.Split(',')
       addUser($fullName)
    }
}
function addUser($fullName)
{
    $userName = $fullName[0].Substring(0,1) + $fullName[1]
     
    $userName = $userName.ToLower()

    Write-Host "Adding user $userName"

    $userParams = @{
        SamAccountName  = $userName
        UserPrincipalName = $userName + "@matinhome.app"
        Name            = $fullName[0] + " " + $fullName[1]
        GivenName       = $fullName[0]
        Surname         = $fullName[1]
        DisplayName     = $fullName[0] + " " + $fullName[1]
        Enabled         = $true
        AccountPassword = (ConvertTo-SecureString -AsPlainText "Support123" -Force)
        Path = "OU=TestUsers,DC=matinhome,DC=app"
    }

    New-ADUser @userParams
}

Main