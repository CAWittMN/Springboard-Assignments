DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE  TABLE categories ( 
	id                   SERIAL  NOT NULL  ,
	title                text  NOT NULL  ,
	item_or_service      text  NOT NULL  ,
	CONSTRAINT pk_categories_0 PRIMARY KEY ( id )
 );

CREATE  TABLE regions ( 
	id                   SERIAL  NOT NULL  ,
	country              text  NOT NULL  ,
	state_or_providence   text  NOT NULL  ,
	county               text    ,
	city                 text  NOT NULL  ,
	zipcode              integer  NOT NULL  ,
	CONSTRAINT pk_categories PRIMARY KEY ( id )
 );

CREATE  TABLE users ( 
	id                   SERIAL  NOT NULL  ,
	name                 varchar(100)  NOT NULL  ,
	pref_region_id       integer  NOT NULL  ,
	email                varchar(100)  NOT NULL  ,
	CONSTRAINT pk_users PRIMARY KEY ( id ),
	CONSTRAINT fk_users_categories FOREIGN KEY ( pref_region_id ) REFERENCES regions( id )   
 );

CREATE  TABLE posts ( 
	id                   SERIAL  NOT NULL  ,
	post_title           varchar(50)  NOT NULL  ,
	description          varchar(500)  NOT NULL  ,
	user_id              integer  NOT NULL  ,
	region_id            integer  NOT NULL  ,
	category_id          integer  NOT NULL  ,
	CONSTRAINT pk_posts PRIMARY KEY ( id ),
	CONSTRAINT fk_posts_users FOREIGN KEY ( user_id ) REFERENCES users( id ) ON DELETE CASCADE ON UPDATE CASCADE ,
	CONSTRAINT fk_posts_categories FOREIGN KEY ( region_id ) REFERENCES regions( id ) ON DELETE CASCADE ON UPDATE CASCADE ,
	CONSTRAINT fk_posts_categories_0 FOREIGN KEY ( category_id ) REFERENCES categories( id ) ON DELETE CASCADE ON UPDATE CASCADE 
 );