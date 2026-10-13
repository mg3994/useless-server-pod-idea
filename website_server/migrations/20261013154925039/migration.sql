BEGIN;

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
    "creatorUserId" bigint NOT NULL,
    "creatorEmail" text NOT NULL,
    "helperUserId" bigint,
    "helperEmail" text,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "request_comment" (
    "id" bigserial PRIMARY KEY,
    "requestId" bigint NOT NULL,
    "authorUserId" bigint NOT NULL,
    "authorEmail" text NOT NULL,
    "content" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "request_rating" (
    "id" bigserial PRIMARY KEY,
    "requestId" bigint NOT NULL,
    "fromUserId" bigint NOT NULL,
    "toUserId" bigint NOT NULL,
    "rating" bigint NOT NULL,
    "feedback" text,
    "createdAt" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "user_profile" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "email" text NOT NULL,
    "displayName" text NOT NULL,
    "points" bigint NOT NULL,
    "completedCount" bigint NOT NULL,
    "requestedCount" bigint NOT NULL,
    "avatarBadge" text NOT NULL
);


--
-- MIGRATION VERSION FOR website
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('website', '20261013154925039', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20261013154925039', "timestamp" = now();

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
