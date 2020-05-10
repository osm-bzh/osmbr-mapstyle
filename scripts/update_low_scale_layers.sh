#! /bin/bash

# met à jour les 2 couches de données utilisées aux petites échelles


#    simplified-land-polygons-complete-3857/simplified_land_polygons.shp
#    land-polygons-split-3857/land_polygons.shp

cd /data/styles/data/


wget https://osmdata.openstreetmap.de/download/simplified-land-polygons-complete-3857.zip
rm -rf simplified-land-polygons-complete-3857
unzip simplified-land-polygons-complete-3857.zip

wget https://osmdata.openstreetmap.de/download/land-polygons-split-3857.zip
rm -rf land-polygons-split-3857
unzip land-polygons-split-3857.zip

cd simplified-land-polygons-complete-3857
shapeindex *.shp

cd ../land-polygons-split-3857
shapeindex *.shp

rm -f simplified-land-polygons-complete-3857.zip
rm -f land-polygons-split-3857.zip


# à faire tous les 4 mois
# 0 0 1 */3 * /data/scripts/update_low_scale_layers.sh

