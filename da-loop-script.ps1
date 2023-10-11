# Define the URL you want to send the GET request to
$url = "https://matintest.egnyte.com/v5/settings-ed"

# Define the headers you want to include in the request
$headers = @{
    "Authorization"           = "OAUTH oauth_token=3700930f-865b-4884-a3cc-1617fd60be1c,oauth_version=2.0"
    "Content-Type"            = "application/json"
    "User-Agent"              = "Egnyte/3.15.1.2"
    "Egnyte-Client-Revision"  = "ELC/167241"
    "X-Egnyte-Action-Sources" = "EGD"
}

function parseDict($dict)
{
    $output = ""
    foreach ($key in $dict.Keys)
    {
        $output += "$key : $($dict[$key])"
    }
    return $output
}


New-Item -ItemType "file" -Path ".\output.txt" -Force | Out-Null

$count = 0

while ($true)
{
    try
    {
        $count++
        Write-Host "-------------------Run $($count)--------------------------------"
        $response = Invoke-WebRequest -Uri $url -Headers $headers -Method Get

        Write-Host "Response Headers: "  $response.headers
        Write-Host "---------------------------------------------------"
        Write-Host "Response Status Code " $response.StatusCode
        Write-Host "---------------------------------------------------`r`n"
        Add-Content -Path ".\output.txt" -Value "-------------------Run $($count)--------------------------------"
        Add-Content -Path ".\output.txt" -Value "Response Headers:   $(parseDict($response.headers))"
        Add-Content -Path ".\output.txt" -Value "---------------------------------------------------"
        Add-Content -Path ".\output.txt" -Value "Response Status Code  $($response.StatusCode)"
        Add-Content -Path ".\output.txt" -Value "---------------------------------------------------`r`n"
        Start-Sleep -Seconds 2
    }
    catch
    {
        Write-Host "An error occurred: $($_.Exception.Message)"
    }
    
}

