
opts='-ar --delete'

#rsync $opts /data/osm/tiles/br/8/ osm@breizhpositive.bzh:/data/osm/tiles/br/8/

i=0

while ((i <= 16))
	do
	date
	echo '===> '$i
	du -sh /data/osm/tiles/br/$i/
	rsync $opts /data/osm/tiles/br/$i/ osm@breizhpositive.bzh:/data/osm/tiles/br/$i/
	date
	((i += 1))
done


