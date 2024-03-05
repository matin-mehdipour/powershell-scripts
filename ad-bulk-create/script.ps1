
$inputPath = ''


function Main 
{
    $inputPath = $args[1]

    if ($inputPath -eq '') 
    {
        Write-Host "Please provide a path to the file"
        return
    }
}
function parseInput()
{
    $inputLines = Get-Content $inputPath

    foreach ($line in $inputLines)
    {
       $name = $line.Split(',')
       $username = $name[0].Substring(0,1) + $name[1]
    }
}
function addUser($username, $name)
{
    $username = $username.ToLower()

    $userParams = @{
        SamAccountName  = $username
        UserPrincipalName = $username + "@matinhome.app"
        Name            = $name[0] + " " + $name[1]
        GivenName       = $name[0]
        Surname         = $name[1]
        DisplayName     = $name[0] + " " + $name[1]
        Enabled         = $true
        AccountPassword = (ConvertTo-SecureString -AsPlainText "Support123" -Force)
    }

    New-ADUser @userParams
}

Main