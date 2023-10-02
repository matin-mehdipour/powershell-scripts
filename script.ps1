# Define the URL you want to send the GET request to
$url = "https://matintest.egnyte.com/pubapi/v2/users"

# Define the headers you want to include in the request
$headers = @{
    "Authorization" = "Bearer dbqf3vx29edcdqe9uhng22mg"
}

# Send the GET request with headers
$response = Invoke-RestMethod -Uri $url -Method Get -Headers $headers

# Display the response
$response

Write-Host: 

#$jsonObject = $response.body | ConvertFrom-Json

#Write-Host "Resources: $($jsonObject.resources)"