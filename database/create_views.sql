
-- admin_places
-- see http://dba.stackexchange.com/questions/104943/osm2pgsql-select-relation-member-by-role
-- because planet_osm_rels.rels is not a hstore attribute
CREATE MATERIALIZED VIEW admin_places AS
-- préfecture
(SELECT
  DISTINCT(osm_id),
  way as geometry,
  name,
  COALESCE(tags -> 'name:fr'::text) as name_fr,
  COALESCE(tags -> 'name:br'::text) as name_br, -- breton
  COALESCE(tags -> 'name:eu'::text) as name_eu, -- basque
  COALESCE(tags -> 'name:oc'::text) as name_oc, -- occitan
  COALESCE(tags -> 'name:gsw'::text) as name_gsw, -- alsacien
  COALESCE(tags -> 'name:ca'::text) as name_ca, -- catalan
  COALESCE(tags -> 'name:co'::text) as name_co, -- corse
  'france' as admin_organisation,
  '3' as admin_level,
  'prefecture' as admin_name,
  place as type,
  population::text as population
FROM planet_osm_point
JOIN (
        WITH numbered AS(
            SELECT row_number() OVER() AS row, entry
            FROM(
                SELECT unnest(members) AS entry
                FROM planet_osm_rels
                WHERE ARRAY['boundary','administrative']<@tags AND ARRAY['admin_level','6']<@tags) AS mylist)
        SELECT ltrim(a.entry,'n')::bigint AS osm_id
        FROM numbered AS a JOIN numbered AS b
        ON a.row = b.row-1 AND b.entry = 'admin_centre'
) x
USING(osm_id))
UNION
-- chef-lieu de canton
(SELECT
  DISTINCT(osm_id),
  way as geometry,
  name as name,
  COALESCE(tags -> 'name:fr'::text) as name_fr,
  COALESCE(tags -> 'name:br'::text) as name_br, -- breton
  COALESCE(tags -> 'name:eu'::text) as name_eu, -- basque
  COALESCE(tags -> 'name:oc'::text) as name_oc, -- occitan
  COALESCE(tags -> 'name:gsw'::text) as name_gsw, -- alsacien
  COALESCE(tags -> 'name:ca'::text) as name_ca, -- catalan
  COALESCE(tags -> 'name:co'::text) as name_co, -- corse
  'france' as admin_organisation,
  '2' as admin_level,
  'chef-lieu de canton' as admin_name,
  place as type,
  population::text as population
FROM planet_osm_point
JOIN (
        WITH numbered AS(
            SELECT row_number() OVER() AS row, entry
            FROM(
                SELECT unnest(members) AS entry
                FROM planet_osm_rels
                WHERE ARRAY['political_division','canton']<@tags) AS mylist)
        SELECT ltrim(a.entry,'n')::bigint AS osm_id
        FROM numbered AS a JOIN numbered AS b
        ON a.row = b.row-1 AND b.entry = 'admin_centre'
) x
USING(osm_id))
UNION
-- commune
(SELECT
  DISTINCT(osm_id),
  way as geometry,
  name as name,
  COALESCE(tags -> 'name:fr'::text) as name_fr,
  COALESCE(tags -> 'name:br'::text) as name_br, -- breton
  COALESCE(tags -> 'name:eu'::text) as name_eu, -- basque
  COALESCE(tags -> 'name:oc'::text) as name_oc, -- occitan
  COALESCE(tags -> 'name:gsw'::text) as name_gsw, -- alsacien
  COALESCE(tags -> 'name:ca'::text) as name_ca, -- catalan
  COALESCE(tags -> 'name:co'::text) as name_co, -- corse
  'france' as admin_organisation,
  '1' as admin_level,
  'commune' as admin_name,
  place as type,
  population::text as population
FROM planet_osm_point
JOIN (
        WITH numbered AS(
            SELECT row_number() OVER() AS row, entry
            FROM(
                SELECT unnest(members) AS entry
                FROM planet_osm_rels
                WHERE ARRAY['boundary','administrative']<@tags AND ARRAY['admin_level','8']<@tags) AS mylist)
        SELECT ltrim(a.entry,'n')::bigint AS osm_id
        FROM numbered AS a JOIN numbered AS b
        ON a.row = b.row-1 AND b.entry = 'admin_centre'
) x
USING(osm_id));

