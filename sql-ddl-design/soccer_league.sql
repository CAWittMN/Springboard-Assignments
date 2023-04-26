DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league;

CREATE  TABLE refs ( 
	id                   SERIAL  NOT NULL  ,
	first_name           varchar(100)  NOT NULL  ,
	last_name            varchar(100)  NOT NULL  ,
	CONSTRAINT pk_refs PRIMARY KEY ( id )
 );

CREATE  TABLE teams ( 
	id                   SERIAL  NOT NULL  ,
	title                varchar(100)  NOT NULL  ,
	school_name          varchar(100)  NOT NULL  ,
	CONSTRAINT pk_teams PRIMARY KEY ( id )
 );

CREATE  TABLE matches ( 
	id                   SERIAL  NOT NULL  ,
	match_date           date  NOT NULL  ,
	home_team_id         integer  NOT NULL  ,
	away_team_id         integer  NOT NULL  ,
	ref_id               integer  NOT NULL  ,
	winning_team_id      integer  NOT NULL  ,
	CONSTRAINT pk_matches PRIMARY KEY ( id ),
	CONSTRAINT fk_matches_teams FOREIGN KEY ( home_team_id ) REFERENCES teams( id ) ON DELETE CASCADE  ,
	CONSTRAINT fk_matches_teams_0 FOREIGN KEY ( away_team_id ) REFERENCES teams( id ) ON DELETE CASCADE  ,
	CONSTRAINT fk_matches_teams_1 FOREIGN KEY ( winning_team_id ) REFERENCES teams( id ) ON DELETE CASCADE  ,
	CONSTRAINT fk_matches_refs FOREIGN KEY ( ref_id ) REFERENCES refs( id ) ON DELETE CASCADE  
 );

CREATE  TABLE players ( 
	id                   SERIAL  NOT NULL  ,
	first_name           varchar(100)  NOT NULL  ,
	last_name            varchar(100)  NOT NULL  ,
	date_of_birth        date  NOT NULL  ,
	team_id              integer  NOT NULL  ,
	CONSTRAINT pk_players PRIMARY KEY ( id ),
	CONSTRAINT fk_players_teams FOREIGN KEY ( team_id ) REFERENCES teams( id )   
 );

CREATE  TABLE goals ( 
	id                   SERIAL  NOT NULL  ,
	player_id            integer  NOT NULL  ,
	match_id             integer  NOT NULL  ,
	CONSTRAINT pk_goals PRIMARY KEY ( id ),
	CONSTRAINT fk_goals_players FOREIGN KEY ( player_id ) REFERENCES players( id ) ON DELETE CASCADE  ,
	CONSTRAINT fk_goals_matches FOREIGN KEY ( match_id ) REFERENCES matches( id ) ON DELETE CASCADE  
 );

INSERT INTO teams
(title, school_name)

VALUES
('Red Rockets', 'Dogwood High'),
('Duckies', 'Big Lake High'),
('Toilet Snakes', 'Plumber High'),
('Munchies', 'Four Twenty High'),
('Gundams', 'Anaheim High'),
('Excuses', 'Lazy High');

INSERT INTO players

(first_name, last_name, date_of_birth, team_id)

VALUES
('Max', 'Amillion', '2006-11-11', 1),
('Duke', 'Hazard', '2006-08-12', 1),
('Leo', 'Lion', '2006-09-05', 1),
('Finn', 'Fisher', '2006-03-04', 1),
('Tucker', 'Dog', '1932-01-23', 1),
('Aflac', 'Surance', '2006-09-23', 2),
('Daffy', 'Duck', '1937-04-17', 2),
('Crazy', 'Quackers', '2005-12-25', 2),
('Bill', 'Orange', '2006-04-10', 2),
('Mallory', 'The Mallard', '2005-05-05', 2),
('Doc', 'Brown', '2005-11-20', 3),
('Floater', 'Top', '2004-10-22', 3),
('Mark', 'Skid', '2006-02-13', 3),
('Crap', 'Bag', '2004-03-22', 3),
('Dude', 'Bro', '2006-04-20', 4),
('What', 'Huh', '2006-04-20', 4),
('Shower', 'Thoughts', '2006-04-20', 4),
('Blaze', 'It', '2006-04-20', 4),
('Blunt', 'Doobie', '2006-04-20', 4),
('Char', 'Aznable', '1989-02-21', 5),
('Amuro', 'Ray', '1979-11-29', 5),
('Heero', 'Yuy', '1999-03-04', 5),
('Trowa', 'Barton', '2005-03-12', 5),
('Optimus', 'Prime', '1999-10-21', 5),
('Blah', 'Blah', '2000-01-01', 6),
('Aoierggp', 'Oldfao', '2000-01-01', 6),
('Odfjaheiuf', 'Adlfsodgi', '2000-01-01', 6),
('Teaifefoa', 'Paoefih', '2000-01-01', 6),
('Hflakgao', 'Ifaogdopgia', '2000-01-01', 6);

INSERT INTO refs
(first_name, last_name)

VALUES
('Henry', 'Refone'),
('Harvey', 'Reftwo'),
('Clyde', 'Refthree'),
('Barry', 'Notaref');

INSERT INTO matches
(match_date, home_team_id, away_team_id, ref_id, winning_team_id)

VALUES
('2023-01-01', 1, 6, 1, 1),
('2023-02-01', 2, 5, 2, 5),
('2023-03-01', 3, 4, 3, 4),
('2023-04-01', 5, 1, 4, 5),
('2023-06-01', 1, 5, 3, 5),
('2023-05-01', 4, 5, 2, 5);