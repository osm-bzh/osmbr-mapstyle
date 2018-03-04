
echo ""
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo ""
echo "      rendering tiles for levels 7 -> 12 "
echo ""
echo ""

echo "--------------------------------"
echo "  deleting old tiles"
date
echo ""

# erasing
rm -rf /data/tiles/br/7/
rm -rf /data/tiles/br/8/
rm -rf /data/tiles/br/9/
rm -rf /data/tiles/br/10/
rm -rf /data/tiles/br/11/
rm -rf /data/tiles/br/12/


echo "--------------------------------"
echo "  level 7"
date
echo ""
# niveau 7 : France
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 7 -Z 7 -x 60 -X 68 -y 43 -Y 49

echo "--------------------------------"
echo "  level 8"
date
echo ""
# niveau 8 : Grand ouest
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 8 -Z 8 -x 123 -X 129 -y 87 -Y 92

echo "--------------------------------"
echo "  level 9"
date
echo ""
# 9
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 9 -Z 9 -x 249 -X 256 -y 177 -Y 182

echo "--------------------------------"
echo "  level 10"
date
echo ""
# 10
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 10 -Z 10 -x 498 -X 510 -y 354 -Y 362

echo "--------------------------------"
echo "  level 11"
date
echo ""
# 11
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 11 -Z 11 -x 994 -X 1021 -y 705 -Y 722

echo "--------------------------------"
echo "  level 12"
date
echo ""
# 12
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 12 -Z 12 -x 1989 -X 2042 -y 1409 -Y 1444

echo ""
echo "  end" 
date

