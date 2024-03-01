


# Create an ArrayList
$appList = New-Object System.Collections.ArrayList

$userProfilePath = $env:USERPROFILE


$appMap = @{
    "chrome" = "C:\Program Files\Google\Chrome\Application\chrome.exe"
    "slack" =  Join-Path -Path $userProfilePath -ChildPath "AppData\Local\slack\app-4.36.140\slack.exe"
    "8x8 Work" = "C:\Program Files (x86)\8x8 Virtual Office\8x8 Virtual Office.exe"
   # "zoom" =  Join-Path -Path $userProfilePath -ChildPath "AppData\Roaming\Zoom\bin\Zoom.exe"
}





# Access individual arguments
$mode = $args[0]

if ($mode -eq "wm") 
{
   foreach ($app in $appMap.Keys)
   {
       Start-Process -FilePath $appMap[$app] | Out-Null
   }
}

elseif ($mode -eq "nm")
{
 
    foreach ($app in $appMap.Keys)
    {
        $process = Get-Process | Where-Object { $_.ProcessName -eq $app }
        if ($process.Id -ne $null)
        {
            Stop-Process -Id $process.Id -Force
        }
    }


}
    