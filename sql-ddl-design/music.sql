-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists (
  id SERIAL PRIMARY KEY,
  artists TEXT[] NOT NULL,
)

CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  album TEXT NOT NULL,
  artist INTEGER REFERENCES artists(id) NOT NULL
  producers TEXT[] NOT NULL,
  release_date DATE NOT NULL,
)

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  artists INTEGER REFERENCES artists(id) NOT NULL,
  album INTEGER REFERENCES albums(id) NOT NULL,
);


INSERT INTO artists (artists)
  VALUES 
    ('{"Hanson"}'),
    ('{"Queen"}'),
    ('{"Mariah Cary", "Boyz II Men"}'),
    ('{"Lady Gaga", "Bradley Cooper"}'),
    ('{"Nickelback"}'),
    ('{"Jay Z", "Alicia Keys"}'),
    ('{"Katy Perry", "Juicy J"}'),
    ('{"Maroon 5", "Christina Aguilera"}'),
    ('{"Avril Lavigne"}'),
    ('{"Destiny''s Child"}')
    ;

INSERT INTO albums (release_date, artist, album, producers
  VALUES 
  ('04-15-1997', 1, 'Middle of Nowhere', '{"Dust Brothers", "Stephen Lironi"}'),
  ('10-31-1975', 2, 'A Night at the Opera', '{"Roy Thomas Baker"}'),
  ('11-14-1995', 3, 'Daydream', '{"Walter Afanasieff"}'),
  ('09-27-2018', 4, 'A Star Is Born', '{"Benjamin Rice"}'),
  ('08-21-2001', 5, 'Silver Side Up', '{"Rick Parashar"}'),
  ('10-20-2009', 6, 'The Blueprint 3', '{"Al Shux"}'),
  ('12-17-2013', 7, 'Prism', '{"Max Martin", "Cirkut"}'),
  ('06-21-2011', 8, 'Hands All Over', '{"Shellback", "Benny Blanco"}'),
  ('05-14-2002', 9, 'Let Go', '{"The Matrix"}')
  ('11-07-1999', 10, 'The Writing''s on the Wall', '{"Darkchild"}')
  ;



INSERT INTO songs
  (title, duration_in_seconds, album)
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

