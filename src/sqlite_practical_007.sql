-- database: ../runtime/db/StarWars.db

-- practical 7: Updating and Deleting DAta
-- Student Name: [Your Name]
-- Date: [Today's Date]
--
-- This script demonstrates UPDATE and DELETE operations
--
-- WARNING: Always use where with UPDATE and DELET!

SELECT id, name, affiliation FROM characters WHERE name = 'R2-D2';

-- update R2-D2's affiliation
UPDATE characters
SET affiliation = 'Rebel Alliance'
WHERE name = 'R2-D2';

-- Verify the change
SELECT affiliation from characters where name = 'R2-D2';

-- update multiple columns at once
UPDATE characters 
SET species = 'Human (Cyborg)',
    affiliation = 'Galatic Empire'
WHERE name = 'Darth Vader';

-- Verify
SELECT name, species affiliation FROM characters WHERE name = 'Darth Vader';

-- Update all droids to a new affiliation
Update characters
SET affiliation = 'NO affiliation'
Where species = 'Droid';

SELECT name, species, affiliation FROM characters WHERE species = 'Droid';

-- Add 5 cm to everyone's height (growth spurt)
UPDATE characters
SEt height = height + 5
WHERE height IS NOT NULL;

-- View updated heights
SELECT name, height FROM characters ORDER BY height;

-- Update affiliations based on species
UPDATE characters 
SET affiliation = CASE 
    WHEN species = 'Droid' Then 'No Affiliation'
    WHEN species = 'Wookie' Then 'Rebel Alliance'
    WHEN spcies LIKE '%Jedi%' OR name LIKE '%OBI-Wan' THEN 'Jdi Order'
    ELSE affiliation
END;

-- View results
SELECT name, species, affiliation From characters ORDER by species;

-- dangerous, first check which record your targeting

SELECT * FROM characters WHERE name = 'Test Character';

-- Delete the record
DELETE FROM characters
WHERE name ='Test Character';

-- Verify it's gone
SELECT COUNT(*) FROM characters;

-- Let's add a test character first
INSERT INTO characters (name, species, homeworld) VALUES ('Temporary', 'Test', 'Nowhere');

-- Verify it exists
SELECT * FROM characters WHERE name = 'Temporary';

-- delete it 

DELETE FROM characters
WHERE name = 'Temporary' AND species = 'Test';

-- Confirm deletion
SELECT * FROM characters WHERE name = 'Temporary';

-- Delete characters from unkown planets
DELETE FROM characters
WHERE homeworld_id IN (SELECT id FROM planets WHERE name = 'Unkown');

-- THis is safer than trying to use JOIN in DELETE

-- step 1: SELECT to see what WOULD be deleted
SELECT * FROM characters WHERE species = 'Test Species';

-- Try to insert a character without a name (should fail with NOT NULL)
INSERT INTO characters (species, homeworld) VALUES ('Human', 'Earth');

UPDATE characters SET height = -100 WHERE name = 'Yoda';

-- referencing a planet that doesn't exist
UPDATE characters
SET homeworld_id = 9999
WHERE name = 'Luke Skywalker';

PRAGMA foreign_keys = ON

BEGIN TRANSACTION;
    -- YOUR SQL statements here
    -- IF successful:
    COMMIT;
    -- If error:
    -- ROLLBACK;
    -- Start a transaction
    BEGIN TRANSACTION;

    -- Make changes
    UPDATE characters SET affiliation = 'Test' WHERE species = 'Human'; 
    
    -- IF happy with changes: COMMIT
    -- IF not happy: ROLLBACK
    -- FOR This practice, lets undo:
    ROLLBACK;

-- Verify rollback worked
SELECT name, affiliation, height FROM characters WHERE species = 'Human';

-- ex 1: add 10 years to Yoda
-- pretend height represetents age for ex

SELECT name, height FROM characters WHERE name = 'Yoda';

UPDATE characters
SET height = height + 10 
WHERE name = 'Yoda';

SELECT name, height FROM characters WHERE name = 'Yoda';


-- ex 2

UPDATE characters 
SET affiliation = 'Desert Natives'
WHERE homeworld_id = (SELECT id FROM planets WHERE name = 'Tatooine');

-- Verify
SELECT c.name, p.name AS homeworld, c.affilation
FROM characters c 
JOIN planets p ON c.homeworld_id = p.id
WHERE p.name = 'Tatooine';

-- ex 3

INSERT INTO characters (name, species, homeworld) VALUES ('Test Delete', 'Test', 'Nowhere');

-- Verify it exists
SELECT * FROM  characters WHERE name = 'Test Delete';

-- delete it 
DELETE FROM characters WHERE name = 'Test Delete';

-- confirm deletion 
SELECT * FROM characters WHERE name = 'Test Delete';


