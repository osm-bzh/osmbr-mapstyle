-- indexes de la BD osm de osm-fr
-- https://raw.githubusercontent.com/cquest/osmfr-cartocss/master/tuning/create_index.sh
-- version du 16/10/2022

CREATE INDEX planet_osm_line_boundary ON planet_osm_line USING gist (way) WHERE boundary IS NOT NULL;
CREATE INDEX planet_osm_line_bridges ON planet_osm_line USING gist (way) WHERE bridge IS NOT NULL OR tunnel IS NOT NULL OR covered IS NOT NULL;
CREATE INDEX planet_osm_line_highway ON planet_osm_line USING gist (way) WHERE highway IS NOT NULL;
CREATE INDEX planet_osm_line_lz ON planet_osm_line USING gist (way) WHERE (historic = ANY (ARRAY['citywalls'::text, 'castle_walls'::text])) OR "natural" = 'cliff'::text OR man_made = 'embankment'::text OR tags ? 'piste:difficulty'::text OR aerialway IS NOT NULL OR man_made = 'cutline'::text OR (man_made = ANY (ARRAY['pier'::text, 'breakwater'::text, 'groyne'::text]));
CREATE INDEX planet_osm_line_minor_roads ON planet_osm_line USING gist (way) WHERE highway IS NOT NULL OR railway IS NOT NULL OR aeroway IS NOT NULL;
CREATE INDEX planet_osm_line_minor_roads_lz ON planet_osm_line USING gist (way) WHERE (highway IS NOT NULL OR railway IS NOT NULL OR aeroway IS NOT NULL) AND st_length(way) > 90::double precision;
CREATE INDEX planet_osm_line_name ON planet_osm_line USING gist (way) WHERE name IS NOT NULL;
CREATE INDEX planet_osm_line_power ON planet_osm_line USING gist (way) WHERE power IS NOT NULL;
CREATE INDEX planet_osm_line_railway ON planet_osm_line USING gist (way) WHERE railway IS NOT NULL;
CREATE INDEX planet_osm_line_ref ON planet_osm_line USING gist (way) WHERE ref IS NOT NULL;
CREATE INDEX planet_osm_line_roads ON planet_osm_line USING gist (way) WHERE highway ~ '^(motorway|trunk|primary|secondary|tertiary|construction)'::text;
CREATE INDEX planet_osm_line_waterway ON planet_osm_line USING gist (way) WHERE waterway IS NOT NULL;
CREATE INDEX planet_osm_point_capital ON planet_osm_point USING gist (way) WHERE place IS NOT NULL AND (capital IS NOT NULL OR tags ? 'is_capital'::text);
CREATE INDEX planet_osm_point_named ON planet_osm_point USING gist (way) WHERE COALESCE(name, tags -> 'name:fr'::text, tags -> 'int_name'::text, tags -> 'stars'::text, ele, tags -> 'ele:local'::text, ref, tags -> 'school:FR'::text) IS NOT NULL;
CREATE INDEX planet_osm_point_place ON planet_osm_point USING gist (way) WHERE place IS NOT NULL;
CREATE INDEX planet_osm_point_placenames ON planet_osm_point USING gist (way) WHERE place = ANY (ARRAY['city'::text, 'town'::text]);
CREATE INDEX planet_osm_point_placenames_large ON planet_osm_point USING gist (way) WHERE place = ANY (ARRAY['country'::text, 'state'::text, 'continent'::text]);
CREATE INDEX planet_osm_point_poi ON planet_osm_point USING gist (way) WHERE COALESCE(amenity, aeroway, military, barrier, man_made, railway, "natural", power, shop, tourism, waterway, historic, leisure, highway) IS NOT NULL OR tags ? 'mountain_pass'::text OR tags ? 'emergency'::text OR tags ? 'craft'::text;
CREATE INDEX planet_osm_point_poi_lz ON planet_osm_point USING gist (way) WHERE (aeroway = ANY (ARRAY['airport'::text, 'aerodrome'::text, 'helipad'::text, 'military'::text])) OR highway = 'motorway_junction'::text OR (railway = ANY (ARRAY['station'::text, 'halt'::text])) OR military = 'airfield'::text OR man_made = 'lighthouse'::text OR ("natural" = ANY (ARRAY['peak'::text, 'volcano'::text])) OR tags ? 'mountain_pass'::text OR power = 'plant'::text;
CREATE INDEX planet_osm_point_power ON planet_osm_point USING gist (way) WHERE power IS NOT NULL;
CREATE INDEX planet_osm_point_railway ON planet_osm_point USING gist (way) WHERE railway IS NOT NULL;
CREATE INDEX planet_osm_point_sea ON planet_osm_point USING gist (way) WHERE COALESCE("natural", place) = ANY (ARRAY['archipelago'::text, 'island'::text, 'ocean'::text, 'sea'::text, 'bay'::text, 'strait'::text, 'isthmus'::text]);
CREATE INDEX planet_osm_point_symbols_lz ON planet_osm_point USING gist (way) WHERE (aeroway = ANY (ARRAY['airport'::text, 'aerodrome'::text, 'helipad'::text, 'military'::text])) OR military = 'airfield'::text OR man_made = 'lighthouse'::text OR power = 'plant'::text OR ("natural" = ANY (ARRAY['peak'::text, 'volcano'::text])) OR tags ? 'mountain_pass'::text;
CREATE INDEX planet_osm_polygon_admin_level ON planet_osm_polygon USING gist (way) WHERE boundary = 'administrative'::text AND admin_level IS NOT NULL;
CREATE INDEX planet_osm_polygon_boundary ON planet_osm_polygon USING gist (way) WHERE boundary IS NOT NULL;
CREATE INDEX planet_osm_polygon_landcover ON planet_osm_polygon USING gist (way) WHERE COALESCE(landuse, wetland, leisure, aeroway, amenity, military, power, "natural", tourism, highway, man_made) IS NOT NULL OR (building = ANY (ARRAY['civic'::text, 'public'::text]));
CREATE INDEX planet_osm_polygon_large ON planet_osm_polygon USING gist (way) WHERE way_area > 1000000::double precision;
CREATE INDEX planet_osm_polygon_leisure ON planet_osm_polygon USING gist (way) WHERE leisure IS NOT NULL;
CREATE INDEX planet_osm_polygon_manmade ON planet_osm_polygon USING gist (way) WHERE man_made IS NOT NULL;
CREATE INDEX planet_osm_polygon_named ON planet_osm_polygon USING gist (way) WHERE COALESCE(name, tags -> 'name:fr'::text, tags -> 'int_name'::text, tags -> 'stars'::text, tags -> 'ele'::text, tags -> 'ele:local'::text, ref, tags -> 'school:FR'::text) IS NOT NULL;
CREATE INDEX planet_osm_polygon_no_building ON planet_osm_polygon USING gist (way) WHERE building IS NULL;
CREATE INDEX planet_osm_polygon_parks ON planet_osm_polygon USING gist (way) WHERE tourism = 'theme_park'::text OR boundary = 'national_park'::text;
CREATE INDEX planet_osm_polygon_poi ON planet_osm_polygon USING gist (way) WHERE COALESCE(amenity, aeroway, military, barrier, man_made, railway, "natural", power, shop, tourism, waterway, historic, leisure, highway) IS NOT NULL OR tags ? 'mountain_pass'::text OR tags ? 'emergency'::text OR tags ? 'craft'::text;
CREATE INDEX planet_osm_polygon_poi_lz ON planet_osm_polygon USING gist (way) WHERE aeroway = 'aerodrome'::text OR leisure = 'natural_reserve'::text OR tourism = 'theme_park'::text OR boundary = 'national_park'::text OR (place = ANY (ARRAY['archipelago'::text, 'island'::text]));
CREATE INDEX planet_osm_polygon_refinsee ON planet_osm_polygon USING gist (way) WHERE tags ? 'ref:INSEE'::text;
CREATE INDEX planet_osm_polygon_sea ON planet_osm_polygon USING gist (way) WHERE COALESCE("natural", place) = ANY (ARRAY['archipelago'::text, 'island'::text, 'ocean'::text, 'sea'::text, 'bay'::text, 'strait'::text, 'isthmus'::text]);
CREATE INDEX planet_osm_polygon_stations ON planet_osm_polygon USING gist (way) WHERE railway IS NOT NULL OR aeroway IS NOT NULL;
CREATE INDEX planet_osm_polygon_symbols_lz ON planet_osm_polygon USING gist (way) WHERE (aeroway = ANY (ARRAY['airport'::text, 'aerodrome'::text, 'helipad'::text, 'military'::text])) OR military = 'airfield'::text OR man_made = 'lighthouse'::text OR power = 'plant'::text OR ("natural" = ANY (ARRAY['peak'::text, 'volcano'::text])) OR tags ? 'mountain_pass'::text;
CREATE INDEX planet_osm_polygon_water ON planet_osm_polygon USING gist (way) WHERE landuse IS NOT NULL OR waterway IS NOT NULL OR "natural" IS NOT NULL OR amenity = 'fountain'::text;
CREATE INDEX planet_osm_roads_boundary ON planet_osm_roads USING gist (way) WHERE boundary = 'administrative'::text;
CREATE INDEX planet_osm_roads_main ON planet_osm_roads USING gist (way) WHERE highway IS NOT NULL OR railway IS NOT NULL;
