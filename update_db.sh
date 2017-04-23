
# on efface les dumps existants
rm /data/osm/dumps/*.pbf

# on récupère le dernier dump France
wget -O /data/osm/dumps/france-latest.osm.pbf http://download.geofabrik.de/europe/france-latest.osm.pbf

# on le decoupe selon un polygone
osmconvert /data/osm/dumps/france-latest.osm.pbf -B=/data/osm/data/poly_extraction_bzh.poly --complete-ways -v -o=/data/osm/dumps/breizh.osm.pbf

# on supprime les vues
psql -d osm -f drop_views.sql

# on met à jour la base de données
osm2pgsql -d osm --hstore --slim --cache 2300 -E 3857 /data/osm/dumps/breizh.osm.pbf

# on recrée les vues
psql -d osm -f create_views.sql

