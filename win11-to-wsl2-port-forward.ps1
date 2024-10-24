$WSL_IP_ADDR_INFO = bash.exe -c "ip a | grep 'inet .* scope global eth0'"
$WSL_IPV4_REGEXP = 'inet\s+([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3})\/[0-9]{1,2}\s+.*?eth0'
$WSL_IPV4_REGEXP_MATCHES = [regex]::Match($WSL_IP_ADDR_INFO, $WSL_IPV4_REGEXP)
$WSL_IPV4 = $matches[0].Groups[1].Value

if (!$WSL_IPV4) {
  Write-Host "ERROR: WSL2 IP address could not be found"
}

#[Ports]
$LISTEN_ADDRESS = '0.0.0.0' # Local IPV4 (HostAddress)
$PORTS = @(3000, 3001, 5500, 5173, 8000)

# Remove existing firewall inbound/outbound rules
iex "Remove-NetFireWallRule -DisplayName 'WSL2 Firewall Unlock'"

# Add firewall inbound/outbound rules
iex "New-NetFireWallRule -DisplayName 'WSL2 Firewall Unlock' -Direction Outbound -LocalPort $PORTS_ARR -Action Allow -Protocol TCP"
iex "New-NetFireWallRule -DisplayName 'WSL2 Firewall Unlock' -Direction Inbound -LocalPort $PORTS_ARR -Action Allow -Protocol TCP"

# Forward requests from each port to WSL
for ($i = 0; $i -lt $PORTS.length; $i++) {
  $PORT = $PORTS[$i]
  # Remove any existing port proxies/forwards for PORT/ADDRESS
  iex "netsh interface portproxy delete v4tov4 listenport=$PORT listenaddress=$LISTEN_ADDRESS"
  # Add new port proxy/forward for PORT/ADDRESS routing to same port on WSL2 Instance Local IPV4 (HostAddress)
  iex "netsh interface portproxy add v4tov4 listenport=$PORT listenaddress=$LISTEN_ADDRESS connectport=$PORT connectaddress=$WSL_IPV4"

  Write-Host "Configured port forwarding for port: $port to IP: $WSL_IPV4"
}
