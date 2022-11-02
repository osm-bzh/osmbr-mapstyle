#! /bin/bash

# permet de passer d'un fichier YAML à un fichier XML exploitable par renderd

echo ""
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "  BR"

cp osm_br_control.yml osm_br_control.mml
carto osm_br_control.mml > osm_br_control.xml
rm osm_br_control.mml

echo ""
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "  OC"

cp osm_oc_control.yml osm_oc_control.mml
carto osm_oc_control.mml > osm_oc_control.xml
rm osm_oc_control.mml

echo ""
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "  EU"

cp osm_eu_control.yml osm_eu_control.mml
carto osm_eu_control.mml > osm_eu_control.xml
rm osm_eu_control.mml

echo ""
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "  GSW"

cp osm_gsw_control.yml osm_gsw_control.mml
carto osm_gsw_control.mml > osm_gsw_control.xml
rm osm_gsw_control.mml

echo ""
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "  CA"

cp osm_ca_control.yml osm_ca_control.mml
carto osm_ca_control.mml > osm_ca_control.xml
rm osm_ca_control.mml
echo ""
echo ""

ls -laGh osm_*.xml
git status

#sudo service renderd stop
#sudo service renderd start

echo ""
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "  FIN"
echo ""