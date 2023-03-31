TRUNCATE TABLE posts, tags, post_tags RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO posts (title) VALUES ('How to not cry in life.');
-- INTO ROW 8

INSERT INTO tags (name) VALUES ('lifestyle');
-- INTO ROW 5

INSERT INTO post_tags (post_id, tag_id) VALUES (8, 5);