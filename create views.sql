
-- osm_waterareas
CREATE OR REPLACE VIEW osm_waterareas AS
  SELECT
    osm_id,
    COALESCE(tags -> 'name:br'::text) as name,
    COALESCE(tags -> 'source:name:br'::text) as source_name,
    COALESCE(waterway, '') || COALESCE(landuse, '') || COALESCE("natural", '') as type,
    way_area as area,
    way as geometry
  FROM planet_osm_polygon
  WHERE 
    waterway = 'riverbank'::text
    OR (landuse = ANY (ARRAY['reservoir'::text, 'water'::text, 'basin'::text, 'salt_pond'::text]))
    OR ("natural" = ANY (ARRAY['lake'::text, 'water'::text])) OR amenity = 'swimming_pool'::text
    OR leisure = 'swimming_pool'::text
  ORDER BY z_order, way_area DESC ;


-- osm_waterareas_gen1
CREATE OR REPLACE VIEW osm_waterareas_gen1 AS
 SELECT
    osm_id,
    name,
    source_name,
    type,
    area,
    geometry
   FROM osm_waterareas
  WHERE ST_AREA(ST_SimplifyPreserveTopology(geometry, 50)) > 50000.000000 ;


-- osm_waterareas_gen0
CREATE OR REPLACE VIEW osm_waterareas_gen0 AS
 SELECT 
    osm_id,
    name,
    source_name,
    type,
    area,
    geometry
   FROM osm_waterareas_gen1
  WHERE ST_AREA(ST_SimplifyPreserveTopology(geometry, 200)) > 50000.000000 ;



-- osm_waterways
CREATE OR REPLACE VIEW osm_waterways AS
  SELECT
    osm_id,
    COALESCE(tags -> 'name:br'::text) as name,
    COALESCE(tags -> 'source:name:br'::text) as source_name,
    COALESCE(waterway, '') as type,
    way as geometry
  FROM planet_osm_line
  WHERE 
    waterway in ('weir','river','canal','derelict_canal','stream','drain','ditch','wadi')
  ORDER BY z_order ;


-- osm_waterways_gen1
CREATE OR REPLACE VIEW osm_waterways_gen1 AS
 SELECT
    osm_id,
    name,
    source_name,
    type,
    (ST_SimplifyPreserveTopology(geometry, 50)) as geometry
   FROM osm_waterways ;


-- osm_waterways_gen0
CREATE OR REPLACE VIEW osm_waterways_gen0 AS
 SELECT
    osm_id,
    name,
    source_name,
    type,
    (ST_SimplifyPreserveTopology(geometry, 50)) as geometry
   FROM osm_waterways_gen1 ;



-- osm_places
CREATE OR REPLACE VIEW osm_places AS
 SELECT
    osm_id,
    COALESCE(tags -> 'name:br'::text) as name,
    COALESCE(tags -> 'source:name:br'::text) as source_name,
    place as type,
    z_order,
    population,
    way as geometry
   FROM planet_osm_point
   WHERE
   	place is not null and place in ('country','state','region','county','city','town','village','hamlet','suburb','locality') ;


-- osm_roads
CREATE OR REPLACE VIEW osm_roads AS
 SELECT
    osm_id,
    COALESCE(highway, '') as type,
    COALESCE(tags -> 'name:br'::text) as name,
    COALESCE(tags -> 'source:name:br'::text) as source_name,
    tunnel,
    bridge,
    oneway,
    layer,
    ref,
    z_order,
    access,
    service,
    'highway'::text as class,
    way as geometry
 FROM planet_osm_roads
 WHERE
   highway IN ('motorway','motorway_link','trunk','trunk_link','primary','primary_link','secondary','secondary_link','tertiary','tertiary_link','road','path','track','service','footway','bridleway','cycleway','steps','pedestrian','living_street','unclassified','residential','raceway') ;









