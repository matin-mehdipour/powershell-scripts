
$mode = $args[0]

$interfaceAlias = "Ethernet"

if ($mode -eq "dhcp") 
{
    Set-DnsClientServerAddress -InterfaceAlias $interfaceAlias -ResetServerAddresses
}
elseif ($mode -eq "static") 
{
    $dnsServers = "8.8.8.8", "8.8.4.4"
    Set-DnsClientServerAddress -InterfaceAlias $interfaceAlias -ServerAddresses $dnsServers
}