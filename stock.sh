#!/bin/bash

continue=true

declare -A url
# Neobyte
url[https://www.neobyte.es/grafica-msi-rtx-3080-ventus-3x-10g-oc-7290.html]="No disponible"
url[https://www.neobyte.es/asus-tuf-rtx-3080-oc-gaming-10gb-7281.html]="No disponible"
# Aussar
url[https://www.aussar.es/tarjetas-graficas/zotac-geforce-rtx-3080-trinity-10gb-gddr6x.html]="Notificarme cuando esté disponible"
url[https://www.aussar.es/tarjetas-graficas/zotac-gaming-geforce-rtx-3080-trinity-oc-10gb-gddr6x.html]="Notificarme cuando esté disponible"
url[https://www.aussar.es/tarjetas-graficas/asus-geforce-rtx-3080-tuf-gaming-10gb-gddr6x.html]="Notificarme cuando esté disponible"
url[https://www.aussar.es/tarjetas-graficas/gainward-geforce-rtx-3080-phoenix-gs.html]="Notificarme cuando esté disponible"
url[https://www.aussar.es/tarjetas-graficas/gainward-geforce-rtx-3080-phoenix.html]="Notificarme cuando esté disponible"
url[https://www.aussar.es/tarjetas-graficas/msi-geforce-rtx-3080-ventus-3x-oc-10gb-gddr6x.html]="Notificarme cuando esté disponible"
# Coolmod
url[https://www.coolmod.com/asus-geforce-tuf-rtx-3080-oc-gaming-10gb-gddr6x-tarjeta-grafica-precio]="agotado"
url[https://www.coolmod.com/asus-geforce-tuf-rtx-3080-gaming-10gb-gddr6x-tarjeta-grafica-precio]="agotado"
url[https://www.coolmod.com/pny-geforce-rtx-3080-10gb-xlr8-gaming-epic-x-rgb-10gb-gddr6x-tarjeta-grafica-precio]="agotado"
url[https://www.coolmod.com/zotac-gaming-geforce-rtx-3080-trinity-10gb-gddr6x-tarjeta-grafica-precio]="agotado"
url[https://www.coolmod.com/msi-geforce-rtx-3080-ventus-3x-oc-10gb-gddr6x-tarjeta-grafica-precio]="agotado"
url[https://www.coolmod.com/kfa2-geforce-rtx-3080-sg-1-click-oc-10gb-gddr6x-tarjeta-grafica-precio]="agotado"
url[https://www.coolmod.com/zotac-gaming-geforce-rtx-3080-trinity-oc-10gb-gddr6x-tarjeta-grafica-precio]="agotado"
url[https://www.coolmod.com/evga-geforce-rtx-3080-xc3-gaming-10gb-gddr6x-tarjeta-grafica-precio]="agotado"
url[https://www.coolmod.com/evga-geforce-rtx-3080-xc3-black-gaming-10gb-gddr6x-tarjeta-grafica-precio]="agotado"
url[https://www.coolmod.com/msi-geforce-rtx-3080-gaming-x-trio-10gb-gddr6x-tarjeta-grafica-precio]="agotado"

while [[ true ]]; do

  retrieve_availability () {
    echo "Doing curl of $1, with message $2"
    (curl "$1" | grep -i "$2" > /dev/null 2>&1)
    result=$?
    return 6
  }

  for KEY in "${!url[@]}"; do
    retrieve_availability "$KEY" "${url[$KEY]}"

    if [[ $result == 1 ]]; then
      (mail -s "AVAILABLE STOCK" demian711@hotmail.com <<< "Stock available in $KEY")
      continue=false
    fi

    sleep 2
  done

done
