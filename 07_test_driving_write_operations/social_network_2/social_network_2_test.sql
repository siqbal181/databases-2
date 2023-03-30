-- -------------------------------------------------------------
-- TablePlus 5.3.5(494)
--
-- https://tableplus.com/
--
-- Database: social_network_2_test
-- Generation Time: 2023-03-30 10:24:22.0600
-- -------------------------------------------------------------


-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS users_id_seq;

-- Table Definition
CREATE TABLE "public"."users" (
    "id" int4 NOT NULL DEFAULT nextval('users_id_seq'::regclass),
    "email_address" varchar,
    "user_name" varchar,
    PRIMARY KEY ("id")
);

INSERT INTO "public"."users" ("id", "email_address", "user_name") VALUES
(48, 'sidra@fake.com', 'sidra_fake');
