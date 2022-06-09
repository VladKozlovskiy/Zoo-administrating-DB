--1) Создание таблиц

CREATE SCHEMA IF NOT EXISTS Zoo;

--DROP SCHEMA Zoo cascade ;

CREATE TABLE IF NOT EXISTS Zoo.Employees (
    employee_id BIGSERIAL NOT NULL PRIMARY KEY ,
    employee_name VARCHAR(200) NOT NULL,
    employee_surname VARCHAR(200) NOT NULL ,
    employee_mobile_phone VARCHAR(20),
    employee_email VARCHAR(200),
    employee_payment INTEGER,
    employee_card_number VARCHAR(20),
    employee_passport_number VARCHAR(200)
);

CREATE TABLE IF NOT EXISTS Zoo.Excursions_Program (
    excursion_title VARCHAR(200) NOT NULL PRIMARY KEY ,
    animal_spieceis VARCHAR(200),
    establishment_name VARCHAR(200),
    excursion_cost DECIMAL NOT NULL,
    excursion_duration FLOAT
);

CREATE TABLE IF NOT EXISTS Zoo.Excursions(
    excursion_id BIGSERIAL NOT NULL PRIMARY KEY ,
    excursion_title VARCHAR(200) REFERENCES Zoo.Excursions_Program,
    excursion_date DATE,
    excursion_start TIME,
    excursion_end TIME,
    amount_of_visitors INTEGER,
    rating_from_audience_after_excursion FLOAT
);



CREATE TABLE IF NOT EXISTS Zoo.Establishments_Nearby(
    establishment_name VARCHAR(200) NOT NULL PRIMARY KEY ,
    establishment_type VARCHAR(200) NOT NULL ,
    open_time TIME,
    close_time TIME,
    establishment_rating FLOAT
);


CREATE TABLE IF NOT EXISTS Zoo.Animals (
    animal_id BIGSERIAL NOT NULL PRIMARY KEY ,
    animal_name VARCHAR(200) ,
    animal_spiecies VARCHAR(200),
    animal_weight FLOAT,
    animal_age INTEGER,
    chipped BOOL,
    vaccinated BOOl
);

CREATE TABLE IF NOT EXISTS Zoo.Animals_vaccination (
    animal_id INTEGER NOT NULL REFERENCES Zoo.Animals,
    date_of_vaccination DATE
);


CREATE TABLE IF NOT EXISTS Zoo.Workers_and_Excursions (
    worker_id INTEGER NOT NULL REFERENCES Zoo.Employees,
    excursion_id INTEGER NOT NULL REFERENCES Zoo.Excursions
);

CREATE TABLE IF NOT EXISTS Zoo.Workers_and_Animals (
    worker_id INTEGER NOT NULL  REFERENCES Zoo.Employees,
    animal_id INTEGER NOT NULL REFERENCES Zoo.Animals
);

CREATE TABLE IF NOT EXISTS Zoo.Workers_and_Establishments (
    worker_id INTEGER NOT NULL REFERENCES Zoo.Employees,
    establishment_name VARCHAR(200) NOT NULL REFERENCES Zoo.Establishments_Nearby
);

