-- database: ../runtime/db/StarWars.db

-- Practical 2: Selecting and filtering Data
-- Student Name: [Your Name]
-- Date: [today's Date]
--
--This script demonstrates SELECT queries with WHERE clauses

-- Query 1: View all characters and all columns 
SELECT * FROM characters;

-- Query 2: View only names and species
SELECT name, species FROM characters; 

-- Query 3: View columns in a different order
SELECT homeworld, name, species From characters;

-- Query 4: Find all human characters
SELECT * FROM characters WHERE species = 'Human';

-- Query 5: Find all characters from = 'Tatooine';
SELECT name, homeworld FROM characters WHERE homeworld = 'Tatooine';

-- Query 6: Find all characters who are NOT human
SELECT name, species FROM characters Where species <> 'Human'

-- Query 7: Find humans from Tatooine
SELECT name, species, homeworld
FROM characters 
Where species = 'human' AND homeworld = 'Tatooine';

-- Query 8: Find characters who are either Droid Or from Naboo
SELECT name, species, homeworld
FROM characters
WHERE species = 'Droid' Or homeworld = 'Naboo';

-- Query 9: Find humans from either Tatooine or Alderaan
SELECT name, species, homeworld
FROM characters
Where species = 'Human' AND (homeworld = 'Tatooine' Or homeworld = 'Alderaan');

-- Query 10: Find all characters whose names start with 'L'
SELECT name FROM characters WHERE name LIKE 'L%';

-- Query 11: Find all characters whose names end with 'o'
SELECT name FROM characters WHERE name LIKE 'O%';

-- Query 12: Find all characters with 'Darth' in their name
SELECT name FROM characters WHERE name LIKE 'Darth%';

-- QUERY 13: Find all species containing 'oid'
SELECT DISTINCT species FROM characters WHERE species LIKE '%oid%';

-- Excercise 1: Finda all characters from Kashyyyk
SELECT name, homeworld FROM characters WHERE homeworld = 'Kashyyyk';

-- Excercise 2: Find all characters who are NOT droids
SELECT name, species FROM characters WHERE species != 'Tatooine';

-- Excercise 3: Find all humans NOT from Tatooine
SELECT name, species, homeworld
FROM characters
WHERE species = 'Human' AND homeworld != 'Tatooine';

-- Excercise 4: Find all characters whose names contain 'Sky'
SELECT name FROM characters WHERE name LIKE '%Sky%';

