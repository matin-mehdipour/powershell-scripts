# Define the main function

global $youTube
global $netflix
global $hulu

function Main 
{
    global $youTube
    global $netflix
    global $hulu

    $youTube = "https://www.youtube.com"
    $netflix = "https://www.netflix.com"
    $hulu = "https://www.hulu.com"

    $site = $args[1]
}

# Call the main function
Main