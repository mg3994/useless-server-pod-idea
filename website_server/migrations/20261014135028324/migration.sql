BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "carpool_ride" (
    "id" bigserial PRIMARY KEY,
    "driverEmail" text NOT NULL,
    "origin" text NOT NULL,
    "destination" text NOT NULL,
    "departureTime" text NOT NULL,
    "availableSeats" bigint NOT NULL,
    "contributionPoints" bigint NOT NULL,
    "neighborhoodZone" text NOT NULL,
    "notes" text,
    "passengerEmails" text,
    "isCompleted" boolean NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "lost_found_item" (
    "id" bigserial PRIMARY KEY,
    "title" text NOT NULL,
    "description" text NOT NULL,
    "category" text NOT NULL,
    "status" text NOT NULL,
    "location" text NOT NULL,
    "neighborhoodZone" text NOT NULL,
    "reporterEmail" text NOT NULL,
    "claimedByEmail" text,
    "isResolved" boolean NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);


--
-- MIGRATION VERSION FOR website
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('website', '20261014135028324', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20261014135028324', "timestamp" = now();

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
