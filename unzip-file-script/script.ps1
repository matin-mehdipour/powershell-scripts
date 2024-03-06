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

        & "C:\Program Files\WinRAR\WinRAR.exe" x "C:\Path\To\YourArchive.rar" "C:\Your\Destination\Path\"

    }

    Write-Host "Script completed."

    
}

Main