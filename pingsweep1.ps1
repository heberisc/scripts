for ($i = 1; $i -le 254; $i++) {
    $ip = "172.29.20.$i"
    $pingResult = ping.exe -n 1 -w 100 $ip | Select-String "TTL="
    if ($pingResult) {
        Write-Host "$ip" -ForegroundColor Green
    }
}