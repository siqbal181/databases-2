-- -------------------------------------------------------------
-- TablePlus 5.3.5(494)
--
-- https://tableplus.com/
--
-- Database: recipes
-- Generation Time: 2023-03-28 15:02:33.0290
-- -------------------------------------------------------------


-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS recipes_id_seq;

-- Table Definition
CREATE TABLE "public"."recipes" (
    "id" int4 NOT NULL DEFAULT nextval('recipes_id_seq'::regclass),
    "name" text,
    "average_cooking_time" text,
    "rating" int4,
    PRIMARY KEY ("id")
);

INSERT INTO "public"."recipes" ("id", "name", "average_cooking_time", "rating") VALUES
(1, 'Sticky Toffee Pudding', '40', 5),
(2, 'Stir Fry', '25', 2),
(3, 'Lamb Koftes', '35', 4),
(4, 'Toffee', '15', 1);
