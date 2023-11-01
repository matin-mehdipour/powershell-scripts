
function main()
{
    $token = "dbqf3vx29edcdqe9uhng22mg"
    $file = "./test-file.zip"

    $chunkSize = 10485760 # 10MB

    $fileStream = [System.IO.File]::OpenRead($file)
    $buffer = New-Object byte[] $chunkSize
    $bytesRead = 0
    $index = 0

    do
    {
        $bytesRead = $fileStream.Read($buffer, 0, $chunkSize)

        if ($bytesRead -gt 0)
        {
            $chunk = [System.Byte[]]::CreateInstance([System.Byte], $bytesRead)
            [System.Array]::Copy($buffer, 0, $chunk, 0, $bytesRead)

            $chunkBase64 = [System.Convert]::ToBase64String($chunk)

            $headers  = @{
                "Content-Type" = "application/octet-stream"
                "X-Egnyte-Chunk-Num" = $index + 1
                "Authorization" = "Bearer $($token)"
            }
            Write-Host $headers
            $res = Invoke-RestMethod -Uri "https://matintest.egnyte.com/pubapi/v1/fs-content/Shared/test/test-file.zip" -Method Post -Headers $headers -Body $chunkBase64
            Write-Host $res
            $index++
            Start-Sleep 3
        }
    }
    while ($bytesRead -gt 0)
}

main