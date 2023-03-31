TRUNCATE TABLE posts_tags, posts, tags RESTART IDENTITY;

INSERT INTO tags (name) VALUES ('coding') ON CONFLICT DO NOTHING;

INSERT INTO posts (title) VALUES ('How to not code.') ON CONFLICT DO NOTHING;

INSERT INTO posts_tags (post_id, tag_id) 
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.title = 'How to not code.' AND t.name = 'coding'
  ON CONFLICT DO NOTHING;

-- INSERT INTO tags (name) VALUES ('hiking') ON CONFLICT DO NOTHING;

-- INSERT INTO posts (title) VALUES ('Hike for life.') ON CONFLICT DO NOTHING;

-- INSERT INTO posts_tags (post_id, tag_id) 
--   SELECT p.id, t.id FROM posts p, tags t
--   WHERE p.title = 'Hike for life.' AND t.name = 'hiking'
--   ON CONFLICT DO NOTHING;


-- INSERT INTO posts (title) VALUES ('Coding for dummies.') ON CONFLICT DO NOTHING;

-- INSERT INTO posts_tags (post_id, tag_id) 
--   SELECT p.id, t.id FROM posts p, tags t
--   WHERE p.title = 'Coding for dummies.' AND t.name = 'coding'
--   ON CONFLICT DO NOTHING;
