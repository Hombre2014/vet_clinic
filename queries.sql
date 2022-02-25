-- Phase 1 create animals table

-- Find all animals whose name ends in "mon".
SELECT * from animals WHERE name LIKE '%mon';

-- List the name of all animals born between 2016 and 2019.
SELECT * FROM animals WHERE date_of_birth BETWEEN '01-01-2016' AND '12-31-2019';

-- List the name of all animals that are neutered and have less than 3 escape attempts.
SELECT * FROM animals WHERE neutered=TRUE AND escape_attempts < 3;

-- List date of birth of all animals named either "Agumon" or "Pikachu".
SELECT date_of_birth, name FROM animals WHERE name='Agumon' OR name='Pikachu';

-- List name and escape attempts of animals that weigh more than 10.5kg
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

-- Find all animals that are neutered.
SELECT * FROM animals WHERE neutered = TRUE;

-- Find all animals not named Gabumon.
SELECT * FROM animals WHERE name!='Gabumon';

-- Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

-- Phase 2 update animals table

BEGIN;
UPDATE animals SET species='unspecified';
ROLLBACK;
-- Check that the changes have been made
SELECT * FROM animals;
-- Rollback the changes
COMMIT;

-- Updates
BEGIN;
UPDATE animals SET species='digimon' WHERE name LIKE '%mon';
UPDATE animals SET species='pokemon' WHERE species IS NULL;
COMMIT;

-- Check that the changes have been made
SELECT * FROM animals;

BEGIN;
DELETE FROM animals;
ROLLBACK;
COMMIT;

-- Check that the changes have been made
SELECT * FROM animals;

-- Updates

BEGIN;
DELETE FROM animals WHERE date_of_birth > '01-01-2022';
SAVEPOINT delete_this_year_born;
UPDATE animals SET weight_kg=(weight_kg * -1);
ROLLBACK TO delete_this_year_born;
UPDATE animals SET weight_kg=weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

-- How many animals are there?
SELECT COUNT(*) FROM animals;

-- How many animals have never tried to escape?
SELECT COUNT(escape_attempts) FROM animals WHERE escape_attempts=0;

-- What is the average weight of animals?
SELECT AVG(weight_kg) FROM animals;

-- Who escapes the most, neutered or not neutered animals?
SELECT * FROM animals;
SELECT MAX(escape_attempts) FROM animals;

-- What is the minimum and maximum weight of each type of animal?
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT DISTINCT species, AVG(escape_attempts) AS avg_esc_att FROM animals GROUP BY species, date_of_birth HAVING date_of_birth BETWEEN '1990-01-01' AND '2000-12-31';

-- Phase 3 query multiple tables

-- What animals belong to Melody Pond?
SELECT name, full_name FROM animals JOIN owners ON owner_id = owners.id WHERE owners.id = 4;

-- List of all animals that are pokemon (their type is Pokemon).
SELECT name FROM animals WHERE species_id = 2;

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT full_name AS owner, name AS animal FROM owners LEFT JOIN animals ON owners.id = animals.owner_id;

-- How many animals are there per species?
SELECT A.name, COUNT(B.species_id) FROM species A FULL JOIN animals B ON A.id = B.species_id GROUP BY A.name;

-- List all Digimon owned by Jennifer Orwell.
SELECT animals.name AS name, owners.full_name AS owner, species.name AS species FROM animals JOIN species ON species.id = animals.species_id JOIN owners ON owners.id = animals.owner_id WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT * FROM animals JOIN owners ON animals.owner_id = owners.id 
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

-- Who owns the most animals?
SELECT owners.full_name, COUNT(animals.name) AS max_number FROM owners
JOIN animals ON owners.id = animals.owner_id GROUP BY owners.full_name ORDER BY max_number DESC;

-- Phase 4 add "join table" for visits

-- Who was the last animal seen by William Tatcher?
SELECT vet.name AS vet_name, an.name AS animal_name
  FROM visits v JOIN animals an ON an.id = v.animal_id
  JOIN vets vet ON vet.id = v.vet_id
  WHERE vet.name = 'William Tatcher'
  ORDER BY v.date_of_visit DESC LIMIT 1;

-- How many different animals did Stephanie Mendez see?
SELECT vet.name as vet_name, COUNT(date_of_visit) 
  FROM visits v JOIN vets vet ON v.vet_id = vet.id
  WHERE name = 'Stephanie Mendez' GROUP BY vet.name;

-- List all vets and their specialties, including vets with no specialties.
SELECT vets.name, species.name FROM vets JOIN specializations ON vets.id = specializations.vet_id JOIN species ON species.id = specializations.species_id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT an.name, vet.name AS vet_name, v.date_of_visit
  FROM visits v JOIN animals an ON an.id = v.animal_id
  JOIN vets vet ON vet.id = v.vet_id
  WHERE vet.name = 'Stephanie Mendez' AND v.date_of_visit 
    BETWEEN 'Apr 1, 2020' AND 'Aug 30, 2020';

-- What animal has the most visits to vets?
SELECT an.name, COUNT(an.name) AS most_visits
  FROM visits v JOIN animals an ON an.id = v.animal_id
  GROUP BY an.name ORDER BY most_visits DESC LIMIT 1;

-- Who was Maisy Smith's first visit?
SELECT an.name AS animal, vet.name AS vet, v.date_of_visit
  FROM visits v JOIN animals an ON an.id = v.animal_id
  JOIN vets vet ON vet.id = v.vet_id
  WHERE vet.name = 'Maisy Smith' ORDER BY v.date_of_visit ASC LIMIT 1;

  -- Details for most recent visit: animal information, vet information, and date of visit.
SELECT an.id AS animal_id, an.name AS animal, an.date_of_birth, vet.id AS vet_id, vet.name AS vet, vet.age AS vet_age, date_of_visit
  FROM visits v JOIN animals an ON an.id = v.animal_id
  JOIN vets vet ON vet.id = v.vet_id ORDER BY v.date_of_visit DESC
  LIMIT 1;

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT vet.name AS vet, COUNT(*) FROM visits vis JOIN vets vet 
    ON vet.id = vis.vet_id LEFT JOIN specializations s 
    ON s.vet_id = vis.vet_id WHERE s.id IS NULL GROUP BY vet.name;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT vet.name AS vet, sp.name AS species, COUNT(sp.name)
  FROM visits v JOIN animals a ON a.id = v.animal_id
  JOIN vets vet ON vet.id = v.vet_id
  JOIN species sp ON sp.id = a.species_id
  WHERE vet.name = 'Maisy Smith' GROUP BY vet.name, sp.name
  ORDER BY COUNT DESC LIMIT 1;