
-- this script will create the PostgreSQL + PostGIS databse
-- for the osm-br mapstyle

-- must be run as postgres or super user role

-- osm user
CREATE USER osm 
    WITH
    LOGIN
    NOSUPERUSER
    PASSWORD 'osmbr';

CREATE DATABASE osm 
    WITH 
    OWNER = osm
    ENCODING = 'UTF8';


-- 2 classic extensions for OSM
CREATE EXTENSION IF NOT EXISTS hstore;
CREATE EXTENSION IF NOT EXISTS postgis;


-- for the foreign tables
-- https://wiki.postgresql.org/wiki/Foreign_data_wrappers
-- http://www.postgresonline.com/journal/archives/322-Generating-Create-Foreign-Table-Statements-for-postgres_fdw.html

-- Adding the postgres_fdw extension
CREATE EXTENSION IF NOT EXISTS postgres_fdw;

-- the "server" object
CREATE SERVER world_db_server
  FOREIGN DATA WRAPPER postgres_fdw
  OPTIONS (host 'db.openstreetmap.local', port '5432', dbname 'osm');

-- a mapping for authentification
CREATE USER MAPPING FOR public SERVER 
  world_db_server
  OPTIONS (user 'osm', password 'osmbr');

