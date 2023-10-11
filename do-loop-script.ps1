# Define the URL you want to send the GET request to
$url = "https://matintest.egnyte.com/v5/settings-ed"

# Define the headers you want to include in the request
$headers = @{
    "Authorization" = "OAUTH oauth_token=3700930f-865b-4884-a3cc-1617fd60be1c,oauth_version=2.0"
    "Content-Type" = "application/json"
    "User-Agent" = "Egnyte/3.15.1.2"
    "Egnyte-Client-Revision" = "ELC/167241"
    "X-Egnyte-Action-Sources" = "EGD"
}

$response = Invoke-WebRequest -Uri $url -Headers $headers -Method Get

Write-Host $response.headers
Write-Host "---------------------------------------------------"
Write-Host $response.StatusCode