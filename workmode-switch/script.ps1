


# Create an ArrayList
$appList = New-Object System.Collections.ArrayList

$appList.Add("chrome")
$appList.Add("slack")
$appList.Add("8x8 Work")
$appList.Add("zoom")

$processIDs = New-Object System.Collections.ArrayList



# Access individual arguments
$mode = $args[0]

if ($mode -eq "wm") 
{
    # Do something
}

elseif ($mode -eq "nm")
{
 
    foreach ($app in $appList)
    {
        $process = Get-Process -Name $app -ErrorAction SilentlyContinue
        if ($process -ne $null)
        {
            $processIDs.Add($process.Id)
        }
    }
    foreach ($id in $processIDs)
    {
        Stop-Process -Id $id
    }


}
    