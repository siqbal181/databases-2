# Two Tables Design Recipe Template

_Copy this recipe template to design and create two related database tables from a specification._

## 1. Extract nouns from the user stories or specification

```
# EXAMPLE USER STORY:
# (analyse only the relevant part - here the final line).

As a music lover,
So I can organise my concerts,
I want to record a list of all scheduled concerts
With their artist name, concert date and venue

As a music promoter,
So I can organise concerts,
I want to store the name and capacity for each venue

As a music promoter,
So I can organise concerts,
I want to be able to list all concerts at a given venue
```

```
Nouns:

scheudled concerts, artist name, concert date, venue, 
venue name, venue capacity

```

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| Record                | Properties          |
| --------------------- | ------------------  |
| venues                | name, capacity,
| concerts              | scheduled_date, artist_name

1. Name of the first table (always plural): `concerts` 

    Column names: `artist_name`, `scheduled_date`

2. Name of the second table (always plural): `venues` 

    Column names: `name`, `capacity`

## 3. Decide the column types.

[Here's a full documentation of PostgreSQL data types](https://www.postgresql.org/docs/current/datatype.html).

Most of the time, you'll need either `text`, `int`, `bigint`, `numeric`, or `boolean`. If you're in doubt, do some research or ask your peers.

Remember to **always** have the primary key `id` as a first column. Its type will always be `SERIAL`.

```
# EXAMPLE:

Table: concerts
id SERIAL
artist_name text
scheduled_date timestamp

Table: venues
id SERIAL
name text
capacity int
```

## 4. Decide on The Tables Relationship

Most of the time, you'll be using a **one-to-many** relationship, and will need a **foreign key** on one of the two tables.

To decide on which one, answer these two questions:

1. Can one concert have many venues? NO
2. Can one venue have many concerts? YES

```
# EXAMPLE

1. Can one concert have many venues? NO
2. Can one venue have many concerts? YES

Venue -> one to many -> Concert
Concert -> many to one -> Venue

-> Therefore, the foreign key is on the concerts table. - 'venue_id'
```

## 4. Write the SQL.

```sql
-- EXAMPLE
-- file: albums_table.sql

-- Replace the table name, columm names and types.

-- Create the table without the foreign key first.
CREATE TABLE venues (
  id SERIAL PRIMARY KEY,
  name text,
  capacity int
);

-- Then the table with the foreign key first.
CREATE TABLE concerts (
  id SERIAL PRIMARY KEY,
  artist_name text,
  scheduled_date timestamp,
-- The foreign key name is always {other_table_singular}_id
  venue_id int,
  constraint fk_venue foreign key(venue_id)
    references venues(id)
);

```

## 5. Create the tables.

```bash
psql -h 127.0.0.1 database_name < albums_table.sql
```

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->