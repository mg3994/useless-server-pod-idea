BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "help_request" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "help_request" (
    "id" bigserial PRIMARY KEY,
    "title" text NOT NULL,
    "description" text NOT NULL,
    "category" text NOT NULL,
    "location" text NOT NULL,
    "urgency" text NOT NULL,
    "status" text NOT NULL,
    "rewardPoints" bigint NOT NULL,
    "isEmergency" boolean NOT NULL,
    "creatorUserId" bigint NOT NULL,
    "creatorEmail" text NOT NULL,
    "helperUserId" bigint,
    "helperEmail" text,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone
);


--
-- MIGRATION VERSION FOR website
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('website', '20261013163347379', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20261013163347379', "timestamp" = now();

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
