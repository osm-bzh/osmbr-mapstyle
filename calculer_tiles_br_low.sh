
# on efface
rm -rf /data/osm/tiles/br/0/
rm -rf /data/osm/tiles/br/1/
rm -rf /data/osm/tiles/br/2/
rm -rf /data/osm/tiles/br/3/
rm -rf /data/osm/tiles/br/4/
rm -rf /data/osm/tiles/br/5/
rm -rf /data/osm/tiles/br/6/

# monde -> 4
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/osm/tiles/ -z 0 -Z 4

# niveau 5 : europe
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/osm/tiles/ -z 5 -Z 5 -x 13 -X 9 -y 88 -Y 14

# niveau 6 : europe
render_list -a -m br -s /var/run/renderd/renderd.sock -n 3 -t /data/osm/tiles/ -z 6 -Z 6 -x 28 -X 37 -y 19 -Y 26

