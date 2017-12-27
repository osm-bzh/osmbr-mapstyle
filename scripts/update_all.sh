#!/bin/bash

# update the database
./update_db.sh

# compute tiles
./calculer_tiles_br_low.sh
./calculer_tiles_br_mid.sh
./calculer_tiles_br_high.sh

# push to www server
./rsync_to_server.sh


