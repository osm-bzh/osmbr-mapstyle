#!/bin/bash

opts='-ar --delete'

SECONDS=0
global_sec=0
i=0

while ((i <= 18))
	do
	SECONDS=0
	echo '===> '$i
	du -sh /data/tiles/br/$i/
	rsync $opts /data/tiles/br/$i/ osm@breizhpositive.bzh:/data/osm/tiles/br/$i/
	
	level_duration=$SECONDS
	global_sec=$((global_sec + level_duration))
	echo "$(($level_duration / 60)) min and $(($level_duration % 60)) sec"
	echo ''

	((i += 1))
done

echo ''

duration=global_sec
echo "Total time : $(($duration / 60)) min and $(($duration % 60)) sec"

echo ''
