-- project one
CREATE TABLE animals (
   id serial PRIMARY KEY,
   name varchar(200),
   date_of_birth date,
   escape_attempts integer,
   neutered boolean,
   weight_kg decimal
);

-- project two
BEGIN;
ALTER TABLE animals
ADD COLUMN species VARCHAR(255);

-- project three
CREATE TABLE owners (
    id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name VARCHAR(255),
    age INT
);

CREATE TABLE species (
    id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(255)
);

ALTER TABLE animals
DROP COLUMN species,
ADD COLUMN species_id INT,
ADD COLUMN owner_id INT;

ALTER TABLE animals 
ADD species_id int REFERENCES species(id);
ALTER TABLE animals 
ADD owner_id int REFERENCES owners(id);