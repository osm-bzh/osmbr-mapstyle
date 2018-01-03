
echo ""
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo ""
echo "      calcul tuiles mid levels"
echo ""
echo ""

echo "--------------------------------"
echo "  suppression"
date
echo ""

# on efface
rm -rf /data/tiles/br/7/
rm -rf /data/tiles/br/8/
rm -rf /data/tiles/br/9/
rm -rf /data/tiles/br/10/
rm -rf /data/tiles/br/11/
rm -rf /data/tiles/br/12/
rm -rf /data/tiles/br/13/
rm -rf /data/tiles/br/14/
rm -rf /data/tiles/br/15/

echo "--------------------------------"
echo "  niveau 7"
date
echo ""
# niveau 7 : France
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 7 -Z 7 -x 60 -X 68 -y 43 -Y 49

echo "--------------------------------"
echo "  niveau 8"
date
echo ""
# niveau 8 : Grand ouest
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 8 -Z 8 -x 123 -X 129 -y 87 -Y 92

echo "--------------------------------"
echo "  niveau 9"
date
echo ""
# 9
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 9 -Z 9 -x 249 -X 256 -y 177 -Y 182

echo "--------------------------------"
echo "  niveau 10"
date
echo ""
# 10
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 10 -Z 10 -x 498 -X 510 -y 354 -Y 362

echo "--------------------------------"
echo "  niveau 11"
date
echo ""
# 11
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 11 -Z 11 -x 994 -X 1021 -y 705 -Y 722

echo "--------------------------------"
echo "  niveau 12"
date
echo ""
# 12
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 12 -Z 12 -x 1989 -X 2042 -y 1409 -Y 1444

echo "--------------------------------"
echo "  niveau 13"
date
echo ""
# 13
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 13 -Z 13 -x 3978 -y 2817 -X 4084 -Y 2887

echo "--------------------------------"
echo "  niveau 14"
date
echo ""
# 14
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 14 -Z 14 -x 7956 -X 8160 -y 5634 -Y 5770

echo "--------------------------------"
echo "  niveau 15"
date
echo ""
# 15
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 15 -Z 15 -x 15914 -X 16322 -y 11268 -Y 11540

echo ""
echo "  fin" 
date

