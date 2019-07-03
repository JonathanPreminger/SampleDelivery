CREATE TABLE IF NOT EXISTS "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE IF NOT EXISTS "events" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "revenue_figure" integer, "total_charge_dj" integer, "charge_communication" integer, "charge_others" integer, "charge_others_description" text, "number_of_dj" integer, "line_up" text, "place" varchar, "name" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "benefits" varchar);
CREATE TABLE sqlite_sequence(name,seq);
CREATE TABLE IF NOT EXISTS "contacts" ("id" integer NOT NULL PRIMARY KEY, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "name" text DEFAULT NULL, "message" text, "email" text);
CREATE TABLE IF NOT EXISTS "realreleases" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" text, "tracks" text, "year" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE IF NOT EXISTS "artists" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "name" text);
INSERT INTO "schema_migrations" (version) VALUES
('20190617115626'),
('20190617123659'),
('20190621140028'),
('20190621143505'),
('20190621143621'),
('20190621143709'),
('20190621143745'),
('20190701150018'),
('20190701162247'),
('20190703082057'),
('20190703083530'),
('20190703083629'),
('20190703113312'),
('20190703113502'),
('20190703113659'),
('20190703141041'),
('20190703141139');


