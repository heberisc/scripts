net="192.168"
ip1=0
ip2=254
gw=1
# primer for para buscar segmentos activos
for ((i=ip1; i<=ip2; i++)); do
    ip="$net.$i.$gw"
    # si se encuentra un segmento
    if ping -c 1 -w 1 $ip > /dev/null 2>&1; then
        echo "Segmento activo encontrado: $net.$i.0/24"
        # segundo for para escanear todas las IPs dentro de ese segmento
        for (( j=1; j<=254; j++ )); do
            target_ip="$net.$i.$j"
            ping -c 1 -W 1 "$target_ip" > /dev/null 2>&1 && echo "Host activo: $target_ip"
        done
    fi
done
