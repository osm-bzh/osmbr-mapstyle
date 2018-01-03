
echo ""
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo ""
echo "      calcul tuiles low levels"
echo ""
echo ""

echo "--------------------------------"
echo "  suppression"
date
echo ""

# on efface
rm -rf /data/tiles/br/0/
rm -rf /data/tiles/br/1/
rm -rf /data/tiles/br/2/
rm -rf /data/tiles/br/3/
rm -rf /data/tiles/br/4/
rm -rf /data/tiles/br/5/
rm -rf /data/tiles/br/6/


echo "--------------------------------"
echo "  niveau 0 -> 4"
date
echo ""

# monde -> 4
SECONDS=0
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 0 -Z 4
level_duration=$SECONDS
echo "$(($level_duration / 60)) min and $(($level_duration % 60)) sec"
echo ""
echo "  fin" 
date


echo "--------------------------------"
echo "  niveau 5"
date
echo ""

# niveau 5 : europe
SECONDS=0
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 5 -Z 5 -x 11 -X 20 -y 8 -Y 15
level_duration=$SECONDS
echo "$(($level_duration / 60)) min and $(($level_duration % 60)) sec"
echo ""
echo "  fin" 
date


echo "--------------------------------"
echo "  niveau 6"
date
echo ""

# niveau 6 : europe
SECONDS=0
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 6 -Z 6 -x 28 -X 37 -y 19 -Y 26
level_duration=$SECONDS
echo "$(($level_duration / 60)) min and $(($level_duration % 60)) sec"
echo ""
echo "  fin" 
date
