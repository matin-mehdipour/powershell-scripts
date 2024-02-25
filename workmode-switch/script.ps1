
param(
    [Parameter(Mandatory=$true)]
    [string[]]$Arguments
)

# Create an ArrayList
$appList = New-Object System.Collections.ArrayList

$appList.Add("chrome")
$appList.Add("slack")
$appList.Add("8x8 Work")

$processIDs = New-Object System.Collections.ArrayList


param(
    [Parameter(Mandatory=$true)]
    [string[]]$Arguments
)

# Access individual arguments
$mode = $Arguments[0]

if ($mode -eq "wm") 
{
    # Do something
}

elif ($mode -eq "nm")
{
 
    foreach ($app in $appList)
    {
        $process = Get-Process -Name $app -ErrorAction SilentlyContinue
        if ($process -ne $null)
        {
            $processIDs.Add($process.Id)
        }
    }


}
    