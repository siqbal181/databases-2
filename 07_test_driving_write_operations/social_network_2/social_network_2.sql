-- -------------------------------------------------------------
-- TablePlus 5.3.5(494)
--
-- https://tableplus.com/
--
-- Database: social_network_2
-- Generation Time: 2023-03-29 19:22:41.2010
-- -------------------------------------------------------------


-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS posts_id_seq;

-- Table Definition
CREATE TABLE "public"."posts" (
    "id" int4 NOT NULL DEFAULT nextval('posts_id_seq'::regclass),
    "title" text,
    "content" text,
    "number_of_views" int4,
    "user_id" int4,
    PRIMARY KEY ("id")
);

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

INSERT INTO "public"."posts" ("id", "title", "content", "number_of_views", "user_id") VALUES
(1, 'Post 1', 'Such a great read.', 100, 1),
(2, 'Post 2', 'Such a great read 2.', 200, 2),
(3, 'best post', 'Such a great read 3.', 300, 2),
(4, 'My best post 2', 'Such a great read 4.', 400, 3),
(5, 'My best post 3', 'Such a great read 5.', 500, 4);

INSERT INTO "public"."users" ("id", "email_address", "user_name") VALUES
(1, 'sally@fake.com', 'sally_fake'),
(2, 'anna@fake.com', 'anna_fake'),
(3, 'robert@fake.com', 'rob_fake'),
(4, 'tina@fake.com', 'tina_fake'),
(5, 'alice@fake.com', 'alice_fake'),
(6, 'tiffany@fake.com', 'tiff_fake'),
(7, 'amy@fake.com', 'amy_fake');

ALTER TABLE "public"."posts" ADD FOREIGN KEY ("user_id") REFERENCES "public"."users"("id") ON DELETE CASCADE;
