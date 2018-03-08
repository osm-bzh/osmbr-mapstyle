# this script will create the PostgreSQL + PostGIS databse
# for the osm-br mapstyle

# must be run as postgres role

# osm user
psql -c "CREATE USER osm WITH LOGIN SUPERUSER PASSWORD 'osmbr';"

# the database
psql -c "CREATE DATABASE osm WITH OWNER = osm ENCODING = 'UTF8';"

# 2 classic extensions for OSM
psql -d osm -c "CREATE EXTENSION IF NOT EXISTS hstore;"
psql -d osm -c "CREATE EXTENSION IF NOT EXISTS postgis;"


