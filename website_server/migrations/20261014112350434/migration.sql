BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "helphub_borrowable_item" (
    "id" bigserial PRIMARY KEY,
    "title" text NOT NULL,
    "description" text NOT NULL,
    "category" text NOT NULL,
    "ownerUserId" bigint NOT NULL,
    "ownerEmail" text NOT NULL,
    "depositRequired" text,
    "neighborhoodZone" text NOT NULL,
    "isAvailable" boolean NOT NULL,
    "borrowedByEmail" text,
    "createdAt" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "helphub_volunteer_event" (
    "id" bigserial PRIMARY KEY,
    "title" text NOT NULL,
    "description" text NOT NULL,
    "organizerEmail" text NOT NULL,
    "eventDate" text NOT NULL,
    "location" text NOT NULL,
    "neighborhoodZone" text NOT NULL,
    "volunteersCount" bigint NOT NULL,
    "volunteersList" text,
    "pointsReward" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);


--
-- MIGRATION VERSION FOR website
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('website', '20261014112350434', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20261014112350434', "timestamp" = now();

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
