# Two Tables Design Recipe Template

_Copy this recipe template to design and create two related database tables from a specification._

## 1. Extract nouns from the user stories or specification

```
# EXAMPLE USER STORY:
# (analyse only the relevant part - here the final line).

As a blogger
So I can write interesting stuff
I want to write posts having a title.

As a blogger
So I can write interesting stuff
I want to write posts having a content.

As a blogger
So I can let people comment on interesting stuff
I want to allow comments on my posts.

As a blogger
So I can let people comment on interesting stuff
I want the comments to have a content.

As a blogger
So I can let people comment on interesting stuff
I want the author to include their name in comments.
```

```
Nouns:
posts, post_title, post_content
comments, post_comments, comments_content, comment_owner

```

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| Record                | Properties          |
| --------------------- | ------------------  |
| posts                 | title, content,
| comments              | content, user_name

1. Name of the first table (always plural): `posts` 

    Column names: `title`, `contents`

2. Name of the second table (always plural): `comments` 

    Column names: `content`, `user_name`

## 3. Decide the column types.

[Here's a full documentation of PostgreSQL data types](https://www.postgresql.org/docs/current/datatype.html).

Most of the time, you'll need either `text`, `int`, `bigint`, `numeric`, or `boolean`. If you're in doubt, do some research or ask your peers.

Remember to **always** have the primary key `id` as a first column. Its type will always be `SERIAL`.

```
# EXAMPLE:

Table: posts
id SERIAL
title text
contents text

Table: comments
id SERIAL
content text
user_name text
```

## 4. Decide on The Tables Relationship

Most of the time, you'll be using a **one-to-many** relationship, and will need a **foreign key** on one of the two tables.

```
# EXAMPLE

1. Can one post have many comments? YES
2. Can one comment have many posts? NO

Post -> one to many -> Comments
Comment -> many to one -> Post

-> Therefore, the foreign key is on the posts table. - 'comment_id'

-- WHICHEVER ONE IS ON THE ONE SIDE HAS THE ID (POST ID)
```

## 4. Write the SQL.

```sql

-- Create the table without the foreign key first.
CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title text,
    contents text
);

-- Then the table with the foreign key first.
CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    title text,
    contents text,
    user_name text

-- The foreign key name is always {other_table_singular}_id
  posts_id int,
  constraint fk_posts foreign key(posts_id) references posts(id) 
  on delete cascade 
);

```

## 5. Create the tables.

```bash
psql -h 127.0.0.1 database_name < albums_table.sql
```

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->