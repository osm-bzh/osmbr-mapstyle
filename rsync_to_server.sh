

opts='-ar --delete'


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

