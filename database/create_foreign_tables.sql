
-- this script will create the 7 foreign tables from the world database
--
-- planet_osm_point
-- planet_osm_line
-- planet_osm_polygon
-- planet_osm_roads
-- planet_osm_nodes
-- planet_osm_ways
-- planet_osm_rels
--


IMPORT FOREIGN SCHEMA public 
LIMIT TO (
    planet_osm_point,
    planet_osm_line,
    planet_osm_polygon,
    planet_osm_roads,
    planet_osm_nodes,
    planet_osm_ways,
    planet_osm_rels)
FROM SERVER world_db_server INTO public ;

