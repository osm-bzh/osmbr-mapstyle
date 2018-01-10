

echo ""
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo ""
echo "      rendering tiles for levels 13 -> 15 + specific areas 16 -> 18 "
echo ""
echo ""

echo "--------------------------------"
echo "  deleting old tiles"
date
echo ""

## specific towns < zoom 15

# erasing
rm -rf /data/tiles/br/13/
rm -rf /data/tiles/br/14/
rm -rf /data/tiles/br/15/
rm -rf /data/tiles/br/16/
rm -rf /data/tiles/br/17/
rm -rf /data/tiles/br/18/
# by security
rm -rf /data/tiles/br/19/
rm -rf /data/tiles/br/20/
rm -rf /data/tiles/br/22/


echo "--------------------------------"
echo "  level 13"
date
echo ""
# 13
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 13 -Z 13 -x 3978 -y 2817 -X 4084 -Y 2887

echo "--------------------------------"
echo "  level 14"
date
echo ""
# 14
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 14 -Z 14 -x 7956 -X 8160 -y 5634 -Y 5770

echo "--------------------------------"
echo "  level 15"
date
echo ""
# 15
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 15 -Z 15 -x 15914 -X 16322 -y 11268 -Y 11540

echo "--------------------------------"
echo "  Pazieg Roazhon Bruz"
date
echo ""
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 16 -Z 16 -x 32440 -X 32482 -y 22738 -Y 22790
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 17 -Z 17 -x 64882 -X 64965 -y 45477 -Y 45580
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 18 -Z 18 -x 129765 -X 129930 -y 90953 -Y 91160

echo "--------------------------------"
echo "  Gwipavaz"
date
echo ""
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 16 -Z 16 -x 31958 -y 22569 -X 31975 -Y 22666
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 17 -Z 17 -x 63917 -y 45318 -X 63951 -Y 45332
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 18 -Z 18 -x 127820 -y 90631 -X 127918 -Y 90684

echo "--------------------------------"
echo "  Lokournan - Brest - Daoulas"
date
echo ""
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 16 -Z 16 -x 31923 -y 22660 -X 31996 -Y 22685
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 17 -Z 17 -x 63846 -y 45320 -X 63989 -Y 45372
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 18 -Z 18 -x 127692 -y 90640 -X 127978 -Y 90743

echo "--------------------------------"
echo "  Lambaol-Blouarzhel"
date
echo ""
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 16 -Z 16 -x 31897 -y 22653 -X 31904 -Y 22662
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 17 -Z 17 -x 63794 -y 45306 -X 63808 -Y 45323
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 18 -Z 18 -x 127587 -y 90613 -X 127617 -Y 90648  

echo "--------------------------------"
echo "  Karaez"
date
echo ""
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 16 -Z 16 -x 32111 -y 22699 -X 32125 -Y 22708
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 17 -Z 17 -x 64222 -y 45397 -X 64251 -Y 45416
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 18 -Z 18 -x 128444 -y 90794 -X 128503 -Y 90833

echo "--------------------------------"
echo "  Lesneven"
date
echo ""
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 16 -Z 16 -x 31973 -y 22619 -X 31987 -Y 22632
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 17 -Z 17 -x 63946 -y 45237 -X 63976 -Y 45264
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 18 -Z 18 -x 127892 -y 90474 -X 127953 -Y 90528

echo "--------------------------------"
echo "  Langoned"
date
echo ""
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 16 -Z 16 -x 32121 -y 22724 -X 32147 -Y 22764
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 17 -Z 17 -x 64243 -y 45447 -X 64294 -Y 45527
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 18 -Z 18 -x 128486 -y 90893 -X 128588 -Y 91054

echo "--------------------------------"
echo "  Gwened"
date
echo ""
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 16 -Z 16 -x 32255 -y 22867 -X 32279 -Y 22882
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 17 -Z 17 -x 64509 -y 45734 -X 64558 -Y 45764
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/tiles/ -z 18 -Z 18 -x 129018 -y 91468 -X 129117 -Y 91527


echo "--------------------------------"
echo "  end"
date
echo ""
