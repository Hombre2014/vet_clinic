-- Phase 1 create animals table

INSERT INTO animals (
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
  )
VALUES ('Agumon', '02/03/2020', 0, TRUE, 10.23);

INSERT INTO animals (
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
  )
VALUES ('Gabumon', '11/15/2018', 2, TRUE, 8);

INSERT INTO animals (
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
  )
VALUES ('Pikachu', '01/07/2011', 1, FALSE, 15.04);

INSERT INTO animals (
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
  )
VALUES ('Devimon', '05/12/2017', 5, TRUE, 11);

-- Phase 2 update animals table

INSERT INTO animals (
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
  )
VALUES ('Charmander', '02/08/2020', 0, FALSE, -11);

INSERT INTO animals (
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
  )
VALUES ('Plantmon', '11/15/2022', 2, TRUE, -5.7);

INSERT INTO animals (
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
  )
VALUES ('Squirtle', '04/02/1993', 3, FALSE, -12.13);

INSERT INTO animals (
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
  )
VALUES ('Angemon', '06/12/2005', 1, TRUE, -45);

INSERT INTO animals (
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
  )
VALUES ('Boarmon', '06/07/2005', 7, TRUE, 20.4);

INSERT INTO animals (
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
  )
VALUES ('Blossom', '10/13/1998', 3, TRUE, 17);

-- Phase 3 query multiple tables

INSERT INTO owners (
    full_name,
    age
  )
VALUES ('Sam Smith', 34);

INSERT INTO owners (
    full_name,
    age
  )
VALUES ('Jennifer Orwell', 19);

INSERT INTO owners (
    full_name,
    age
  )
VALUES ('Bob', 45);

INSERT INTO owners (
    full_name,
    age
  )
VALUES ('Melody Pond', 77);

INSERT INTO owners (
    full_name,
    age
  )
VALUES ('Dean Winchester', 14);

INSERT INTO owners (
    full_name,
    age
  )
VALUES ('Jodie Whittaker', 38);

INSERT INTO species (
    name
  )
VALUES ('Pokemon');

INSERT INTO species (
    name
  )
VALUES ('Digimon');

UPDATE animals SET species_id=2 WHERE name LIKE '%mon';
UPDATE animals SET species_id=1 WHERE species_id IS NULL;
UPDATE animals SET owner_id=1 WHERE name='Agumon';
UPDATE animals SET owner_id=2 WHERE name='Gabumon' OR name='Pikachu';
UPDATE animals SET owner_id=3 WHERE name='Devimon' OR name='Plantmon';
UPDATE animals SET owner_id=4 WHERE name='Charmander' OR name='Squirtle' OR name='Blossom';
UPDATE animals SET owner_id=5 WHERE name='Angemon' OR name='Boarmon';