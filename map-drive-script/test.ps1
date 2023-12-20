

$chars = (65..90) | Out-Null
foreach ($char in $chars) 
{ 
    $char
    $charTemp = [char]$char 
    print($charTemp)
}