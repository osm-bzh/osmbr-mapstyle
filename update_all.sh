#!/bin/bash

# maj de la BDD
cd /data/dumps/
sudo -u osm /data/styles/br/update_db.sh


# calcul des tuiles
#sudo -u www-data /data/styles/br/calculer_tiles_br_0-6.sh
#sudo -u www-data /data/styles/br/calculer_tiles_br_7-12.sh
sudo -u www-data /data/styles/br/calculer_tiles_br_13-18.sh

#sudo -u www-data /data/styles/br/calculer_tiles_br_test.sh


# pousse vers tile.osm.bzh
sudo -u osm /data/styles/br/rsync_to_server.sh

