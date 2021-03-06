-- Phase 1 create animals table

CREATE TABLE animals (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(100),
  date_of_birth DATE,
  escape_attempts INT,
  neutered boolean,
  weight_kg DECIMAL
);

-- Phase 2 update animals table

ALTER TABLE animals ADD species VARCHAR(50);

-- Phase 3 query multiple tables

CREATE TABLE owners (
  id SERIAL PRIMARY KEY,
  full_name VARCHAR(100),
  age INT
);

CREATE TABLE species (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100)
);

ALTER TABLE animals ADD PRIMARY KEY (id);
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD species_id INT REFERENCES species(id);
ALTER TABLE animals ADD owner_id INT REFERENCES owners(id);

-- Phase 4 add "join table" for visits

CREATE TABLE vets (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  age INT,
  date_of_graduation DATE
);

CREATE TABLE specializations (
  id SERIAL PRIMARY KEY,
  species_id INT NOT NULL,
  vet_id INT NOT NULL,
  FOREIGN KEY (species_id) REFERENCES species (id),
  FOREIGN KEY (vet_id) REFERENCES vets (id)
);

CREATE TABLE visits (
  visit_id SERIAL PRIMARY KEY,
  animal_id INT NOT NULL,
  vet_id INT NOT NULL,
  date_of_visit DATE,
  FOREIGN KEY (animal_id) REFERENCES animals (id),
  FOREIGN KEY (vet_id) REFERENCES vets (id)
);

-- Phase 5 database performance audit
-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- To decrease the first query time
CREATE INDEX animal_visit ON visits(animal_id ASC);
-- This one decreased the time for execution significantly

-- To decrease the second query time
-- The following index creation doesn't help.
-- CREATE INDEX vet_id_visit ON visits(vet_id ASC);
-- DROP INDEX vet_id_visit;

-- This one reduced the time about 11%
CREATE INDEX vet_visit ON visits(date_of_visit ASC);

--  To decrease the third query:
CREATE INDEX owner_indx ON owners(email ASC);
-- This one decreased the time for execution significantly