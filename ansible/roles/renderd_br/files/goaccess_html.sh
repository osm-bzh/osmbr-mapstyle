# /bin/bash

echo "+++++++++++++++++++++++++++++++++++++++++++++++++"
echo "  analyse des log : création du rapport HTML"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++"
echo ""

yesterday=$(date -d "yesterday" +%Y%m%d)


echo "Analyse globale"
goaccess /var/log/apache2/tile.openstreetmap.bzh.log --log-format=COMBINED -a --anonymize-ip -o /var/cache/renderd/tiles/stats/all.html --ws-url=tile.openstreetmap.bzh


# tableau des rendus
tiles_services=("br" "oc" "eu" "ca" "gsw")

# Loop through the array
for service in "${tiles_services[@]}"
do
    echo "Analyse du service de tuiles : $service"
    
    grep /${service}/ /var/log/apache2/tile.openstreetmap.bzh.log | goaccess --log-format=COMBINED -a --anonymize-ip -o /var/cache/renderd/tiles/stats/${service}.html

done


echo ""
echo "FINI"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++"


# pour crontab :
# # toutes les 15 min : maj rapport HTML du jour
# */15 * * * * /data/scripts/goaccess/goaccess_html.sh >> /dev/null 2>&1
