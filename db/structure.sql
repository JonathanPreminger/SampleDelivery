CREATE TABLE IF NOT EXISTS "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE IF NOT EXISTS "events" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "revenue_figure" integer, "total_charge_dj" integer, "charge_communication" integer, "charge_others" integer, "charge_others_description" text, "number_of_dj" integer, "line_up" text, "place" varchar, "name" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "benefits" varchar, "start" datetime);
CREATE TABLE sqlite_sequence(name,seq);
CREATE TABLE IF NOT EXISTS "contacts" ("id" integer NOT NULL PRIMARY KEY, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "name" text DEFAULT NULL, "message" text, "email" text);
CREATE TABLE IF NOT EXISTS "artists" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "name" text, "number" varchar);
CREATE TABLE IF NOT EXISTS "users" ("id" integer NOT NULL PRIMARY KEY, "email" varchar DEFAULT '' NOT NULL, "encrypted_password" varchar DEFAULT '' NOT NULL, "reset_password_token" varchar DEFAULT NULL, "reset_password_sent_at" datetime DEFAULT NULL, "remember_created_at" datetime DEFAULT NULL, "sign_in_count" integer DEFAULT 0 NOT NULL, "current_sign_in_at" datetime DEFAULT NULL, "last_sign_in_at" datetime DEFAULT NULL, "current_sign_in_ip" varchar DEFAULT NULL, "last_sign_in_ip" varchar DEFAULT NULL, "confirmation_token" varchar DEFAULT NULL, "confirmed_at" datetime DEFAULT NULL, "confirmation_sent_at" datetime DEFAULT NULL, "unconfirmed_email" varchar DEFAULT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token");
CREATE TABLE IF NOT EXISTS "realreleases" ("id" integer NOT NULL PRIMARY KEY, "name" text DEFAULT NULL, "year" text DEFAULT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "artist_id" integer DEFAULT NULL);
CREATE INDEX "index_realreleases_on_artist_id" ON "realreleases" ("artist_id");
CREATE TABLE IF NOT EXISTS "active_storage_blobs" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "key" varchar NOT NULL, "filename" varchar NOT NULL, "content_type" varchar, "metadata" text, "byte_size" bigint NOT NULL, "checksum" varchar NOT NULL, "created_at" datetime NOT NULL);
CREATE UNIQUE INDEX "index_active_storage_blobs_on_key" ON "active_storage_blobs" ("key");
CREATE TABLE IF NOT EXISTS "active_storage_attachments" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar NOT NULL, "record_type" varchar NOT NULL, "record_id" integer NOT NULL, "blob_id" integer NOT NULL, "created_at" datetime NOT NULL, CONSTRAINT "fk_rails_c3b3935057"
FOREIGN KEY ("blob_id")
  REFERENCES "active_storage_blobs" ("id")
);
CREATE INDEX "index_active_storage_attachments_on_blob_id" ON "active_storage_attachments" ("blob_id");
CREATE UNIQUE INDEX "index_active_storage_attachments_uniqueness" ON "active_storage_attachments" ("record_type", "record_id", "name", "blob_id");
CREATE TABLE IF NOT EXISTS "tracks" ("id" integer NOT NULL PRIMARY KEY, "name" text DEFAULT NULL, "duration" text DEFAULT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "realrelease_id" integer DEFAULT NULL);
CREATE INDEX "index_tracks_on_realrelease_id" ON "tracks" ("realrelease_id");
CREATE TABLE IF NOT EXISTS "articles" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar, "content" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE IF NOT EXISTS "djsets" ("id" integer NOT NULL PRIMARY KEY, "start" datetime DEFAULT NULL, "artist_id" integer DEFAULT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "club" text DEFAULT NULL, "confirmdjset" boolean);
CREATE INDEX "index_djsets_on_artist_id" ON "djsets" ("artist_id");
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
('20190704110506'),
('20190704143103'),
('20190704151516'),
('20190705100744'),
('20190705101937'),
('20190705102335'),
('20190706130135'),
('20190712044021'),
('20190807114049'),
('20190807114253'),
('20190812233902'),
('20190823152920'),
('20190826220005'),
('20190827001603'),
('20190827200900'),
('20190828102145'),
('20190828113606'),
('20190828113739'),
('20190904143232');


