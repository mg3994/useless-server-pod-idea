BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "favor_chat_message" (
    "id" bigserial PRIMARY KEY,
    "requestId" bigint NOT NULL,
    "senderUserId" bigint NOT NULL,
    "senderEmail" text NOT NULL,
    "message" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

--
-- ACTION ALTER TABLE
--
ALTER TABLE "help_request" ADD COLUMN "completionProofNote" text;

--
-- MIGRATION VERSION FOR website
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('website', '20261014052539109', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20261014052539109', "timestamp" = now();

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
