#!/bin/bash

# update the database
/data/styles/br/scripts/update_db.sh

# compute tiles
#/data/styles/br/scripts/calculer_tiles_br_0-6.sh
#/data/styles/br/scripts/calculer_tiles_br_7-12.sh
/data/styles/br/scripts/calculer_tiles_br_13-18.sh

# push to www server
/data/styles/br/scripts/rsync_to_server.sh


