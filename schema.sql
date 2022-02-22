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