-- Deploy flipr:insert_user to pg
-- requires: users
-- requires: appschema
-- requires: pgcrypto

BEGIN;

CREATE OR REPLACE FUNCTION flipr.insert_user(
	nickname TEXT,
	password TEXT
) RETURNS VOID LANGUAGE SQL SECURITY DEFINER AS $$
	INSERT INTO flipr.users values($1, crypt($2, gen_salt('md5')));
$$;

COMMIT;
