-- database: ../runtime/db/StarWars.db

-- practical 3: Sorting and Limiting Results
-- Student Name: [Your Name] 
-- Date: [Today's Date]
--
-- This script demonstrates ORDER by and LIMIT clauses

SELECT * FROM characters ORDER BY height;
-- add height column to a characters table
ALTER TABLE characters ADD COLUMN height INTEGER;

-- Update characters with height data (in centimetres)
UPDATE characters SET height = 172 WHERE name = 'Luke Skywalker';
UPDATE characters SET height = 150 WHERE name = 'Leia Organa';
UPDATE characters SET height = 180 WHERE name = 'Han Solo';
UPDATE characters SET height = 228 WHERE name = 'Chewbacca';
UPDATE characters SET height = 182 WHERE name = 'Obi-Wan Kenobi';
UPDATE characters SET height = 202 WHERE name = 'Darth Vader';
UPDATE characters SET height = 66 WHERE name = 'Yoda';
UPDATE characters SET height = 96 WHERE name = 'R2-D2';

-- Query 1: View all characters sorted by name (A-Z)
SELECT name, species, homeworld FROM characters ORDER BY name;

-- Query 2: View characters sorted by species 
SELECT name, species FROM characters ORDER BY species;

-- Query 3: View characters sorted by height (shortest to tallest)
SELECT name, height FROM characters ORDER BY height;

-- Query 4: Explicitly sort ascending (same as Query 3)
Select name, height FROM characters ORDER BY height ASC;

-- Query 5: Sort by height (tallest to shortest)
SELECT name, height FROM characters ORDER by height DESC

-- Query 6: Sort names Z-A
SELECT name From characters ORDER BY name DESC;

-- Query 7: Sort by species first, then by name within each species
SELECT name, species, homeworld
FROM characters
ORDER BY species, name

-- Query 8: Sort by species (A-Z), then height (tallest to shortest)
SELECT name, species, height
FROM characters
ORDER BY species ASC, height DESC;

-- Query 9: Group by homeworld, them by species
Select homeworld, species, name
From characters
ORDER BY homeworld, species;

-- Query 10: View only the first 5 characters
SELECT name FROM characters LIMIT 5;

-- Query 11: Find the tallest character
SELECT name, height
FROM characters
ORDER By height DESC 
LIMIT 1;

-- Query 12: Find the three shortest characters
SELECT name, height
From characters
ORDER BY height ASC
LIMIT 3,

-- Query 13: Get the first 5 names alphabetically
SELECT name FROM characters ORDER BY name LIMIT 5;

-- Query 14: Get characters 4-8 (skip first 3)
SELECT name FROM characters ORDER BY name LIMIT 5 offset 3;

-- page 1: First 3 characters
SELECT name FROM characters ORDER BY name LIMIT 3 OFFSET 0;

-- page 2: Next 3 characters
SELECT name FROM characters ORDER BY name LIMIT 3 OFFSET 3;

-- page 3: Next 3 characters 
SELECT name FROM characters ORDER BY name LIMIT 3 OFFSET 6;

-- Query 15: Find the tallest human
SELECT name, species, height
FROM characters
WHERE species = 'Human'
ORDER By height DESC
LIMIT 1;

-- Query 16: Find 3 characters NOt from Tatooine, sorted by name
SELECT name, homeworld
FROM characters 
WHERE homeworld <> 'Tatooine'
ORDER BY NAME
LIMIT 3;

-- Exercise 1: Find the 5 tallest characters 
Select name, species, height 
FROM characters
ORDER BY height DESC
LIMIT 5;

-- Exercise 2: List all unique species in alphabetical order
SELECT DISTINCT species
FROM characters
ORDER by species;

-- Exercise 3: Find all humans sorted by height (shortest first)
SELECT name, species, height 
FROM characters 
Where species = 'Human'
Order BY height ASC;

-- Exercise 4: Find the second and third tallest characters
SELECT name, height
FROM characters
ORDER BY height DESC
Limit 2 OFFSET 1;