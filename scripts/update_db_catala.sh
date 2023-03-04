
wget -O /data/dumps/languedoc-roussillon-latest.osm.pbf http://download.geofabrik.de/europe/france/languedoc-roussillon-latest.osm.pbf

osmconvert /data/dumps/languedoc-roussillon-latest.osm.pbf -B=/data/styles/br/data/perpignan.poly --complete-ways -v -o=/data/dumps/perpignan.osm.pbf

osm2pgsql -H db.openstreetmap.local -U osmbr -d osm --hstore --slim --cache 3000 -E 3857 -a -v /data/dumps/perpignan.osm.pbf
