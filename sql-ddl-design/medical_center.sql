DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE  TABLE doctors ( 
	id                   serial  NOT NULL  ,
	first_name           varchar(100)  NOT NULL  ,
	last_name            varchar(100)  NOT NULL  ,
	gender               text    ,
	date_of_birth        date    ,
	specialty            text    ,
	phone_number         text    ,
	email                text  NOT NULL  ,
	CONSTRAINT pk_doctors PRIMARY KEY ( id )
 );

CREATE  TABLE patients ( 
	id                   serial  NOT NULL  ,
	first_name           varchar(100)  NOT NULL  ,
	last_name            varchar(100)  NOT NULL  ,
	date_of_birth        date  NOT NULL  ,
	gender               text    ,
	email                text    ,
	phone_number         text  NOT NULL  ,
	address              varchar(100)  NOT NULL  ,
	emergency_contact_id integer    ,
	insurance            varchar    ,
	primary_doctor_id    integer    ,
	CONSTRAINT pk_patients PRIMARY KEY ( id ),
	CONSTRAINT unq_patients_emergency_contact_id UNIQUE ( emergency_contact_id ) ,
	CONSTRAINT fk_patients_doctors FOREIGN KEY ( primary_doctor_id ) REFERENCES doctors( id )   
 );

CREATE  TABLE perscriptions ( 
	id                   serial  NOT NULL  ,
	patient_id           integer  NOT NULL  ,
	doctor_id            integer  NOT NULL  ,
	medication_code      integer  NOT NULL  ,
	"date"               date  NOT NULL  ,
	pharmacy             date  NOT NULL  ,
	CONSTRAINT pk_perscriptions PRIMARY KEY ( id ),
	CONSTRAINT fk_perscriptions_patients FOREIGN KEY ( patient_id ) REFERENCES patients( id ) ON DELETE CASCADE  ,
	CONSTRAINT fk_perscriptions_doctors FOREIGN KEY ( doctor_id ) REFERENCES doctors( id ) ON DELETE CASCADE ON UPDATE CASCADE 
 );

CREATE  TABLE visits ( 
	id                   serial  NOT NULL  ,
	patient_id           integer  NOT NULL  ,
	doctor_id            integer  NOT NULL  ,
	"date"               timestamp  NOT NULL  ,
	time_length          time    ,
	CONSTRAINT pk_visits PRIMARY KEY ( id ),
	CONSTRAINT fk_visits_patients FOREIGN KEY ( patient_id ) REFERENCES patients( id ) ON DELETE CASCADE ON UPDATE CASCADE ,
	CONSTRAINT fk_visits_doctors FOREIGN KEY ( doctor_id ) REFERENCES doctors( id ) ON DELETE CASCADE ON UPDATE CASCADE 
 );

CREATE  TABLE diagnoses ( 
	id                   serial  NOT NULL  ,
	patient_id           integer  NOT NULL  ,
	doctor_id            integer  NOT NULL  ,
	icd_code             varchar    ,
	visit_id             integer    ,
	CONSTRAINT pk_diagnoses PRIMARY KEY ( id ),
	CONSTRAINT fk_diagnoses_patients FOREIGN KEY ( patient_id ) REFERENCES patients( id ) ON DELETE CASCADE ON UPDATE CASCADE ,
	CONSTRAINT fk_diagnoses_doctors FOREIGN KEY ( doctor_id ) REFERENCES doctors( id ) ON DELETE CASCADE ON UPDATE CASCADE ,
	CONSTRAINT fk_diagnoses_visits FOREIGN KEY ( visit_id ) REFERENCES visits( id )   
 );

CREATE  TABLE emergency_contacts ( 
	id                   serial  NOT NULL  ,
	first_name           varchar(100)  NOT NULL  ,
	last_name            varchar(100)  NOT NULL  ,
	phone_number         text  NOT NULL  ,
	email                text    ,
	address              varchar(100)    ,
	relation             varchar    ,
	CONSTRAINT pk_emergency_contacts PRIMARY KEY ( id ),
	CONSTRAINT fk_emergency_contacts_patients FOREIGN KEY ( id ) REFERENCES patients( emergency_contact_id ) ON DELETE CASCADE ON UPDATE CASCADE 
 );
