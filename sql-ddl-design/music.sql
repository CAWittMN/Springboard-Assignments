-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  release_date DATE NOT NULL
);

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL
);

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  genre TEXT NOT NULL
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  album_id INTEGER NOT NULL REFERENCES albums (id)
);


CREATE TABLE songs_artists
(
  song_id INTEGER NOT NULL REFERENCES songs (id) ON DELETE CASCADE,
  artist_id INTEGER NOT NULL REFERENCES artists (id) ON DELETE CASCADE
);



CREATE TABLE songs_producers
(
  song_id INTEGER NOT NULL REFERENCES songs (id),
  producer_id INTEGER NOT NULL REFERENCES producers (id)
);


INSERT INTO albums
(title, release_date)
VALUES
('Middle of Nowhere', '04-15-1997'),
('A Night at the Opera', '10-31-1975'),
('Daydream', '11-14-1995'),
('A Star Is Born', '09-27-2018'),
('Silver Side Up', '08-21-2001'),
('The Blueprint 3', '10-20-2009'),
('Prism', '12-17-2013'),
('Hands All Over', '06-21-2011'),
('Let Go', '05-14-2002'),
('The Writing''s on the Wall', '11-07-1999');

INSERT INTO producers
  (title)
VALUES
  ('Dust Brothers'),
  ('Stephen Lironi'),
  ('Roy Thomas Baker'),
  ('Walter Afanasieff'), 
  ('Benjamin Rice'),
  ('Rick Parashar'),
  ('Al Shux'),
  ('Max Martin'),
  ('Cirkut'),
  ('Shellback'),
  ('Benny Blanco'),
  ('The Matrix'),
  ('Darkchild');

INSERT INTO songs
  (title, duration_in_seconds, album_id)
VALUES
  ('MMMBop', 238, 1),
  ('Bohemian Rhapsody', 355, 2),
  ('One Sweet Day', 282, 3),
  ('Shallow', 216, 4),
  ('How You Remind Me', 223, 5),
  ('New York State of Mind', 276, 6),
  ('Dark Horse', 215, 7),
  ('Moves Like Jagger', 201, 8),
  ('Complicated', 244, 9),
  ('Say My Name', 240, 10);

INSERT INTO artists
  (name, genre)
VALUES
  ('Hanson', 'Pop Rock'),
  ('Queen', 'Progressive Rock'),
  ('Mariah Cary', 'Pop'),
  ('Boyz II Men', 'R&B'),
  ('Lady Gaga', 'Pop'),
  ('Bradley Cooper', 'Folk Pop'),
  ('Nickelback', 'Post Grunge'),
  ('Jay Z', 'Hip-hop'),
  ('Alicia Keys', 'Pop'),
  ('Katy Perry', 'Pop'),
  ('Juicy J', 'Hip-hop'),
  ('Maroon 5', 'Pop'),
  ('Christina Aguilera', 'Pop'),
  ('Avril Lavigne', 'Pop Punk'),
  ('Destiny''s Child', 'R&B');

  INSERT INTO songs_artists
    (song_id, artist_id)
  VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (3, 4),
    (4, 5),
    (4, 6),
    (5, 7),
    (6, 8),
    (6, 9),
    (7, 10),
    (7, 11),
    (8, 12),
    (8, 13),
    (9, 14),
    (10, 15);




INSERT INTO songs_producers
  (song_id, producer_id)
VALUES
  (1, 1),
  (1, 2),
  (2, 3),
  (3, 4),
  (4, 5),
  (5, 6),
  (6, 7),
  (7, 8),
  (7, 9),
  (8, 10),
  (8, 11),
  (9, 12),
  (10, 13);
  









 SELECT s.title, duration_in_seconds as duration, a.title as album, ar.name as artist 
 FROM songs s 
 FULL JOIN albums a ON s.album_id = a.id 
 FULL JOIN songs_artists sa  ON s.id = sa.song_id 
 FULL JOIN artists ar ON sa.artist_id = ar.id;