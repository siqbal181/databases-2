TRUNCATE TABLE cohorts, students RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO cohorts (name, starting_date) VALUES ('March Cohort', '01/03/2023');
INSERT INTO cohorts (name, starting_date) VALUES ('April Cohort', '01/04/2023');
INSERT INTO cohorts (name, starting_date) VALUES ('May Cohort', '01/05/2023');

