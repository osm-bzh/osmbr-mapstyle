
echo ""
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo ""
echo " Recuperation dump OSM Bretagne "
echo ""
date
echo ""

# on efface les dumps existants
rm -f /data/dumps/*.pbf

# on récupère le dernier dump Bretagne
wget -O /data/dumps/france-latest.osm.pbf http://download.geofabrik.de/europe/france/bretagne-latest.osm.pbf

echo ""
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo ""
echo " Decoupage dump "
echo ""
date
echo ""

# on le decoupe selon un polygone
# utiliser JOSM avec le plugin poly pour créer un fichier .poly
osmconvert /data/dumps/france-latest.osm.pbf -B=/data/styles/data/bro_leon.poly --complete-ways -v -o=/data/dumps/bro_leon.osm.pbf

echo ""
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo ""
echo " Maj de la BD OSM "
echo ""
date
echo ""

# on supprime les vues
psql -h db.openstreetmap.world -U osmbr -d osm -f /data/styles/br/database/drop_views.sql

# on met à jour la base de données
# authentification dans le .pgpass
osm2pgsql -H db.openstreetmap.world -U osmbr -d osm --hstore --slim --cache 3000 -E 3857 -v /data/dumps/bro_leon.osm.pbf 

# on recrée les vues
psql -h db.openstreetmap.world -U osmbr -d osm -f /data/styles/br/database/create_views.sql

echo ""
echo " Fin de la maj de la BD "
echo ""
date
echo ""
