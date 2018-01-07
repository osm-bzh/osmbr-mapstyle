#!/bin/bash

cd /data/styles/br/


# maj de la BDD
sudo -u osm ./update_db.sh 


# calcul des tuiles
#sudo -u www-data ./calculer_tiles_br_low.sh
#sudo -u www-data ./calculer_tiles_br_mid.sh
#sudo -u www-data ./calculer_tiles_br_high.sh

# pousse vers tile.osm.bzh
sudo -u osm ./rsync_to_server.sh 
