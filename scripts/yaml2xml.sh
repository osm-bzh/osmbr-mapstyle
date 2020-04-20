#! /bin/bash

# permet de passer d'un fichier YAML à un fichier XML exploitable par renderd

echo ""
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "  BR"

cp osm_br.yml osm_br.mml
carto osm_br.mml > osm_br.xml
rm osm_br.mml

echo ""
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "  OC"

cp osm_oc.yml osm_oc.mml
carto osm_oc.mml > osm_oc.xml
rm osm_oc.mml

echo ""
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "  EU"

cp osm_eu.yml osm_eu.mml
carto osm_eu.mml > osm_eu.xml
rm osm_eu.mml

echo ""
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "  GSW"

cp osm_gsw.yml osm_gsw.mml
carto osm_gsw.mml > osm_gsw.xml
rm osm_gsw.mml


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