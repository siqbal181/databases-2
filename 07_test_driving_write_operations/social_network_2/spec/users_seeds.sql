TRUNCATE TABLE users, posts RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (id, email_address, user_name) VALUES ('1', 'sally@fake.com', 'sally_fake');
INSERT INTO users (id, email_address, user_name) VALUES ('2', 'anna@fake.com', 'anna_fake');