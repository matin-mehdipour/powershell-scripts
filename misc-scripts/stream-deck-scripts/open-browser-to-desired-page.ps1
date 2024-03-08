# Define the main function



function Main($arg)
{


    $youTube = "https://www.youtube.com"
    $netflix = "https://www.netflix.com"
    $hulu = "https://www.hulu.com"

    $enteredSite = $arg[0]

    if ($enteredSite -eq "youtube") 
    {
        $destUrl = $youTube
    }
    elseif ($enteredSite -eq "netflix") 
    {
        $destUrl = $netflix
    }
    elseif ($enteredSite -eq "hulu") 
    {
        $destUrl = $hulu
    }
    else 
    {
        Write-Host "Invalid Site"
    }

    $result = Start-Process -FilePath "C:\Users\mmehdipour\AppData\Local\Programs\Opera\opera.exe" -passthru -ArgumentList "--remote $destUrl", "--ran-launcher", "--new-window"
    Write-Host Wait-Process $result.Id
}

# Call the main function
Main($args)