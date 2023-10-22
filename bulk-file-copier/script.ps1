
$rootFolders = New-Object System.Collections.ArrayList
$rootFiles = New-Object System.Collections.ArrayList

$rootDir = "W:\"

function main()
{
    #get root folders
    $folders = Get-ChildItem $rootDir -Directory
    foreach($folder in $folders)
    {
        $rootFolders.Add($folder.Name)
        $folder.Name
    }

    #get root files
    $files = Get-ChildItem $rootDir -File
    foreach($file in $files)
    {
        $rootFiles.Add($file.Name)
        $file.Name
    }
}
function getFilesFromFolders($folder)
{
    
}


main