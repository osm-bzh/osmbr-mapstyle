
-- big_forest
SELECT
  osm_id, way, way_area AS area
FROM
  planet_osm_polygon
WHERE
  landuse = 'forest' AND way_area > 100000

-- landuse_gen0
SELECT
  osm_id, way, way_area AS area, COALESCE(landuse, leisure, "natural", highway, amenity, tourism) AS type
FROM
  planet_osm_polygon
WHERE
  way_area > 100000

-- landuse_gen1
SELECT
  osm_id, way, way_area AS area, COALESCE(landuse, leisure, "natural", highway, amenity, tourism) AS type
FROM
  planet_osm_polygon
WHERE
  way_area > 10000


-- lancover
SELECT
  osm_id, way, way_area AS area, COALESCE(landuse, leisure, "natural", highway, amenity, tourism) AS type
FROM
  planet_osm_polygon


-- aeroway
SELECT
  osm_id, way, aeroway AS type
FROM
  planet_osm_line
WHERE
  aeroway IN ('apron', 'runway', 'taxiway')


-- waterarea_low
SELECT
  osm_id, way, "natural" AS type, way_area AS area
FROM
  planet_osm_polygon 
WHERE
  ("natural" IN ('water', 'pond')
  OR waterway IN ('basin', 'canal', 'mill_pond', 'pond', 'riverbank', 'stream'))
  AND way_area > 75000


-- waterarea_med
SELECT
  osm_id, way, "natural" AS type, way_area AS area
FROM
  planet_osm_polygon 
WHERE
  ("natural" IN ('water', 'pond')
  OR waterway IN ('basin', 'canal', 'mill_pond', 'pond', 'riverbank', 'stream'))
  AND way_area > 50000


-- waterarea
SELECT 
  osm_id,
  way,
  way_area AS area,
  COALESCE(tags -> 'name:br'::text) as name,
  COALESCE(waterway, '') || COALESCE(landuse, '') || COALESCE("natural", '') as type
FROM
  planet_osm_polygon
WHERE 
  waterway IN ('riverbank')
  OR (landuse = ANY (ARRAY['reservoir'::text, 'water'::text, 'basin'::text, 'salt_pond'::text]))
  OR ("natural" = ANY (ARRAY['lake'::text, 'water'::text])) OR amenity = 'swimming_pool'::text
  OR leisure = 'swimming_pool'::text


-- waterway_low
SELECT
  osm_id, COALESCE(tags -> 'name:br'::text) as name, COALESCE(waterway, '') as type, way
FROM
  planet_osm_line
WHERE
  waterway in ('river','canal')
ORDER BY z_order


-- waterway_med
SELECT
  osm_id, COALESCE(tags -> 'name:br'::text) as name, COALESCE(waterway, '') as type, way
FROM
  planet_osm_line
WHERE waterway in ('stream','river','canal')
ORDER BY z_order


-- waterway_high
SELECT
  osm_id, COALESCE(tags -> 'name:br'::text) as name, COALESCE(waterway, '') as type, way
FROM
  planet_osm_line
WHERE
  waterway in ('weir','river','canal','derelict_canal','stream','drain','ditch','wadi')
ORDER BY z_order


-- buildings
SELECT
  osm_id, way, 'building' AS type
FROM
  planet_osm_polygon
WHERE
  building NOT IN ('', '0','false', 'no')
ORDER BY z_order, way_area DESC



-- roads_low
SELECT
  osm_id,
  way,
  COALESCE(highway, railway) AS type, 
  0 AS tunnel,
  0 AS bridge,
  access,
  'fill' AS render, 
  CASE 
      WHEN highway IN ('motorway', 'trunk') THEN 'motorway' 
      WHEN highway IN ('primary') THEN 'mainroad'  
      WHEN railway IN ('rail') THEN 'railway'
  ELSE 'other'
  END AS stylegroup 
FROM planet_osm_line 
WHERE
  highway IN ('motorway', 'trunk', 'primary')
  OR railway IN ('rail')
  AND (tunnel IS NULL OR tunnel = 'no') 
  AND (bridge IS NULL OR bridge = 'no') 
ORDER BY z_order


-- roads_med
SELECT
  osm_id,
  way,
  COALESCE(highway, railway) AS type, 
  0 AS tunnel, 0 AS bridge, access, 'fill' AS render, 
  CASE 
  WHEN highway IN ('motorway', 'trunk') THEN 'motorway' 
  WHEN highway IN ('primary', 'secondary') THEN 'mainroad' 
  WHEN highway IN ('motorway_link', 'trunk_link', 'primary_link', 'secondary_link', 'tertiary', 'tertiary_link') THEN 'minorroad'  
  WHEN railway IN ('light_rail', 'subway', 'narrow_gauge', 'rail', 'tram') THEN 'railway'
  ELSE 'other'
  END AS stylegroup 
FROM planet_osm_line 
WHERE
  highway IN ('motorway', 'trunk', 'primary', 'secondary', 'motorway_link', 'trunk_link', 'primary_link', 'secondary_link', 'tertiary', 'tertiary_link')
  OR railway IN ('light_rail', 'subway', 'narrow_gauge', 'rail', 'tram')
  AND (tunnel IS NULL OR tunnel = 'no') AND (bridge IS NULL OR bridge = 'no')
ORDER BY z_order


-- roads_high
SELECT
  osm_id,
  way,
  COALESCE(highway, railway) AS type, 
  0 AS tunnel,
  0 AS bridge,
  access,
  'fill' AS render, 
  CASE 
      WHEN highway IN ('motorway', 'trunk') THEN 'motorway' 
      WHEN highway IN ('primary', 'secondary') THEN 'mainroad' 
      WHEN highway IN ('motorway_link', 'trunk_link', 'primary_link', 'secondary_link', 'tertiary', 'tertiary_link', 'residential', 'unclassified', 'road', 'living_street') THEN 'minorroad' 
      WHEN highway IN ('service', 'track') THEN 'service' 
      WHEN highway IN ('path', 'cycleway', 'footway', 'pedestrian', 'steps', 'bridleway') THEN 'noauto' 
      WHEN railway IN ('light_rail', 'subway', 'narrow_gauge', 'rail', 'tram') THEN 'railway' 
      ELSE 'other' 
  END AS stylegroup 
FROM planet_osm_line 
WHERE
  (highway IS NOT NULL OR railway IS NOT NULL)
  AND (tunnel IS NULL OR tunnel = 'no')
  AND (bridge IS NULL OR bridge = 'no')
ORDER BY z_order 


-- rail_low
SELECT
  osm_id,
  way,
  COALESCE(railway) AS type,
  tags->'usage'::text AS usage,
  tunnel,
  bridge
FROM
  planet_osm_line 
WHERE
  railway IN ('rail') AND tags->'usage'::text IN ('main', 'branch')



-- tunnel
SELECT
  osm_id,
  way,
  COALESCE(highway, railway) AS type,
  0 AS bridge,
  access,
  render,
  layer,
  1 as tunnel,
  CASE
    WHEN highway IN ('motorway', 'trunk') THEN 'motorway'
    WHEN highway IN ('primary', 'secondary') THEN 'mainroad'
    WHEN highway IN ('motorway_link', 'trunk_link', 'primary_link', 'secondary_link', 'tertiary', 'tertiary_link', 'residential', 'unclassified', 'road', 'living_street') THEN 'minorroad'
    WHEN highway IN ('service', 'track') THEN 'service'
    WHEN highway IN ('path', 'cycleway', 'footway', 'pedestrian', 'steps', 'bridleway') THEN 'noauto'
    WHEN railway IN ('light_rail', 'subway', 'narrow_gauge', 'rail', 'tram') THEN 'railway'
  ELSE
    'other'
  END AS stylegroup
FROM
  (
      SELECT *, '1_outline' AS render
      FROM planet_osm_line 
      WHERE tunnel NOT IN ('', '0', 'no')
    UNION ALL
      SELECT *, '2_line' AS render
      FROM planet_osm_line
      WHERE tunnel NOT IN ('', '0', 'no')
    UNION ALL
      SELECT *, '3_inline' AS render
      FROM planet_osm_line
      WHERE tunnel NOT IN ('', '0', 'no')
  ) AS tunnels
ORDER BY layer ASC, render ASC



-- bridge
SELECT
  way,
  COALESCE(highway, railway) AS type,
  1 AS bridge, access, render, layer,
  0 as tunnel,
  CASE
    WHEN highway IN ('motorway', 'trunk') THEN 'motorway'  
    WHEN highway IN ('primary', 'secondary') THEN 'mainroad'  
    WHEN highway IN ('motorway_link', 'trunk_link', 'primary_link', 'secondary_link', 'tertiary', 'tertiary_link', 'residential', 'unclassified', 'road', 'living_street') THEN 'minorroad'  
    WHEN highway IN ('service', 'track') THEN 'service'  
    WHEN highway IN ('path', 'cycleway', 'footway', 'pedestrian', 'steps', 'bridleway') THEN 'noauto'  
    WHEN railway IN ('light_rail', 'subway', 'narrow_gauge', 'rail', 'tram') THEN 'railway'  
  ELSE 'other'
  END AS stylegroup
  FROM 
  (
      SELECT *, '1_outline' AS render
      FROM planet_osm_line 
      WHERE bridge NOT IN ('', '0', 'no')
    UNION ALL
      SELECT *, '2_line' AS render
      FROM planet_osm_line
      WHERE bridge NOT IN ('', '0', 'no')
    UNION ALL
      SELECT *, '3_inline' AS render
      FROM planet_osm_line
      WHERE bridge NOT IN ('', '0', 'no')
  ) AS bridges
ORDER BY layer ASC, render ASC



-- admin_boundaries
SELECT
  ST_Simplify(b.way,!pixel_width!/4) as way,
  admin_level::integer AS admin_level,
  coalesce(b.tags->'maritime','no') AS maritime,
  count(r.*)::integer AS nb,
  string_agg(id::text,',') AS rels
FROM planet_osm_roads b
LEFT JOIN planet_osm_rels r ON (r.parts @> ARRAY[osm_id]
  AND r.members @> ARRAY['w' || osm_id]
  AND regexp_replace(r.tags::text,'[{}]',',') ~ format('(,admin_level,%s.*,boundary,administrative|,boundary,administrative.*,admin_level,%s,)',admin_level,admin_level)) 
WHERE
  way && !bbox!
  AND boundary='administrative'
  AND admin_level IS NOT NULL
GROUP BY 1,2,3
ORDER BY admin_level DESC

-- admin_boundaries FR style
SELECT
  ST_Simplify(way,!pixel_width!/4) as way,
  admin_level,
  coalesce(b.tags->'maritime','no') as maritime,
  count(r.*) as nb
FROM  planet_osm_roads b
LEFT JOIN planet_osm_rels r ON (r.parts @> ARRAY[osm_id]
  AND r.members @> ARRAY['w' || osm_id]
  AND regexp_replace(r.tags::text,'[{}]',',') ~ format(',admin_level,%s,',admin_level)
  AND regexp_replace(r.tags::text,'[{}]',',') ~ ',boundary,administrative,')
WHERE
  way && !bbox!
  AND boundary='administrative'
  AND admin_level IS NOT NULL
GROUP BY 1,2,3
ORDER BY to_int(admin_level) DESC, 4



-- motorway_label
SELECT
  osm_id,
  COALESCE(highway, '') as type,
  COALESCE(tags -> 'name:br'::text,'') as name,
  ref,
  oneway,
  CHAR_LENGTH(ref) AS reflen,
  way
FROM
  planet_osm_line
WHERE
  highway IN ('motorway', 'trunk')
  AND (COALESCE(tags -> 'name:br'::text,'') IS NOT NULL OR ref IS NOT NULL)


-- mainroad_label
SELECT
  osm_id,
  COALESCE(highway, '') as type,
  COALESCE(tags -> 'name:br'::text,'') as name,
  way
FROM
  planet_osm_line
WHERE
  highway IN ('primary', 'secondary', 'tertiary')


-- minorroad_label
SELECT
  osm_id,
  COALESCE(highway, '') as type,
  COALESCE(tags -> 'name:br'::text,'') as name,
  way
FROM
  planet_osm_line
WHERE
  highway IN ('motorway','motorway_link','trunk','trunk_link','primary','primary_link','secondary','secondary_link','tertiary','tertiary_link','road','path','track','service','footway','bridleway','cycleway','steps','pedestrian','living_street','unclassified','residential','raceway')


-- places
SELECT
  osm_id,
  COALESCE(tags -> 'name:br'::text) as name,
  place as type,
  admin_level,
  COALESCE(tags->'is_capital'::text) as is_capital,
  z_order,
  way
FROM planet_osm_point
WHERE (tags -> 'name:br'::text IS NOT NULL)
ORDER BY z_order



-- admin_places
-- on part de la table planet_osm_point qui contient la géométrie
SELECT osm_id, place as type, MAX(admin_level) as admin_level, name, way
FROM
(
    -- communes
    (WITH
        p AS (
            SELECT osm_id, CONCAT('n',osm_id) as admin_centre_id, place, COALESCE(tags -> 'name:br'::text,'') as name, way
            FROM planet_osm_point 
            WHERE place IN ('village','town')
            AND way && !bbox!
        )
        SELECT p.osm_id, p.place, 1 as admin_level, p.name, p.way
        FROM planet_osm_rels AS r, p
        WHERE
            r.members::text ~ 'admin_centre' AND r.tags::text ~ 'admin_level,8' 
            AND p.admin_centre_id = ANY(members)
            -- ceci pour forcer l'utilisation des indexes
            AND ARRAY[p.osm_id] && parts
    )
    -- chefs-lieux de canton
    UNION
    (WITH
        p AS (
            SELECT osm_id, CONCAT('n',osm_id) as admin_centre_id, place, COALESCE(tags -> 'name:br'::text,'') as name, way
            FROM planet_osm_point 
            WHERE place IN ('village','town')
            AND way && !bbox!
        )
        SELECT p.osm_id, p.place, 2 as admin_level, p.name, p.way
        FROM planet_osm_rels AS r, p
        WHERE
            r.members::text ~ 'admin_centre' AND r.tags::text ~ 'political_division,canton'
            AND p.admin_centre_id = ANY(members)
            AND ARRAY[p.osm_id] && parts
    )
    -- sous-préfecture
    UNION
    (WITH
        p AS (
            SELECT osm_id, CONCAT('n',osm_id) as admin_centre_id, place, COALESCE(tags -> 'name:br'::text,'') as name, way
            FROM planet_osm_point 
            WHERE place IN ('town','city')
            AND way && !bbox!
        )
        SELECT p.osm_id, p.place, 3 as admin_level, p.name, p.way
        FROM planet_osm_rels AS r, p
        WHERE
            r.members::text ~ 'admin_centre' AND r.tags::text ~ 'admin_level,7' 
            AND p.admin_centre_id = ANY(members)
            AND ARRAY[p.osm_id] && parts
    )
    -- préfecture
    UNION
    (WITH
        p AS (
            SELECT osm_id, CONCAT('n',osm_id) as admin_centre_id, place, COALESCE(tags -> 'name:br'::text,'') as name, way
            FROM planet_osm_point 
            WHERE place IN ('town','city')
            AND way && !bbox!
        )
        SELECT p.osm_id, p.place, 4 as admin_level, p.name, p.way
        FROM planet_osm_rels AS r, p
        WHERE
            r.members::text ~ 'admin_centre' AND r.tags::text ~ 'admin_level,6' 
            AND p.admin_centre_id = ANY(members)
            AND ARRAY[p.osm_id] && parts
    )
) AS query
GROUP BY osm_id, place, name, way
ORDER BY admin_level DESC, name ASC






-- check place localization
SELECT 
  a.osm_id, a.name, b.local_name,
  CASE
    WHEN b.local_name IS NULL THEN 'null'
    ELSE 'done'
  END AS check,
  a.way 
FROM planet_osm_point a
FULL JOIN 
(
  SELECT osm_id, tags -> 'name:br' AS local_name
  FROM planet_osm_point 
  WHERE (tags -> 'name:br'::text IS NOT NULL)
) AS b ON a.osm_id = b.osm_id
WHERE name IS NOT NULL AND place IS NOT NULL

-- check way localization
SELECT 
  a.osm_id, a.name, b.local_name,
  CASE
    WHEN b.local_name IS NULL THEN 'null'
    ELSE 'done'
  END AS check,
  a.way 
FROM planet_osm_line a
FULL JOIN 
(
  SELECT osm_id, tags -> 'name:br' AS local_name
  FROM planet_osm_line 
  WHERE (tags -> 'name:br'::text IS NOT NULL)
) AS b ON a.osm_id = b.osm_id
WHERE name IS NOT NULL AND highway IS NOT NULL





-- =======================================================================

-- QGIS check for unique key
SELECT count(distinct ("osm_id"))=count(("osm_id")) FROM admin_places ;

-- QGIS  spatial query
SELECT * FROM places_br WHERE geometry && st_makeenvelope(-191010.82304755062796175,6075623.96413900051265955,-117242.15058065787889063,6119885.16761913616210222,3857) ;

-- carto spatial query
WHERE "geometry" && ST_SetSRID('BOX3D(-607072.89 6105178.323193599,-469629.1017841224 6590288.74)'::box3d, 3857)

-- grand ouest
-607072.89 6105178.323193599,-469629.1017841224 6590288.74
-- bruz ++
-205462.7320305551 6095394.383573093,-146759.0943075371 6154098.02129611
-- bruz centre
AND "geometry" && ST_SetSRID('BOX3D(-193844.303731207 6107012.811872441,-190175.3263735185 6110681.789230131)'::box3d, 3857)





