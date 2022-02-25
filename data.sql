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

-- Phase 4 add "join table" for visits

  -- vets

INSERT INTO vets (
    name,
    age,
    date_of_graduation
  )
  VALUES
    ('William Tatcher', 45, '04/23/2000'),
    ('Maisy Smith', 26, '01/17/2019'),
    ('Stephanie Mendez', 64, '05/04/1981'),
    ('Jack Harkness', 38, '06/08/2008');

  -- specializations

INSERT INTO specializations
    (species_id, vet_id)
  VALUES
    (
      ( SELECT id FROM species WHERE name = 'Pokemon'),
      ( SELECT id FROM vets WHERE name = 'William Tatcher')
    ),
    (
      ( SELECT id FROM species WHERE name = 'Pokemon'),
      ( SELECT id FROM vets WHERE name = 'Stephanie Mendez')
    ),
    (
      ( SELECT id FROM species WHERE name = 'Digimon'),
      ( SELECT id FROM vets WHERE name = 'Stephanie Mendez')
    ),
    (
      ( SELECT id FROM species WHERE name = 'Digimon'),
      ( SELECT id FROM vets WHERE name = 'Jack Harkness')
    );

  -- visits

INSERT INTO visits (
    animal_id,
    vet_id,
    date_of_visit
)
  VALUES 
    (
      (SELECT id FROM animals WHERE name = 'Agumon'),
      (SELECT id FROM vets WHERE name = 'William Tatcher'),
      '05/24/2020'
    ),
    (
      (SELECT id FROM animals WHERE name = 'Agumon'),
      (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
      '07/22/2020'
    ),
    (
      (SELECT id FROM animals WHERE name = 'Gabumon'),
      (SELECT id FROM vets WHERE name = 'Jack Harkness'),
      '02/02/2021'
    ),
    (
      (SELECT id FROM animals WHERE name = 'Pikachu'),
      (SELECT id FROM vets WHERE name = 'Maisy Smith'),
      '01/05/2020'
    ),
    (
      (SELECT id FROM animals WHERE name = 'Pikachu'),
      (SELECT id FROM vets WHERE name = 'Maisy Smith'),
      '03/08/2020'
    ),
    (
      (SELECT id FROM animals WHERE name = 'Pikachu'),
      (SELECT id FROM vets WHERE name = 'Maisy Smith'),
      '05/14/2020'
    ),
    (
      (SELECT id FROM animals WHERE name = 'Devimon'),
      (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
      '05/04/2021'
    ),
    (
      (SELECT id FROM animals WHERE name = 'Charmander'),
      (SELECT id FROM vets WHERE name = 'Jack Harkness'),
      '02/24/2021'
    ),
    (
      (SELECT id FROM animals WHERE name = 'Squirtle'),
      (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
      '09/29/2019'
    ),
    (
      (SELECT id FROM animals WHERE name = 'Angemon'),
      (SELECT id FROM vets WHERE name = 'Jack Harkness'),
      '10/03/2020'
    ),
    (
      (SELECT id FROM animals WHERE name = 'Angemon'),
      (SELECT id FROM vets WHERE name = 'Jack Harkness'),
      '11/04/2020'
    ),
    (
      (SELECT id FROM animals WHERE name = 'Boarmon'),
      (SELECT id FROM vets WHERE name = 'Maisy Smith'),
      '01/24/2019'
    ),
    (
      (SELECT id FROM animals WHERE name = 'Boarmon'),
      (SELECT id FROM vets WHERE name = 'Maisy Smith'),
      '05/15/2019'
    ),
    (
      (SELECT id FROM animals WHERE name = 'Boarmon'),
      (SELECT id FROM vets WHERE name = 'Maisy Smith'),
      '02/27/2020'
    ),
    (
      (SELECT id FROM animals WHERE name = 'Boarmon'),
      (SELECT id FROM vets WHERE name = 'Maisy Smith'),
      '08/03/2020'
    ),
    (
      (SELECT id FROM animals WHERE name = 'Blossom'),
      (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
      '05/24/2020'
    ),
    (
      (SELECT id FROM animals WHERE name = 'Blossom'),
      (SELECT id FROM vets WHERE name = 'William Tatcher'),
      '01/11/2021'
    );

-- Plantmon visited Maisy Smith on Dec 21st, 2019. ...
-- There is a problem with this repo. Plantmon has been deleted on Day 2. It was born in the feture on Nov 16th 2022. It can not visit vet on earlier date! There is an issue opened ofr this: https://github.com/microverseinc/curriculum-databases/issues/26
-- All the related queries concerning this animal and related vets and dates will be discarded.