TRUNCATE TABLE users, posts RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (email_address, user_name) VALUES ('sally@fake.com', 'sally_fake');
INSERT INTO users (email_address, user_name) VALUES ('anna@fake.com', 'anna_fake');