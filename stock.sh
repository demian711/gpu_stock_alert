#!/bin/bash

continue=true

declare -A consoleurl
declare -A graphicurl


# Series X
consoleurl[https://www.xbox.com/es-ES/consoles/xbox-series-x\#purchase]="conseguirla ahora"

# Neobyte
# url[https://www.neobyte.es/asus-tuf-rtx-3080-oc-gaming-10gb-7281.html]="No disponible"
# # Aussar
graphicurl[https://www.aussar.es/tarjetas-graficas/zotac-gaming-geforce-rtx-3060-twin-edge.html]="Notificarme cuando esté disponible"
graphicurl[https://www.aussar.es/tarjetas-graficas/zotac-gaming-geforce-rtx-3060-twin-edge-oc.html]="Notificarme cuando esté disponible"
graphicurl[https://www.aussar.es/tarjetas-graficas/zotac-gaming-geforce-rtx-3060-amp-white-edition-12gb.html]="Notificarme cuando esté disponible"
graphicurl[https://www.aussar.es/tarjetas-graficas/gigabyte-aorus-geforce-rtx-3060-ti-master-8g.html]="Notificarme cuando esté disponible"
graphicurl[https://www.aussar.es/tarjetas-graficas/gigabyte-geforce-rtx-3060-ti-gaming-oc-8g.html]="Notificarme cuando esté disponible"
graphicurl[https://www.aussar.es/tarjetas-graficas/gigabyte-geforce-rtx-3060-ti-eagle-oc-8g.html]="Notificarme cuando esté disponible"
graphicurl[https://www.aussar.es/tarjetas-graficas/zotac-geforce-rtx-3060-ti-twin-edge-8gb-oc.html]="Notificarme cuando esté disponible"
graphicurl[https://www.aussar.es/tarjetas-graficas/palit-geforce-rtx-3060-ti-dual-8gb.html]="Notificarme cuando esté disponible"
graphicurl[https://www.aussar.es/tarjetas-graficas/zotac-geforce-rtx-3060-ti-twin-edge-8gb.html]="Notificarme cuando esté disponible"
graphicurl[https://www.aussar.es/tarjetas-graficas/gigabyte-geforce-rtx-3060-ti-eagle-8g.html]="Notificarme cuando esté disponible"
graphicurl[https://www.aussar.es/tarjetas-graficas/gigabyte-geforce-rtx-3060-ti-gaming-pro-oc-8g.html]="Notificarme cuando esté disponible"
# # Coolmod
# url[https://www.coolmod.com/msi-geforce-rtx-3080-gaming-x-trio-10gb-gddr6x-tarjeta-grafica-precio]="agotado"

while [[ true ]]; do

  retrieve_availability () {
    echo "Doing curl of $1, with message $2"
    (curl "$1" | grep -i "$2" > /dev/null 2>&1)
    result=$?
    return 6
  }

  # for KEY in "${!consoleurl[@]}"; do
  #   retrieve_availability "$KEY" "${consoleurl[$KEY]}"

  #   if [[ $result == 0 ]]; then
  #     (cd $1 && ./notify-send-telegram.py -t $2 -r $3 "Stock available in $KEY")
  #     continue=false
  #   fi
  # done

  for KEY in "${!graphicurl[@]}"; do
    retrieve_availability "$KEY" "${graphicurl[$KEY]}"

    if [[ $result == 1 ]]; then
      (cd $1 && ./notify-send-telegram.py -t $2 -r $3 "Graphic stock available in $KEY")
      (cd $1 && ./notify-send-telegram.py -t $2 -r $4 "Graphic stock available in $KEY")
      continue=false
    fi
    sleep 10
  done

done