CREATE TABLE IF NOT EXISTS "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE IF NOT EXISTS "events" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "revenue_figure" integer, "total_charge_dj" integer, "charge_communication" integer, "charge_others" integer, "charge_others_description" text, "number_of_dj" integer, "line_up" text, "place" varchar, "name" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "benefits" varchar);
CREATE TABLE sqlite_sequence(name,seq);
CREATE TABLE IF NOT EXISTS "contacts" ("id" integer NOT NULL PRIMARY KEY, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "name" text DEFAULT NULL, "message" text, "email" text);
CREATE TABLE IF NOT EXISTS "realreleases" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" text, "tracks" text, "year" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE IF NOT EXISTS "artists" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "name" text);
CREATE TABLE IF NOT EXISTS "users" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar DEFAULT '' NOT NULL, "user_name" varchar DEFAULT '' NOT NULL, "encrypted_password" varchar DEFAULT '' NOT NULL, "reset_password_token" varchar, "reset_password_sent_at" datetime, "remember_created_at" datetime, "sign_in_count" integer DEFAULT 0 NOT NULL, "current_sign_in_at" datetime, "last_sign_in_at" datetime, "current_sign_in_ip" varchar, "last_sign_in_ip" varchar, "confirmation_token" varchar, "confirmed_at" datetime, "confirmation_sent_at" datetime, "unconfirmed_email" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "index_users_on_user_name" ON "users" ("user_name");
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token");
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
('20190703141139'),
('20190704110506');


