TRUNCATE TABLE posts, users RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.
INSERT INTO users(email_address, user_name) VALUES('sidra@fake.com', 'sidra_fake');

INSERT INTO posts (title, content, number_of_views, user_id) VALUES ('My best post', 'Such a great read.', '100', '1');
INSERT INTO posts (title, content, number_of_views, user_id) VALUES ('Average post', 'Average words here.', '2000', '1');


INSERT INTO posts (title, content, number_of_views, user_id) VALUES ('Bang post', 'Bang average words here.', '200', '2');
INSERT INTO posts (title, content, number_of_views, user_id) VALUES ('Bang post 3', 'Bang average words here 3.', '1020', '4');