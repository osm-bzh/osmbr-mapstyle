
# on efface
rm -rf /data/osm/tiles/br/7/
rm -rf /data/osm/tiles/br/8/
rm -rf /data/osm/tiles/br/9/
rm -rf /data/osm/tiles/br/10/
rm -rf /data/osm/tiles/br/11/
rm -rf /data/osm/tiles/br/12/
rm -rf /data/osm/tiles/br/13/
rm -rf /data/osm/tiles/br/14/
rm -rf /data/osm/tiles/br/15/

# niveau 7 : France
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/osm/tiles/ -z 7 -Z 7 -x 60 -X 68 -y 43 -Y 49

# niveau 8 : Grand ouest
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/osm/tiles/ -z 8 -Z 8 -x 124 -X 127 -y 88 -Y 90

# 9
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/osm/tiles/ -z 9 -Z 9 -x 249 -X 254 -y 177 -Y 180

# 10
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/osm/tiles/ -z 10 -Z 10 -x 498 -X 508 -y 354 -Y 359

# 11
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/osm/tiles/ -z 11 -Z 11 -x 994 -X 1018 -y 705 -Y 718

# 12
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/osm/tiles/ -z 12 -Z 12 -x 1989 -X 2033 -y 1409 -Y 1435

# 13
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/osm/tiles/ -z 13 -Z 13 -x 3978 -y 2817 -X 4066 -Y 2870

# 14
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/osm/tiles/ -z 14 -Z 14 -x 7956 -X 8133 -y 5634 -Y 5740

# 15
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/osm/tiles/ -z 15 -Z 15 -x 15914 -X 16268 -y 11268 -Y 11481

