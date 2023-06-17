-- Deploy flipr:users to pg
-- requires: appschema

BEGIN;

SET client_min_messages = 'Warning';

CREATE TABLE flipr.users (
	   nickname  TEXT        PRIMARY KEY,
	   password  TEXT        NOT NULL,
	   timestamp TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

COMMIT;
