-- SQL database modeling exercises

CREATE DATABASE craigslist_db;

CREATE TABLE regions (
    id SERIAL PRIMARY KEY, 
    region TEXT NOT NULL
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    category TEXT NOT NULL
); 

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username TEXT NOT NULL,
    preferred_region INTEGER REFERENCES regions(id) ON DELETE SET NULL
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title VARCHAR(40) NOT NULL, 
    post_description TEXT NOT NULL,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    location_posted TEXT NOT NULL,
    region_posted INTEGER REFERENCES regions(id) ON DELETE SET NULL,
    category INTEGER REFERENCES categories(id) ON DELETE SET NULL
); 

INSERT INTO regions (region) 
  VALUES 
  ('New York'),
  ('Philadelphia'),
  ('Washington DC'),
  ('Boston'),
  ('Baltimore')
  ;

  INSERT INTO categories (category) 
  VALUES 
  ('Jobs'),
  ('Housing'),
  ('For Sale'),
  ('Free Stuff')
  ;

INSERT INTO users (username, preferred_region) 
  VALUES 
  ('username1', 1),
  ('someoneElse35', 3),
  ('Steve_Stevenson', 4),
  ('PersonWhoSellsStuff', 5),
  ('someoneImportant', 2)
  ;

  INSERT INTO posts (title, post_description, user_id, location_posted, region_posted, category) 
  VALUES 
  ('Thing For Sale', 'Buy this thing, contact me for details', 4, 'inner harbor', 5, 3),
  ('Free Furniture', 'Moving, come take this furniture away! Saturday', 1, 'Brooklyn', 1, 4)
  ;