![](https://img.shields.io/badge/Microverse-blueviolet)

# Yuriy Chamkoriyski Vet clinic database project

> Postgre SQL exercise

## Description

In this project you will use a relational database to create the initial data structure for a vet clinic. You will create a table to store animals' information, insert some data into it, and query it.

## Requirements:

### Phase 1, create animals table

- [x] Use [this template](https://github.com/microverseinc/curriculum-template-databases) to generate your repo.
- [x] Create a database named `vet_clinic`.
- [x] Create a table named `animals` with the following columns:
  - [x] `id`: integer
  - [x] `name`: string
  - [x] `date_of_birth`: date
  - [x] `escape_attempts`: integer
  - [x] `neutered`: boolean
  - [x] `weight_kg`: decimal
- [x] Copy the SQL you used in the previous point into the `schema.sql` file in the generated repository.
- [x] Insert the following data:
  - [x] Animal: His name is Agumon. He was born on Feb 3rd, 2020, and currently weighs 10.23kg. He was neutered and he has never tried to escape.
  - [x] Animal: Her name is Gabumon. She was born on Nov 15th, 2018, and currently weighs 8kg. She is neutered and she has tried to escape 2 times.
  - [x] Animal: His name is Pikachu. He was born on Jan 7th, 2021, and currently weighs 15.04kg. He was not neutered and he has tried to escape once.
  - [x] Animal: Her name is Devimon. She was born on May 12th, 2017, and currently weighs 11kg. She is neutered and she has tried to escape 5 times.
- [x] Copy the SQL you used in the previous point into the data.sql file in the generated repository.
- [x] Write queries for the following:
  - [x] Find all animals whose name ends in "mon".
  - [x] List the name of all animals born between 2016 and 2019.
  - [x] List the name of all animals that are neutered and have less than 3 escape attempts.
  - [x] List date of birth of all animals named either "Agumon" or "Pikachu".
  - [x] List name and escape attempts of animals that weigh more than 10.5kg
  - [x] Find all animals that are neutered.
  - [x] Find all animals not named Gabumon.
  - [x] Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)
- [x] Copy the SQL you used in the previous point into the `queries.sql` file in the generated repository.

### Phase 2, query and update animals table



## Built With

- Major languages: PostgreSQL
- Frameworks: 
- Technologies used: 
- Tested with: 

## Live Demo

N/A

### Prerequisites

N/A

### Setup

N/A

### Usage

N/A

### Deployment

N/A

## Authors

👤 **Yuriy Chamkoriyski**

- GitHub: [@Hombre2014](https://github.com/Hombre2014)
- Twitter: [@Chamkoriyski](https://twitter.com/Chamkoriyski)
- LinkedIn: [axebit](https://linkedin.com/in/axebit)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Hombre2014/vet_clinic/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments


## 📝 License

This project is [MIT](./license.md) licensed.