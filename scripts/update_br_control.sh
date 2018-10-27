
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

rm -rf /data/tiles/br/10/
rm -rf /data/tiles/br/11/
rm -rf /data/tiles/br/12/
rm -rf /data/tiles/br/13/
rm -rf /data/tiles/br/14/
rm -rf /data/tiles/br/15/
rm -rf /data/tiles/br/16/
rm -rf /data/tiles/br/17/
rm -rf /data/tiles/br/18/
rm -rf /data/tiles/br/19/
rm -rf /data/tiles/br/20/


echo "--------------------------------"
echo "  level 10"
echo ""
render_list -a -m br_control -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 10 -Z 10 -x 498 -X 508 -y 353 -Y 360
date
""

echo "--------------------------------"
echo "  level 11"
echo ""
render_list -a -m br_control -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 11 -Z 11 -x 994 -X 1016 -y 705 -Y 720
date
""

echo "--------------------------------"
echo "  level 12"
echo ""
render_list -a -m br_control -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 12 -Z 12 -x 1989 -X 2033 -y 1409 -Y 1440
date
""

echo "--------------------------------"
echo "  level 13"
echo ""
render_list -a -m br_control -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 13 -Z 13 -x 3979 -X 4067 -y 2818 -Y 2880
date
""

# echo "--------------------------------"
# echo "  level 14"
# echo ""
# render_list -a -m br_control -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 14 -Z 14 -x 7958 -X 8135 -y 5636 -Y 5759
# date
# ""

# echo "--------------------------------"
# echo "  level 15"
# echo ""
# render_list -a -m br_control -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 15 -Z 15 -x 15916 -X 16270 -y 11272 -Y 11518
# date
# ""

# echo "--------------------------------"
# echo "  level 16"
# echo ""
# render_list -a -m br_control -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 16 -Z 16 -x 31832 -X 32541 -y 22544 -Y 23036
# date
# ""

# echo "--------------------------------"
# echo "  level 17"
# echo ""
# render_list -a -m br_control -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 17 -Z 17 -x 63664 -X 65081 -y 45087 -Y 46071
# date
# ""


echo "--------------------------------"
echo "  F I N I"
date
echo ""
