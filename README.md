# English

This is the OSM Mapnik style for osm-bzh project (www.openstreetmap.bzh).
It is derived from the Lyrk mapstyle you can found at https://github.com/lyrk/lyrk-mapstyle.

# French

Ceci est le style OSM Mapnik pour le projet osm-bzh (www.openstreetmap.bzh).
Il est dérivé du style Lyrk que vous pouvez trouver ici : https://github.com/lyrk/lyrk-mapstyle.

# Preview

![preview1](/preview1.png "preview1")

![preview2](/preview2.png "preview2")

# Set up

## unix user and clone this repository

Create a user 'osm' on your server.

Create directories and clone this repository :

```
mkdir /data
mkdir /data/dumps
mkdir /data/styles

cd /data/styles/
git clone https://github.com/osm-bzh/osmbr-mapstyle.git

# rename the directory
mv osmbr-mapstyle br

# move to the git clone repository
cd /data/styles/br/
```

## Low scales datas

Need 2 layers in /data/styles/data/ :

* simplified-land-polygons-complete-3857/simplified_land_polygons.shp
* land-polygons-split-3857/land_polygons.shp

```
cd /data/styles/data/

wget http://data.openstreetmapdata.com/simplified-land-polygons-complete-3857.zip
unzip simplified-land-polygons-complete-3857.zip

wget http://data.openstreetmapdata.com/land-polygons-split-3857.zip
unzip land-polygons-split-3857.zip

cd simplified-land-polygons-complete-3857
shapeindex *.shp

cd ../land-polygons-split-3857
shapeindex *.shp
```


## The database

**We use the classic planet_osm database an tables** loaded by the famous osm2pgsql programm.

In your ```/etc/hosts``` file, add an entry for **db.openstreetmap.world**, with the IP of your PostgreSQL database server.


Create the database and the 'osmbr' role : 

```bash
# osm user
psql -c "CREATE USER osmbr WITH LOGIN SUPERUSER PASSWORD 'm4d31nbr31zh';"

# the database
psql -c "CREATE DATABASE osm WITH OWNER = osmbr ENCODING = 'UTF8';"

# 2 classic extensions for OSM
psql -d osm -c "CREATE EXTENSION IF NOT EXISTS hstore;"
psql -d osm -c "CREATE EXTENSION IF NOT EXISTS postgis;"
```

Then run ```/scripts/update_db.sh``` to load the database.
It will :

* download a France pbf file
* cut France to Britanny
* load the database




