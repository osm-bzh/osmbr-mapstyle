




SELECT osm_id, place as type, MAX(admin_level) as admin_level, name, way
FROM
(
    -- communes
    (WITH
        p AS (
            SELECT osm_id, CONCAT('n',osm_id) as admin_centre_id, place, COALESCE(tags -> 'name:br'::text,'#') as name, way
            FROM planet_osm_point 
            WHERE place IN ('village','town')
            AND way && !bbox!
        )
        SELECT p.osm_id, p.place, 1 as admin_level, p.name, p.way
        FROM planet_osm_rels AS r, p
        WHERE
            r.members::text ~ 'admin_centre' AND r.tags::text ~ 'admin_level,8' 
            AND p.admin_centre_id = ANY(members)
            AND ARRAY[p.osm_id] && parts
    )
    -- chefs-lieux de canton
    UNION
    (WITH
        p AS (
            SELECT osm_id, CONCAT('n',osm_id) as admin_centre_id, place, COALESCE(tags -> 'name:br'::text,'#') as name, way
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
            SELECT osm_id, CONCAT('n',osm_id) as admin_centre_id, place, COALESCE(tags -> 'name:br'::text,'#') as name, way
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
            SELECT osm_id, CONCAT('n',osm_id) as admin_centre_id, place, COALESCE(tags -> 'name:br'::text,'#') as name, way
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




SELECT osm_id, place as type, MAX(admin_level) as admin_level, name, way FROM ((WITH p AS (SELECT osm_id, CONCAT('n',osm_id) as admin_centre_id, place, COALESCE(tags -> 'name:br'::text,'#') as name, way FROM planet_osm_point WHERE place IN ('village','town') AND way && !bbox! ) SELECT p.osm_id, p.place, 1 as admin_level, p.name, p.way FROM planet_osm_rels AS r, p WHERE r.members::text ~ 'admin_centre' AND r.tags::text ~ 'admin_level,8'AND p.admin_centre_id = ANY(members) AND ARRAY[p.osm_id] && parts ) UNION (WITH p AS (SELECT osm_id, CONCAT('n',osm_id) as admin_centre_id, place, COALESCE(tags -> 'name:br'::text,'#') as name, way FROM planet_osm_point WHERE place IN ('village','town') AND way && !bbox! ) SELECT p.osm_id, p.place, 2 as admin_level, p.name, p.way FROM planet_osm_rels AS r, p WHERE r.members::text ~ 'admin_centre' AND r.tags::text ~ 'political_division,canton'AND p.admin_centre_id = ANY(members) AND ARRAY[p.osm_id] && parts ) UNION (WITH p AS (SELECT osm_id, CONCAT('n',osm_id) as admin_centre_id, place, COALESCE(tags -> 'name:br'::text,'#') as name, way FROM planet_osm_point WHERE place IN ('town','city') AND way && !bbox! ) SELECT p.osm_id, p.place, 3 as admin_level, p.name, p.way FROM planet_osm_rels AS r, p WHERE r.members::text ~ 'admin_centre' AND r.tags::text ~ 'admin_level,7'AND p.admin_centre_id = ANY(members) AND ARRAY[p.osm_id] && parts ) UNION (WITH p AS (SELECT osm_id, CONCAT('n',osm_id) as admin_centre_id, place, COALESCE(tags -> 'name:br'::text,'#') as name, way FROM planet_osm_point WHERE place IN ('town','city') AND way && !bbox! ) SELECT p.osm_id, p.place, 4 as admin_level, p.name, p.way FROM planet_osm_rels AS r, p WHERE r.members::text ~ 'admin_centre' AND r.tags::text ~ 'admin_level,6'AND p.admin_centre_id = ANY(members) AND ARRAY[p.osm_id] && parts ) ) AS query GROUP BY osm_id, place, name, way


/*
==================================================================================================================================
==================================================================================================================================
==================================================================================================================================
==================================================================================================================================
==================================================================================================================================
==================================================================================================================================
==================================================================================================================================
==================================================================================================================================
==================================================================================================================================
==================================================================================================================================
==================================================================================================================================
*/




-- 1312 admin_centre de niveau 8
SELECT 
    substring((regexp_matches(members::text, 'n[0-9]*')::text) from 3 for (char_length(regexp_matches(members::text, 'n[0-9]*')::text))-3)::text as admin_centre_id
FROM planet_osm_rels
WHERE
    members::text ~ 'admin_centre'
    AND tags::text ~ 'admin_level,8' 

-- 79 id dans la bbox
SELECT CONCAT('n',osm_id) as osm_id FROM planet_osm_point WHERE place IN ('village','town','city')
AND way && ST_SetSRID('BOX3D(-205462.7320305551 6095394.383573093,-146759.0943075371 6154098.02129611)'::box3d, 3857)


-- on créer un array des 79 osm_id
SELECT string_agg(('''n'||osm_id||'''')::text,',') AS list
FROM planet_osm_point WHERE place IN ('village','town','city')
AND way && ST_SetSRID('BOX3D(-205462.7320305551 6095394.383573093,-146759.0943075371 6154098.02129611)'::box3d, 3857)
--  "'n2708062985','n26695731','n289017652','n2620362182','n26695440','n26695135','n26694738','n26697459','n335845513','n26695503','n1698338388','n276815188','n26697449','n406522362','n26698418','n26696726','n26696880','n26696362','n34402463','n26696755','n26697652','n26694931','n1871765083','n276820329','n1871765084','n26697996','n26697911','n26686526','n26695870','n268658548','n26692039','n793717715','n26695049','n26695885','n278554513','n267155876','n26695651','n266859465','n26695072','n470366755','n26694853','n26694629','n26698015','n271437497','n470366754','n271244634','n26695553','n470366708','n273477574','n470366746','n326931305','n26696835','n26695342','n1371896170','n36674955','n2319796801','n227098138','n243190521','n26696063','n219062566','n26694656','n470366667','n353191582','n26694329','n228486015','n1698338416','n26695222','n243749356','n1714288703','n470366741','n1714281533','n470366676','n470366787','n27256392','n26696269','n470366725','n26818916','n279150255','n26695046'"



-- selectionne les relations pour un id
SELECT *
FROM planet_osm_rels
WHERE 'n26696362' = ANY (members)





SELECT * FROM ma_table WHERE 'n26696362' = ANY (members)
/*
"107906"    1   8   "{26696362,35210331,34350031,34350032,32854939,32854871,45375861,32854935}" "{n26696362,admin_centre,w35210331,outer,w34350031,outer,w34350032,outer,w32854939,outer,w32854871,outer,w45375861,outer,w32854935,outer}"  "{addr:postcode,35170,admin_level,8,boundary,administrative,name,Bruz,name:br,Bruz,name:fr,Bruz,ref:INSEE,35047,source:addr:postcode,"source of postcode is from osm nodes",type,boundary,wikidata,Q216837,wikipedia,fr:Bruz}"
"2500293"   1   27  "{26696362,35210331,34350031,34350032,34350030,34624783,32854954,32810339,32854948,476212193,34875345,476212192,34886368,34886357,35013218,34849023,264859102,461512138,371162015,189217864,469559626,461246620,32046429,32854942,32854941,45375861,32854935}"  "{n26696362,admin_centre,w35210331,outer,w34350031,outer,w34350032,outer,w34350030,outer,w34624783,outer,w32854954,outer,w32810339,outer,w32854948,outer,w476212193,outer,w34875345,outer,w476212192,outer,w34886368,outer,w34886357,outer,w35013218,outer,w34849023,outer,w264859102,outer,w461512138,outer,w371162015,outer,w189217864,outer,w469559626,outer,w461246620,outer,w32046429,outer,w32854942,outer,w32854941,outer,w45375861,outer,w32854935,outer}"  "{disused:boundary,political,disused:political_division,canton,end_date,2015-03,name,Bruz,ref:INSEE,3547,source,"data.gouv.fr-Ministère de l'Intérieur-03/2012",type,boundary}"
"3557378"   1   25  "{26696362,461246620,469559626,189217864,371162015,461512138,264859102,34849023,35013218,34886367,114126680,34849059,34624779,34624783,34350029,34350034,34350036,34350025,34350031,35210331,32854935,45375861,32854941,32854942,32046429,107906,108428,134220,144595,140826}"  "{w461246620,outer,w469559626,outer,w189217864,outer,w371162015,outer,w461512138,outer,w264859102,outer,w34849023,outer,w35013218,outer,w34886367,outer,w114126680,outer,w34849059,outer,w34624779,outer,w34624783,outer,w34350029,outer,w34350034,outer,w34350036,outer,w34350025,outer,w34350031,outer,w35210331,outer,w32854935,outer,w45375861,outer,w32854941,outer,w32854942,outer,w32046429,outer,n26696362,admin_centre,r107906,subarea,r108428,subarea,r134220,subarea,r144595,subarea,r140826,subarea}"   "{boundary,political,name,Bruz,name:br,Bruz,name:fr,Bruz,political_division,canton,ref,035-04,source,"(JORF 2014-02-22) Décret nº 2014-177 du 18 février 2014 portant délimitation des cantons dans le département d’Ille-et-Vilaine",source:url,http://www.legifrance.gouv.fr/affichTexte.do?cidTexte=JORFTEXT000028637230,start_date,2015-03,type,boundary,wikidata,Q1724632,wikipedia,"fr:Canton de Bruz"}"
*/

-- pas bon : 1min47
SELECT p.osm_id, p.name 
FROM planet_osm_point  AS p
JOIN
(
SELECT 
    substring((regexp_matches(members::text, 'n[0-9]*')::text) from 3 for (char_length(regexp_matches(members::text, 'n[0-9]*')::text))-3)::text as admin_centre_id
FROM planet_osm_rels
WHERE
    members::text ~ 'admin_centre'
    AND tags::text ~ 'admin_level,8' 
) AS r
ON p.osm_id::text = r.admin_centre_id
WHERE p.place IN ('village','town','city') 
AND way && ST_SetSRID('BOX3D(-205462.7320305551 6095394.383573093,-146759.0943075371 6154098.02129611)'::box3d, 3857)


SELECT *
FROM planet_osm_rels
WHERE members @> array['n26696362']

SELECT *
FROM planet_osm_rels
WHERE members @> array['admin_centre'] AND tags @> array['admin_level','8']
AND members @> array['n2708062985']



-- marche
WITH
    p AS (
        SELECT CONCAT('n',osm_id) as osm_id
        FROM planet_osm_point 
        WHERE place IN ('village','town','city')
        AND way && ST_SetSRID('BOX3D(-205462.7320305551 6095394.383573093,-146759.0943075371 6154098.02129611)'::box3d, 3857)
    )
    --SELECT sub.id_bav FROM espace_public.gesbac_bav as sub WHERE sub.id_pav in (select id_pav from p)
    SELECT *
    FROM planet_osm_rels
    WHERE
        members::text ~ 'admin_centre' AND tags::text ~ 'admin_level,8' 
        AND 'n26696362' = ANY (members)





/*
==================================================================================================================================
==================================================================================================================================
==================================================================================================================================
==================================================================================================================================
==================================================================================================================================
==================================================================================================================================
==================================================================================================================================
==================================================================================================================================
==================================================================================================================================
==================================================================================================================================
==================================================================================================================================
*/




-- les préfectures
SELECT
  substring((regexp_matches(members::text, 'n[0-9]*')::text) from 3 for (char_length(regexp_matches(members::text, 'n[0-9]*')::text))-3)::bigint as admin_centre_id,
  'france' as admin_organisation,
  '3' as admin_level,
  'prefecture' as admin_name
FROM planet_osm_rels
WHERE tags::text ~ 'admin_level,6' ;

-- les chefs-lieux de canton
SELECT
  substring((regexp_matches(members::text, 'n[0-9]*')::text) from 3 for (char_length(regexp_matches(members::text, 'n[0-9]*')::text))-3)::bigint as admin_centre_id,
  'france' as admin_organisation,
  '2' as admin_level,
  'chef-lieu de canton' as admin_name
FROM planet_osm_rels
WHERE tags::text ~ 'political_division,canton' ;

-- les communes
SELECT
  substring((regexp_matches(members::text, 'n[0-9]*')::text) from 3 for (char_length(regexp_matches(members::text, 'n[0-9]*')::text))-3)::bigint as admin_centre_id,
  'france' as admin_organisation,
  '1' as admin_level,
  'commune' as admin_name
FROM planet_osm_rels WHERE tags::text ~ 'admin_level,8' ;


-- UNION
SELECT
  substring((regexp_matches(members::text, 'n[0-9]*')::text) from 3 for (char_length(regexp_matches(members::text, 'n[0-9]*')::text))-3)::bigint as admin_centre_id,
  'france' as admin_organisation,
  '3' as admin_level,
  'prefecture' as admin_name
FROM planet_osm_rels WHERE tags::text ~ 'admin_level,6'
UNION
SELECT
  substring((regexp_matches(members::text, 'n[0-9]*')::text) from 3 for (char_length(regexp_matches(members::text, 'n[0-9]*')::text))-3)::bigint as admin_centre_id,
  'france' as admin_organisation,
  '2' as admin_level,
  'chef-lieu de canton' as admin_name
FROM planet_osm_rels WHERE tags::text ~ 'political_division,canton'
UNION
SELECT
  substring((regexp_matches(members::text, 'n[0-9]*')::text) from 3 for (char_length(regexp_matches(members::text, 'n[0-9]*')::text))-3)::bigint as admin_centre_id,
  'france' as admin_organisation,
  '1' as admin_level,
  'commune' as admin_name
FROM planet_osm_rels WHERE tags::text ~ 'admin_level,8'
;


-- là on a une table comme il faut avec la géométrie venant de planet_osm_point exploitable par carto
-- pb : doublons pour les villes cumulant plusieurs niveaux administratifs
SELECT p.osm_id, p.way, COALESCE(p.tags -> 'name:br'::text,'???') as name, p.place as type, r.admin_organisation, r.admin_level, r.admin_name, concat(r.admin_level,' | ',p.place,' | ',name) as label
FROM planet_osm_point AS p
JOIN
(
    SELECT
      substring((regexp_matches(members::text, 'n[0-9]*')::text) from 3 for (char_length(regexp_matches(members::text, 'n[0-9]*')::text))-3)::bigint as admin_centre_id,
      'france' as admin_organisation,
      '3' as admin_level,
      'prefecture' as admin_name
    FROM planet_osm_rels WHERE tags::text ~ 'admin_level,6'
    UNION
    SELECT
      substring((regexp_matches(members::text, 'n[0-9]*')::text) from 3 for (char_length(regexp_matches(members::text, 'n[0-9]*')::text))-3)::bigint as admin_centre_id,
      'france' as admin_organisation,
      '2' as admin_level,
      'chef-lieu de canton' as admin_name
    FROM planet_osm_rels WHERE tags::text ~ 'political_division,canton'
    UNION
    SELECT
      substring((regexp_matches(members::text, 'n[0-9]*')::text) from 3 for (char_length(regexp_matches(members::text, 'n[0-9]*')::text))-3)::bigint as admin_centre_id,
      'france' as admin_organisation,
      '1' as admin_level,
      'commune' as admin_name
    FROM planet_osm_rels WHERE tags::text ~ 'admin_level,8'
) AS r 
ON p.osm_id = r.admin_centre_id ;














-- 1
SELECT * FROM
(
-- table avec tous les niveaux administratifs cumulés 
    -- préfectures
    SELECT
      substring((regexp_matches(members::text, 'n[0-9]*')::text) from 3 for (char_length(regexp_matches(members::text, 'n[0-9]*')::text))-3)::bigint as admin_centre_id,
      '3' as admin_level
    FROM planet_osm_rels WHERE tags::text ~ 'admin_level,6'
    UNION
    -- chefs-lieux de canton
    SELECT
      substring((regexp_matches(members::text, 'n[0-9]*')::text) from 3 for (char_length(regexp_matches(members::text, 'n[0-9]*')::text))-3)::bigint as admin_centre_id,
      '2' as admin_level
    FROM planet_osm_rels WHERE tags::text ~ 'political_division,canton'
    UNION
    -- communes
    SELECT
      substring((regexp_matches(members::text, 'n[0-9]*')::text) from 3 for (char_length(regexp_matches(members::text, 'n[0-9]*')::text))-3)::bigint as admin_centre_id,
      '1' as admin_level
    FROM planet_osm_rels WHERE tags::text ~ 'admin_level,8'
) AS sub1 
WHERE sub1.admin_centre_id IN (26686526, 823582966, 26696362)



-- 2
-- table sans les niveaux dupliqués : on garde le plus élevé
SELECT
  sub1.admin_centre_id, MAX(sub1.admin_level) AS admin_level
FROM
(
-- table avec tous les niveaux administratifs cumulés 
    -- préfectures
    SELECT
      substring((regexp_matches(members::text, 'n[0-9]*')::text) from 3 for (char_length(regexp_matches(members::text, 'n[0-9]*')::text))-3)::bigint as admin_centre_id,
      '3' as admin_level
    FROM planet_osm_rels WHERE tags::text ~ 'admin_level,6'
    UNION
    -- chefs-lieux de canton
    SELECT
      substring((regexp_matches(members::text, 'n[0-9]*')::text) from 3 for (char_length(regexp_matches(members::text, 'n[0-9]*')::text))-3)::bigint as admin_centre_id,
      '2' as admin_level
    FROM planet_osm_rels WHERE tags::text ~ 'political_division,canton'
    UNION
    -- communes
    SELECT
      substring((regexp_matches(members::text, 'n[0-9]*')::text) from 3 for (char_length(regexp_matches(members::text, 'n[0-9]*')::text))-3)::bigint as admin_centre_id,
      '1' as admin_level
    FROM planet_osm_rels WHERE tags::text ~ 'admin_level,8'
) AS sub1 
WHERE sub1.admin_centre_id IN (26686526, 823582966, 26696362)
GROUP BY sub1.admin_centre_id



-- 3
-- on part de la table planet_osm_point qui contient la géométrie
-- et on fait une jointure sur la table sans les niveaux dupliqués
-- bien sauf qu'on n'a pas les niveaux administratifs...
SELECT
    p.osm_id, p.way, COALESCE(p.tags -> 'name:br'::text,'???') as name, p.place as type
FROM planet_osm_point AS p
JOIN
(
    -- table sans les niveaux dupliqués : on garde le plus élevé
    SELECT
      sub1.admin_centre_id, MAX(sub1.admin_level) AS admin_level
    FROM
    (
    -- table avec tous les niveaux administratifs cumulés 
        -- préfectures
        SELECT
          substring((regexp_matches(members::text, 'n[0-9]*')::text) from 3 for (char_length(regexp_matches(members::text, 'n[0-9]*')::text))-3)::bigint as admin_centre_id,
          '3' as admin_level
        FROM planet_osm_rels WHERE tags::text ~ 'admin_level,6'
        UNION
        -- chefs-lieux de canton
        SELECT
          substring((regexp_matches(members::text, 'n[0-9]*')::text) from 3 for (char_length(regexp_matches(members::text, 'n[0-9]*')::text))-3)::bigint as admin_centre_id,
          '2' as admin_level
        FROM planet_osm_rels WHERE tags::text ~ 'political_division,canton'
        UNION
        -- communes
        SELECT
          substring((regexp_matches(members::text, 'n[0-9]*')::text) from 3 for (char_length(regexp_matches(members::text, 'n[0-9]*')::text))-3)::bigint as admin_centre_id,
          '1' as admin_level
        FROM planet_osm_rels WHERE tags::text ~ 'admin_level,8'
    ) AS sub1 
    GROUP BY sub1.admin_centre_id
) AS sub2
ON p.osm_id = sub2.admin_centre_id
WHERE p.osm_id IN (26686526, 823582966, 26696362)


-- 4
-- on part de la table planet_osm_point qui contient la géométrie
-- et on fait une jointure sur la table avec les niveaux dupliqués
-- ce qui permet de récupérer le admin_level
-- bien sauf que c'est dupliqué
SELECT
    p.osm_id, p.way, COALESCE(p.tags -> 'name:br'::text,'???') as name, p.place as type,
    sub1.admin_level, sub1.admin_name
FROM planet_osm_point AS p
JOIN
(
    -- table avec tous les niveaux administratifs cumulés 
        -- préfectures
        SELECT
          substring((regexp_matches(members::text, 'n[0-9]*')::text) from 3 for (char_length(regexp_matches(members::text, 'n[0-9]*')::text))-3)::bigint as admin_centre_id,
          '3' as admin_level,
          'prefecture' as admin_name
        FROM planet_osm_rels WHERE tags::text ~ 'admin_level,6'
        UNION
        -- chefs-lieux de canton
        SELECT
          substring((regexp_matches(members::text, 'n[0-9]*')::text) from 3 for (char_length(regexp_matches(members::text, 'n[0-9]*')::text))-3)::bigint as admin_centre_id,
          '2' as admin_level,
          'chef-lieu de canton' as admin_name
        FROM planet_osm_rels WHERE tags::text ~ 'political_division,canton'
        UNION
        -- communes
        SELECT
          substring((regexp_matches(members::text, 'n[0-9]*')::text) from 3 for (char_length(regexp_matches(members::text, 'n[0-9]*')::text))-3)::bigint as admin_centre_id,
          '1' as admin_level,
          'commune' as admin_name
        FROM planet_osm_rels WHERE tags::text ~ 'admin_level,8'
    ) AS sub1
ON p.osm_id = sub1.admin_centre_id
WHERE p.osm_id IN (26686526, 823582966, 26696362)



-- 5
-- jointure de la requête sans doublons
-- sur la requête avec doublons MAIS admin_level
SELECT sub_unique.admin_centre_id, sub_unique.admin_level
FROM
(
    -- table sans les niveaux dupliqués : on garde le plus élevé
    SELECT
      sub1.admin_centre_id, MAX(sub1.admin_level) AS admin_level
    FROM
    (
    -- table avec tous les niveaux administratifs cumulés 
        -- préfectures
        SELECT
          substring((regexp_matches(members::text, 'n[0-9]*')::text) from 3 for (char_length(regexp_matches(members::text, 'n[0-9]*')::text))-3)::bigint as admin_centre_id,
          '3' as admin_level
        FROM planet_osm_rels WHERE tags::text ~ 'admin_level,6'
        UNION
        -- chefs-lieux de canton
        SELECT
          substring((regexp_matches(members::text, 'n[0-9]*')::text) from 3 for (char_length(regexp_matches(members::text, 'n[0-9]*')::text))-3)::bigint as admin_centre_id,
          '2' as admin_level
        FROM planet_osm_rels WHERE tags::text ~ 'political_division,canton'
        UNION
        -- communes
        SELECT
          substring((regexp_matches(members::text, 'n[0-9]*')::text) from 3 for (char_length(regexp_matches(members::text, 'n[0-9]*')::text))-3)::bigint as admin_centre_id,
          '1' as admin_level
        FROM planet_osm_rels WHERE tags::text ~ 'admin_level,8'
    ) AS sub1 
    GROUP BY sub1.admin_centre_id
) AS sub_unique
LEFT JOIN
(
    SELECT 
        sub2.admin_centre_id, sub2.admin_level, sub2.admin_name
    FROM
    (
    -- table avec tous les niveaux administratifs cumulés 
        -- préfectures
        SELECT
          substring((regexp_matches(members::text, 'n[0-9]*')::text) from 3 for (char_length(regexp_matches(members::text, 'n[0-9]*')::text))-3)::bigint as admin_centre_id,
          '3' as admin_level,
          'prefecture' as admin_name
        FROM planet_osm_rels WHERE tags::text ~ 'admin_level,6'
        UNION
        -- chefs-lieux de canton
        SELECT
          substring((regexp_matches(members::text, 'n[0-9]*')::text) from 3 for (char_length(regexp_matches(members::text, 'n[0-9]*')::text))-3)::bigint as admin_centre_id,
          '2' as admin_level,
          'chef-lieu de canton' as admin_name
        FROM planet_osm_rels WHERE tags::text ~ 'political_division,canton'
        UNION
        -- communes
        SELECT
          substring((regexp_matches(members::text, 'n[0-9]*')::text) from 3 for (char_length(regexp_matches(members::text, 'n[0-9]*')::text))-3)::bigint as admin_centre_id,
          '1' as admin_level,
          'commune' as admin_name
        FROM planet_osm_rels WHERE tags::text ~ 'admin_level,8'
    ) AS sub2
) AS sub_duplicate
-- le critère de jointure
ON sub_unique.admin_centre_id = sub_duplicate.admin_centre_id AND sub_unique.admin_level = sub_duplicate.admin_level
WHERE sub_unique.admin_centre_id IN (26686526, 823582966, 26696362)



-- 6
-- on part de la table planet_osm_point qui contient la géométrie
-- et on fait une jointure sur
--   la jointure de la requête sans doublons
--   avec la requête avec doublons MAIS admin_level

SELECT
    p.osm_id, p.way, COALESCE(p.tags -> 'name:br'::text,'???') as name, p.place as type,
    sub_admin.admin_level, sub_admin.admin_name
FROM planet_osm_point AS p
JOIN
(

    SELECT sub_unique.admin_centre_id, sub_unique.admin_level, sub_duplicate.admin_name
    FROM
    (
        -- table sans les niveaux dupliqués : on garde le plus élevé
        SELECT
          sub1.admin_centre_id, MAX(sub1.admin_level) AS admin_level
        FROM
        (
        -- table avec tous les niveaux administratifs cumulés 
            -- préfectures
            SELECT
              substring((regexp_matches(members::text, 'n[0-9]*')::text) from 3 for (char_length(regexp_matches(members::text, 'n[0-9]*')::text))-3)::bigint as admin_centre_id,
              '4' as admin_level
            FROM planet_osm_rels WHERE tags::text ~ 'admin_level,6'
            UNION
            -- sous-préfectures
            SELECT
              substring((regexp_matches(members::text, 'n[0-9]*')::text) from 3 for (char_length(regexp_matches(members::text, 'n[0-9]*')::text))-3)::bigint as admin_centre_id,
              '3' as admin_level
            FROM planet_osm_rels WHERE tags::text ~ 'admin_level,7'
            UNION
            -- chefs-lieux de canton
            SELECT
              substring((regexp_matches(members::text, 'n[0-9]*')::text) from 3 for (char_length(regexp_matches(members::text, 'n[0-9]*')::text))-3)::bigint as admin_centre_id,
              '2' as admin_level
            FROM planet_osm_rels WHERE tags::text ~ 'political_division,canton'
            UNION
            -- communes
            SELECT
              substring((regexp_matches(members::text, 'n[0-9]*')::text) from 3 for (char_length(regexp_matches(members::text, 'n[0-9]*')::text))-3)::bigint as admin_centre_id,
              '1' as admin_level
            FROM planet_osm_rels WHERE tags::text ~ 'admin_level,8'
        ) AS sub1 
        GROUP BY sub1.admin_centre_id
    ) AS sub_unique
    LEFT JOIN
    (
        SELECT 
            sub2.admin_centre_id, sub2.admin_level, sub2.admin_name
        FROM
        (
        -- table avec tous les niveaux administratifs cumulés 
            -- préfectures
            SELECT
              substring((regexp_matches(members::text, 'n[0-9]*')::text) from 3 for (char_length(regexp_matches(members::text, 'n[0-9]*')::text))-3)::bigint as admin_centre_id,
              '4' as admin_level,
              'préfecture' as admin_name
            FROM planet_osm_rels WHERE tags::text ~ 'admin_level,6'
            UNION
            -- sous-préfectures
            SELECT
              substring((regexp_matches(members::text, 'n[0-9]*')::text) from 3 for (char_length(regexp_matches(members::text, 'n[0-9]*')::text))-3)::bigint as admin_centre_id,
              '3' as admin_level,
              'sous-préfecture' as admin_name
            FROM planet_osm_rels WHERE tags::text ~ 'admin_level,7'
            UNION
            -- chefs-lieux de canton
            SELECT
              substring((regexp_matches(members::text, 'n[0-9]*')::text) from 3 for (char_length(regexp_matches(members::text, 'n[0-9]*')::text))-3)::bigint as admin_centre_id,
              '2' as admin_level,
              'chef-lieu de canton' as admin_name
            FROM planet_osm_rels WHERE tags::text ~ 'political_division,canton'
            UNION
            -- communes
            SELECT
              substring((regexp_matches(members::text, 'n[0-9]*')::text) from 3 for (char_length(regexp_matches(members::text, 'n[0-9]*')::text))-3)::bigint as admin_centre_id,
              '1' as admin_level,
              'commune' as admin_name
            FROM planet_osm_rels WHERE tags::text ~ 'admin_level,8'
        ) AS sub2
    ) AS sub_duplicate
    -- le critère de jointure
    ON sub_unique.admin_centre_id = sub_duplicate.admin_centre_id AND sub_unique.admin_level = sub_duplicate.admin_level
) AS sub_admin
ON p.osm_id = sub_admin.admin_centre_id
--WHERE p.osm_id IN (26686526, 823582966, 26696362)








-- la requête actuelle
SELECT a.osm_id, a.name_br AS name, a.admin_level, a.admin_name, a.type, a.geometry
FROM admin_places a JOIN 
(
    SELECT osm_id, name_br, MAX(admin_level) AS admin_level 
    FROM admin_places 
    GROUP BY osm_id, name_br
) b ON a.osm_id = b.osm_id AND a.admin_level = b.admin_level  
WHERE a.name_br IS NOT NULL 
ORDER BY a.admin_level DESC, a.name_br ASC





















/* =============================================================================== */
/*   méthode 2 : passse pas car on n'a pas les chefs-lieux  de canton  */


-- on va chercher dans les relations
-- 1 : les enregistrements qui concernent admin_level = 6
-- 2 : on en extrait l'id du node qui est dans cette relation
SELECT
  id as rel_id,
  -- members, tags,
  substring((regexp_matches(members::text, 'n[0-9]*')::text) from 3 for (char_length(regexp_matches(members::text, 'n[0-9]*')::text))-3)::bigint as admin_centre_id
FROM planet_osm_rels
WHERE
  tags::text LIKE '%admin_level,6%' ;
/*    "rel_id" "admin_centre_id" 
    "7398"  "26691381"
    "7404"  "633972384"
"*/

-- avec l'admin_centre_id c'est simple de sélectionner un point
SELECT osm_id, way, COALESCE(tags -> 'name:br'::text) as name 
FROM planet_osm_point
WHERE osm_id = 26691381 ;


-- on fait donc une requête avec une sous-requête
SELECT osm_id, way, COALESCE(tags -> 'name:br'::text) as name 
FROM planet_osm_point
WHERE osm_id IN 
(
    SELECT substring((regexp_matches(members::text, 'n[0-9]*')::text) from 3 for (char_length(regexp_matches(members::text, 'n[0-9]*')::text))-3)::bigint as admin_centre_id
    FROM planet_osm_rels
    WHERE tags::text LIKE '%admin_level,6%'
);

-- minification
SELECT osm_id, way, COALESCE(tags -> 'name:br'::text) as name FROM planet_osm_point WHERE osm_id IN ( SELECT substring((regexp_matches(members::text, 'n[0-9]*')::text) from 3 for (char_length(regexp_matches(members::text, 'n[0-9]*')::text))-3)::bigint as admin_centre_id FROM planet_osm_rels WHERE tags::text LIKE '%admin_level,6%' );



-- on corse en essayant de récupérer le admin_level sur tous les objets
SELECT
  substring((regexp_matches(members::text, 'n[0-9]*')::text) from 3 for (char_length(regexp_matches(members::text, 'n[0-9]*')::text))-3)::bigint as admin_centre_id,
  array_to_string(regexp_matches((regexp_matches(tags::text, 'admin_level,[0-9]*'))::text,'[0-9]'), '') as admin_level
FROM planet_osm_rels
WHERE tags::text ~ 'admin_level' ;

-- du coup là il faut une jointure
SELECT p.osm_id, p.way, COALESCE(p.tags -> 'name:br'::text) as name, r.admin_level, p.place as type
FROM planet_osm_point AS p
JOIN
(
    SELECT
        substring((regexp_matches(members::text, 'n[0-9]*')::text) from 3 for (char_length(regexp_matches(members::text, 'n[0-9]*')::text))-3)::bigint as admin_centre_id,
        array_to_string(regexp_matches((regexp_matches(tags::text, 'admin_level,[0-9]*'))::text,'[0-9]'), '') as admin_level
    FROM planet_osm_rels
    WHERE tags::text ~ 'admin_level'
) AS r 
ON p.osm_id = r.admin_centre_id ;

/*  osm_id, way, name, admin_level 
    "26691381"  "0101000020110F0000E17A14AE1FC112C1A4703DBAAD9F5741"    "Sant-Brieg"    "6"
    "1681903701"    "0101000020110F0000EC51B81E7EC012C148E17A6474145741"    "Gwened"    "6"
    "26686526"  "0101000020110F000052B81E8557D406C19A999969D55D5741"    "Roazhon"   "6"
    "26695049"  "0101000020110F0000D7A3703DB80006C17B14AEC7EB595741"    "Kantpig"   "8"*/

-- minification
SELECT p.osm_id, p.way, COALESCE(p.tags -> 'name:br'::text) as name, r.admin_level, p.place as type  FROM planet_osm_point AS p JOIN ( SELECT substring((regexp_matches(members::text, 'n[0-9]*')::text) from 3 for (char_length(regexp_matches(members::text, 'n[0-9]*')::text))-3)::bigint as admin_centre_id, array_to_string(regexp_matches((regexp_matches(tags::text, 'admin_level,[0-9]*'))::text,'[0-9]'), '') as admin_level FROM planet_osm_rels WHERE tags::text ~ 'admin_level') AS r ON p.osm_id = r.admin_centre_id ;










/* =============================================================================== */
/*   méthode 1 : passse pas dans carto qui va chercher une géométrie dans la table rels… 
SELECT ST_SRID("way") AS srid FROM planet_osm_rels WHERE "way" IS NOT NULL LIMIT 1;
*/



-- Bruz = node 26696362
-- select the point
SELECT osm_id, way, COALESCE(tags -> 'name:br'::text) as name 
FROM planet_osm_point
WHERE osm_id = 26696362 ;
-- => "26696362"    "0101000020110F00008FC2F528EAC307C100000030964F5741"    "Bruz"

-- OR
-- select from node
SELECT * FROM planet_osm_nodes WHERE id = 26696362 ;


-- la relation
SELECT id, parts, members, tags
FROM planet_osm_rels
WHERE id = 107906 ;
    /*
    "107906"
    parts = "{26696362,35210331,34350031,34350032,32854939,32854871,45375861,32854935}"
    members = "{n26696362,admin_centre,w35210331,outer,w34350031,outer,w34350032,outer,w32854939,outer,w32854871,outer,w45375861,outer,w32854935,outer}" 
    tags = "{name,Bruz,type,boundary,name:br,Bruz,name:fr,Bruz,boundary,administrative,wikidata,Q216837,ref:INSEE,35047,wikipedia,fr:Bruz,admin_level,8,addr:postcode,35170,source:addr:postcode,"source of postcode is from osm nodes"}"
    */

-- elle renvoie à des way "outer" qui font la limite administrative dans members : 
-- https://www.openstreetmap.org/way/34350032 = "w34350032,outer"
-- tandis que le admin_centre = "n26696362,admin_centre"
-- le niveau administratif est porté dans tags

-- sélection des 6 relations pour le niveau admin 6
SELECT id, parts, members, tags
FROM planet_osm_rels
WHERE (ARRAY['boundary','administrative']<@tags AND ARRAY['admin_level','6']<@tags) ;

-- sélection de toutes les communes avec un name:br
SELECT id, parts, members, tags
FROM planet_osm_rels
WHERE
(
    ARRAY['boundary','administrative']<@tags
    AND ARRAY['admin_level','8']<@tags
    AND ARRAY['name:br']<@tags
);

-- maintenant il faut isoler l'id du nœud qui a un rôle "admin_centre"
-- pb : unnest désaggrège le tableau et fait un enregistrement par ligne
SELECT 
    id,
    --parts, members, tags,
    unnest(members) as member
FROM planet_osm_rels
WHERE
(
    ARRAY['boundary','administrative']<@tags
    AND ARRAY['admin_level','8']<@tags
    AND ARRAY['name:br']<@tags
)
AND id = 107906
    /*
    "107906"    "n26696362"
    "107906"    "admin_centre"
    "107906"    "w35210331"
    "107906"    "outer"
    */


-- unnested members table
WITH member AS
(SELECT id as rel_id, unnest(members) as member
FROM planet_osm_rels
WHERE
    (
    ARRAY['boundary','administrative']<@tags
    AND ARRAY['admin_level','8']<@tags
    AND ARRAY['name:br']<@tags
    )
)
SELECT rel_id, member FROM member
WHERE rel_id = 107906;
    /*
    "107906"    "n26696362"
    "107906"    "admin_centre"
    "107906"    "w35210331"
    "107906"    "outer"
    */




SELECT unnest(members) AS entry
FROM planet_osm_rels
WHERE id = 107906 ;
/*"n26696362"
"admin_centre"
"w35210331"
"outer"
"w34350031"
"outer"
...*/





-- tip from https://dba.stackexchange.com/a/116966 
SELECT DISTINCT way,name, COALESCE(tags -> 'name:br'::text) AS name_br
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
USING(osm_id)
WHERE planet_osm_point.osm_id = 26696362 ;



SELECT unnest(members) AS entry
FROM planet_osm_rels
WHERE id = 107906 ;
/*"n26696362"
"admin_centre"
"w35210331"
"outer"
"w34350031"
"outer"
...*/


