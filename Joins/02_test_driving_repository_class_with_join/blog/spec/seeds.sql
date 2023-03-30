TRUNCATE TABLE posts, comments RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO posts (title, contents) VALUES ('My first blog', 'This is a fun blog');
INSERT INTO posts (title, contents) VALUES ('What I learned at Makers', 'How to use Google');

INSERT INTO comments (title, contents, user_name, posts_id) VALUES ('What I learned at Makers', 'How to use Google', 'dave', 1);
INSERT INTO comments (title, contents, user_name, posts_id) VALUES ('Complaint', 'You can''t spell', 'bob', 2);