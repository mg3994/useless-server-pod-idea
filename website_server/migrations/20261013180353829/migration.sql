BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "user_notification" (
    "id" bigserial PRIMARY KEY,
    "recipientEmail" text NOT NULL,
    "title" text NOT NULL,
    "message" text NOT NULL,
    "requestId" bigint,
    "isRead" boolean NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

--
-- ACTION ALTER TABLE
--
ALTER TABLE "user_profile" ADD COLUMN "ratingAverage" double precision;
ALTER TABLE "user_profile" ADD COLUMN "ratingCount" bigint;
ALTER TABLE "user_profile" ADD COLUMN "skills" text;

--
-- MIGRATION VERSION FOR website
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('website', '20261013180353829', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20261013180353829', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20260824182259319', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260824182259319', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_idp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_idp', '20260924105404509', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260924105404509', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_core
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_core', '20260924105232991', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260924105232991', "timestamp" = now();


COMMIT;
