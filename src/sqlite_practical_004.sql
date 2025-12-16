-- database: ../runtime/db/StarWars.db

-- Practical 4: Aggregating and Grouping 
-- Student Name: [Your Name]
-- Date: [Today's Date]
--
-- This script demonstrates aggregate functions and grouping data

-- Query 1: Count how many characters are in table
SELECT COUNT(*) FROM characters;

-- Query 2: Count character who have a height recorded
SELECT COUNT(height) FROM characters;

-- Query 3: Find the tallest character's height
SELECT MAX(height) FROM characters;

-- Query 4: Find the shortest character's height
SELECT MIN(height) FROM characters;

-- Query 5: Calculate the average height of all characters
SELECT AVG(height) FROM characters;

-- Query 6: add up all characters heights 
SELECT SUM(height) FROM characters;

-- Query 7: Get multiple statistics at once
SELECT 
    COUNT(*) AS total_characters,
    AVG(height) AS average_height,
    MAX(height) AS tallest,
    MIN(height) AS shortest
FROM characters;

-- Query 8: Count how many characters of each species
SELECT species, COUNT(*) AS character_count
FROM characters
GROUP by species;

-- Query 9: Find the average height for each species
SELECT species, AVG(height) As average_height 
FROM characters
WHERE height IS NOT NULL 
GROUP BY species;

-- Query 10: Count characters from each homeworld
SELECT homeworld, COUNT(*) AS character_count
FROM characters
GROUP BY homeworld
ORDER BY character_count DESC;

-- Add affilitation column
ALTER TABLE characters ADD COLUMN affiliation TEXT;

-- Update characters with affilitatins
UPDATE characters SET affiliation = 'Rebel ALliance' Where name IN ('Luke Skywalker', 'Leia organ', 'Han Solo', 'Chewbacca');
UPDATE characters SET affiliation = 'Jedi Order' WHERE name IN ('Obi-Wan Kenobi', 'Yoda');
UPDATE characters SET affiliation = 'Galactic Empire' WHERE name = 'Darth Vader';
UPDATE characters SET affiliation = 'Independent' WHERE name = 'R2-D2';

-- Query 11: Count characters in each affilation 
SELECT affiliation, COUNT(*) AS members 
From characters 
WHERE affiliation IS NOT NULL
GROUP BY affiliation 
ORDER BY members DESC;

-- Query 12: Show only species with 2 or more characters
SELECT species, COUNT(*) AS character_count
FROM characters
GROUP BY species
HAVING COUNT(*) >= 2;

-- Query13: Find affiliations with more than the average number of members
SELECT affiliation, COUNT(*) AS member_count
FROM characters
WHERE affiliation IS NOT NULL 
GROUP by affiliation
HAVING COUNT(*) > (SELECT AVG(cnt) FROM (SELECT COUNT(*) AS cnt FROM characters WHERE affiliation IS NOT NULL GROUP BY affiliation));

-- Query 14: Count humans by homeworld, only showing planets with 2+ humans
SELECT homeworld, COUNT(*) AS human_count
FROM characters
WHERE species = 'Human'
GROUP BY homeworld
HAVING COUNT(*) >= 2;

-- Query 15: How many different species are there?
SELECT COUNT(DISTINCT species) AS unique_species 
FROM characters;

-- Query 16: How many different homeworlds are represented?
SELECT COUNT(DISTINCT homeworld) AS unique_homeworlds
FROM characters;

-- Exercise 1: Find the total height of all characters combined
SELECT SUM(height) AS total_height
FROM characters;

-- Exercise 2: Count characters from each homeworld, sorted alphabetically
SELECT homeworld, COUNT(*) AS character_count
FROM characters
GROUP BY homeworld
ORDER BY homeworld;

-- Excercise 3: Find average height by affilitation
SELECT affiliation, AVG(height) AS avg_height
FROM characters 
WHERE height IS NOT NULL
GROUP by homeworld
HAVINg COUNT(*) = 1;
