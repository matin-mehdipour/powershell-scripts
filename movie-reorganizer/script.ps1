
param($Path)


function main()
{
  $files = Get-ChildItem -Path $Path -File -Filter *.mp4
  foreach ($file in $files)
  {
    Write-Host $file
    $name = $file.Name
    $name = $name.Replace(".mp4", "")

    New-Item -ItemType Directory -Path $Path\$name
    Move-Item -Path $file -Destination $Path\$name

  }
  
  
}

main