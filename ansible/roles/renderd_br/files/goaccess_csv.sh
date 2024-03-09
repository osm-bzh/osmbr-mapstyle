# /bin/bash

echo "+++++++++++++++++++++++++++++++++++++++++++++++++"
echo "  analyse des log : création des CSV"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++"
echo ""

yesterday=$(date -d "yesterday" +%Y%m%d)


echo "Analyse globale"
goaccess /var/log/apache2/tile.openstreetmap.bzh.log.1 --log-format=COMBINED -a --anonymize-ip -o /var/cache/renderd/tiles/stats/csv/global_${yesterday}.csv


# tableau des rendus
tiles_services=("br" "oc" "eu" "ca" "gsw")

# Loop through the array
for service in "${tiles_services[@]}"
do
    echo "Analyse du service de tuiles : $service"
    
    grep /${service}/ /var/log/apache2/tile.openstreetmap.bzh.log.1 | goaccess --log-format=COMBINED -a --anonymize-ip -o /var/cache/renderd/tiles/stats/csv/${service}_${yesterday}.csv

done


echo ""
echo "FINI"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++"


# pour crontab :
# # tous les jours à 03h00 : création de stats à partir des logs
# *00 3 * * * /data/scripts/goaccess/goaccess_csv.sh >> /dev/null 2>&1
