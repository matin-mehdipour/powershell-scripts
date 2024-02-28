


# Create an ArrayList
$appList = New-Object System.Collections.ArrayList

$userProfilePath = $env:USERPROFILE


$appMap = @{
    "chrome" = "C:\Program Files\Google\Chrome\Application\chrome.exe"
    "slack" = "%userprofile%\AppData\Local\slack\slack.exe"
    "8x8 Work" = "C:\Program Files (x86)\8x8 Virtual Office\8x8 Virtual Office.exe"
    "zoom" = "%userprofile%\AppData\Roaming\Zoom\bin\Zoom.exe"
}


$processIDs = New-Object System.Collections.ArrayList



# Access individual arguments
$mode = $args[0]

if ($mode -eq "wm") 
{
   foreach ($app in $appMap.Keys)
   {
       $process = Start-Process -FilePath $appMap[$app] -PassThru
       $processIDs.Add($process.Id)
   }
}

elseif ($mode -eq "nm")
{
 
    foreach ($app in $appMap.Keys)
    {
        $appList.Add($app)
    }
    foreach ($id in $processIDs)
    {
        Stop-Process -Id $id
    }


}
    