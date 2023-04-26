-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space
CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE suns
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  galaxy_id INTEGER NOT NULL REFERENCES galaxies (id) ON DELETE CASCADE
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  sun_id INTEGER NOT NULL REFERENCES suns (id) ON DELETE CASCADE
);


CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_days FLOAT NOT NULL,
  planet_id INTEGER NOT NULL REFERENCES planets (id) ON DELETE CASCADE
);
