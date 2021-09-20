-- SQL database modeling exercises
-- does not account for players getting traded, multiple referees at a single game

CREATE DATABASE soccer_league_db;

CREATE TABLE teams (
    id SERIAL PRIMARY KEY, 
    teamname VARCHAR(30) NOT NULL
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY, 
    ref_name VARCHAR(75) NOT NULL
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY, 
    player_name VARCHAR(75) NOT NULL,
    team_id INTEGER REFERENCES teams(id) ON DELETE SET NULL
);

CREATE TABLE seasons (
    id SERIAL PRIMARY KEY, 
    season_start_date DATE NOT NULL,
    season_end_date DATE NOT NULL
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY, 
    match_date DATE NOT NULL,
    match_location TEXT NOT NULL,
    home_team INTEGER REFERENCES teams(id),
    away_team INTEGER REFERENCES teams(id),
    referee_id INTEGER REFERENCES referees(id)
);

CREATE TABLE goals_scored (
    id SERIAL PRIMARY KEY, 
    match_id INTEGER REFERENCES matches(id),
    player_id INTEGER REFERENCES players(id)
);

INSERT INTO teams (teamname) 
  VALUES 
  ('Young Hearts'),
  ('Kickers'),
  ('Air Benders')
  ;

INSERT INTO referees (ref_name) 
  VALUES 
  ('Sally Mae'),
  ('Freddie Mac')
  ;

INSERT INTO players (player_name, team_id) 
  VALUES 
  ('Fred', 1),
  ('Watson', 1),
  ('Matty', 1),
  ('Steve', 2),
  ('Bart', 3)
  ;


INSERT INTO seasons (season_start_date, season_end_date) 
  VALUES 
  ('2021-04-01', '2021-10-31'),
  ('2019-04-01', '2019-10-31')
  ;


INSERT INTO matches (match_date, match_location, home_team, away_team, referee_id) 
  VALUES 
  ('2021-04-20', 'waterford', 1, 2, 2),
  ('2021-05-01', 'waterford', 1, 3, 1),
  ('2021-06-15', 'springfield', 3, 2, 2)
  ;

-- how to check if the player_id/team_id is a valid player in the match before adding the goal?
INSERT INTO goals_scored (match_id, player_id) 
  VALUES 
  (1, 1),
  (1, 3), 
  (1, 4),
  (2, 1), 
  (2, 1),
  (2, 5),
  (3, 5),
  (3, 5),
  (3, 5)
  ;