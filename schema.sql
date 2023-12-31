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

-- project four

-- Create the vets table
CREATE TABLE vets (
    id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(255),
    age INT,
    date_of_graduation DATE
);

-- Create the specializations table (join table for vets and species)
CREATE TABLE specializations (
    vet_id INT,
    species_id INT,
    PRIMARY KEY (vet_id, species_id),
    FOREIGN KEY (vet_id) REFERENCES vets(id),
    FOREIGN KEY (species_id) REFERENCES species(id)
);

-- Create the visits table (join table for animals and vets)
CREATE TABLE visits (
    animal_id INT,
    vet_id INT,
    visit_date DATE,
    FOREIGN KEY (animal_id) REFERENCES animals(id),
    FOREIGN KEY (vet_id) REFERENCES vets(id)
);

-- project five
CREATE TABLE owners(
  id INT GENERATED ALWAYS AS IDENTITY,
  full_name VARCHAR(20),
  age INT,
  PRIMARY KEY(id)
);

CREATE TABLE species(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(20),
  PRIMARY KEY(id)
);

CREATE TABLE animals(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(20),
  date_of_birth DATE,
  escape_attempts INT,
  neutered BOOLEAN,
  weight_kg DECIMAL,
  species_id INT REFERENCES species(id),
  owner_id INT REFERENCES owners(id),
  PRIMARY KEY(id)
);

CREATE TABLE vets(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(20),
  age INT,
  date_of_graduation DATE,
  PRIMARY KEY(id)
);

CREATE TABLE specializations(
  id INT GENERATED ALWAYS AS IDENTITY,
  species_id INT REFERENCES species(id),
  vet_id INT REFERENCES vets(id),
  PRIMARY KEY(id)
);

CREATE TABLE visits(
  id INT GENERATED ALWAYS AS IDENTITY,
  animal_id INT REFERENCES animals(id),
  vet_id INT REFERENCES vets(id),
  date_of_visit DATE,
  PRIMARY KEY(id)
);

-- Performance audit.
CREATE INDEX visits_animal_id_idx ON visits (animal_id);
CREATE INDEX visits_vet_id_idx ON visits (vet_id);
CREATE INDEX idx_owners_email ON owners(email);
