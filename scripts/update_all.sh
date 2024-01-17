#!/bin/bash

# stop the renderd service
service renderd stop

# update the database
/data/project/styles/br/scripts/update_db.sh

# restart the renderd service
service renderd start

# compute tiles
#sudo -u www-data /data/project/styles/br/scripts/calculer_tiles_br_0-6.sh
#sudo -u www-data /data/project/styles/br/scripts/calculer_tiles_br_7-12.sh
sudo -u www-data /data/project/styles/br/scripts/calculer_tiles_br_13-18.sh

# push to www server
sudo su - osm /data/project/styles/br/scripts/rsync_to_server.sh

