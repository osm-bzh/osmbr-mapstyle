
echo ""
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo ""
echo " Recuperation dump OSM France "
echo ""
date
echo ""

# on efface les dumps existants
rm -f /data/dumps/*.pbf

# on récupère le dernier dump France
wget -O /data/dumps/france-latest.osm.pbf http://download.geofabrik.de/europe/france-latest.osm.pbf

echo ""
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo ""
echo " Decoupage dump France -> Breizh "
echo ""
date
echo ""

# on le decoupe selon un polygone
osmconvert /data/dumps/france-latest.osm.pbf -B=/data/styles/data/poly_extraction_bzh.poly --complete-ways -v -o=/data/dumps/breizh.osm.pbf

echo ""
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo ""
echo " Maj de la BD OSM "
echo ""
date
echo ""

# on supprime les vues
<<<<<<< HEAD:scripts/update_db.sh
psql -h db.openstreetmap.local -U osm -d osm -f /data/styles/br/database/drop_views.sql
=======
psql -h db.openstreetmap.local -U osm -d osm -f /data/styles/br/drop_views.sql
>>>>>>> master:update_db.sh

# on met à jour la base de données
# authentification dans le pgpass
osm2pgsql -H db.openstreetmap.local -U osm -d osm --hstore --slim --cache 3000 -E 3857 -v /data/dumps/breizh.osm.pbf 

# on recrée les vues
<<<<<<< HEAD:scripts/update_db.sh
psql -h db.openstreetmap.local -U osm -d osm -f /data/styles/br/database/create_views.sql
=======
psql -h db.openstreetmap.local -U osm -d osm -f /data/styles/br/create_views.sql
>>>>>>> master:update_db.sh

echo ""
echo " Fin de la maj de la BD "
echo ""
date
echo ""
