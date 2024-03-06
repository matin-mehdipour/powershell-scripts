function Main 
{
    # Get the selected file paths from the Explorer window
    $selectedFiles = Get-Clipboard -Format FileDropList

    # Check if any files are selected
    if ($selectedFiles.Count -eq 0)
    {
        Write-Host "No files selected."
        exit
    }

    # Process each selected file
    foreach ($file in $selectedFiles)
    {
        # Replace this with your desired action
        # For example, you can print the file path
        Write-Host "Processing file: $file"

        $folderPath = Split-Path -Parent $file
        $filename = Split-Path -Leaf $file

        $filename = $filename -replace ".rar|.zip", ""

        $destPath = $folderPath + "\" + $filename

        $7zArgs = "x -o $destPath  $file"
        
        Start-Process -FilePath "C:\7z2401-extra\7za.exe" -ArgumentList $7zArgs -Wait


    }

    Write-Host "Script completed."

    
}

Main