



-- tous les niveaux
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




SELECT osm_id, place as type, MAX(admin_level) as admin_level, name, way FROM ((WITH p AS (SELECT osm_id, CONCAT('n',osm_id) as admin_centre_id, place, COALESCE(tags -> 'name:br'::text,'') as name, way FROM planet_osm_point WHERE place IN ('village','town') AND way && !bbox! ) SELECT p.osm_id, p.place, 1 as admin_level, p.name, p.way FROM planet_osm_rels AS r, p WHERE r.members::text ~ 'admin_centre' AND r.tags::text ~ 'admin_level,8'AND p.admin_centre_id = ANY(members) AND ARRAY[p.osm_id] && parts ) UNION (WITH p AS (SELECT osm_id, CONCAT('n',osm_id) as admin_centre_id, place, COALESCE(tags -> 'name:br'::text,'') as name, way FROM planet_osm_point WHERE place IN ('village','town') AND way && !bbox! ) SELECT p.osm_id, p.place, 2 as admin_level, p.name, p.way FROM planet_osm_rels AS r, p WHERE r.members::text ~ 'admin_centre' AND r.tags::text ~ 'political_division,canton'AND p.admin_centre_id = ANY(members) AND ARRAY[p.osm_id] && parts ) UNION (WITH p AS (SELECT osm_id, CONCAT('n',osm_id) as admin_centre_id, place, COALESCE(tags -> 'name:br'::text,'') as name, way FROM planet_osm_point WHERE place IN ('town','city') AND way && !bbox! ) SELECT p.osm_id, p.place, 3 as admin_level, p.name, p.way FROM planet_osm_rels AS r, p WHERE r.members::text ~ 'admin_centre' AND r.tags::text ~ 'admin_level,7'AND p.admin_centre_id = ANY(members) AND ARRAY[p.osm_id] && parts ) UNION (WITH p AS (SELECT osm_id, CONCAT('n',osm_id) as admin_centre_id, place, COALESCE(tags -> 'name:br'::text,'') as name, way FROM planet_osm_point WHERE place IN ('town','city') AND way && !bbox! ) SELECT p.osm_id, p.place, 4 as admin_level, p.name, p.way FROM planet_osm_rels AS r, p WHERE r.members::text ~ 'admin_centre' AND r.tags::text ~ 'admin_level,6'AND p.admin_centre_id = ANY(members) AND ARRAY[p.osm_id] && parts ) ) AS query GROUP BY osm_id, place, name, way







