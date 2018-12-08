
echo ""
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo ""
echo "      rendering tiles for OSM br control tiles "
echo ""
echo ""

echo "--------------------------------"
echo "  deleting old tiles"
date
echo ""

rm -rf /data/tiles/br_control/10/
rm -rf /data/tiles/br_control/11/
rm -rf /data/tiles/br_control/12/
rm -rf /data/tiles/br_control/13/
rm -rf /data/tiles/br_control/14/
rm -rf /data/tiles/br_control/15/
rm -rf /data/tiles/br_control/16/
rm -rf /data/tiles/br_control/17/
rm -rf /data/tiles/br_control/18/
rm -rf /data/tiles/br_control/19/
rm -rf /data/tiles/br_control/20/


echo "--------------------------------"
echo "  level 10"
echo ""
render_list -a -m br_control -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 10 -Z 10 -x 498 -X 508 -y 353 -Y 360
date
echo ""

echo "--------------------------------"
echo "  level 11"
echo ""
render_list -a -m br_control -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 11 -Z 11 -x 994 -X 1016 -y 705 -Y 720
date
echo ""

echo "--------------------------------"
echo "  level 12"
echo ""
render_list -a -m br_control -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 12 -Z 12 -x 1989 -X 2033 -y 1409 -Y 1440
date
echo ""

echo "--------------------------------"
echo "  level 13"
echo ""
render_list -a -m br_control -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 13 -Z 13 -x 3979 -X 4067 -y 2818 -Y 2880
date
echo ""

echo "--------------------------------"
echo "  F I N I"
date
echo ""


echo ""
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo ""
echo "      rendering tiles for OSM eu control tiles "
echo ""
echo ""

echo "--------------------------------"
echo "  deleting old tiles"
date
echo ""

rm -rf /data/tiles/eu_control/10/
rm -rf /data/tiles/eu_control/11/
rm -rf /data/tiles/eu_control/12/
rm -rf /data/tiles/eu_control/13/
rm -rf /data/tiles/eu_control/14/
rm -rf /data/tiles/eu_control/15/
rm -rf /data/tiles/eu_control/16/
rm -rf /data/tiles/eu_control/17/
rm -rf /data/tiles/eu_control/18/
rm -rf /data/tiles/eu_control/19/
rm -rf /data/tiles/eu_control/20/


echo "--------------------------------"
echo "  F I N I"
date
echo ""




echo ""
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo ""
echo "      rendering tiles for OSM oc control tiles "
echo ""
echo ""

echo "--------------------------------"
echo "  deleting old tiles"
date
echo ""

rm -rf /data/tiles/oc_control/10/
rm -rf /data/tiles/oc_control/11/
rm -rf /data/tiles/oc_control/12/
rm -rf /data/tiles/oc_control/13/
rm -rf /data/tiles/oc_control/14/
rm -rf /data/tiles/oc_control/15/
rm -rf /data/tiles/oc_control/16/
rm -rf /data/tiles/oc_control/17/
rm -rf /data/tiles/oc_control/18/
rm -rf /data/tiles/oc_control/19/
rm -rf /data/tiles/oc_control/20/


echo "--------------------------------"
echo "  F I N I"
date
echo ""

