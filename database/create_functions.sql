-- https://github.com/cquest/osmfr-cartocss/blob/master/functions.sql
-- version du 16/10/2022

CREATE OR REPLACE FUNCTION to_int(text) RETURNS bigint
    LANGUAGE sql IMMUTABLE PARALLEL SAFE
    AS $_$ select coalesce(left(regexp_replace($1,'^(|\-)([0-9]*).*','\10\2'),12),'0')::bigint; $_$;

