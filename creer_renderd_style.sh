#bin/sh!

cd /data/osm/styles/osmbr/
cp project.mml project_local.mml
sed -i 's/192.168.0.42/localhost/' project_local.mml
/data/osm/carto/bin/carto ./project_local.mml > style.xml

