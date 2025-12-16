-- database: ../runtime/db/StarWars.db

-- Practical 5: Multiple Tables and Relationships (Data)
-- Student Name: [Your Name]
-- Date: [Today's Date]
--
-- This script inserts data into related tables

-- Insert planets
INSERT INTO planets (name, climate, terrain, population) 
VALUES
('Tatooine', 'arid', 'desert', 1),
('Alderaan', 'temperate', 'grasslands, mountains', 2),
('Hoth', 'frozen', 'tundra, ice caves', Null),
('Kashyyyk', 'tropical', 'jungle, forests', 3),
('Naboo', 'temperate', 'grassy hills, swamps', 4),
('Corellia', 'temperate', 'plains, urban', 5),
('Stewjon', 'temperate', 'grass', NULL),
('Unknown', NULL, NULL, NULL);

-- Update characters with homeworld_id
UPDATE characters SET homeworld_id = (SELECT id From planets Where name = 
'Tatooine') WHERE homeworld = 'Tatooine';
Update characters SET homeworld_id = (SELECT id FROM planets WHERE name =
'Unknown') WHERE homeworld = 'Unknown';

-- Insert vehicles
INSERT INTO vehicles (name, model, vehicle_class, manufacturer) VALUES
('X-wing', 't-65', 'Starfighter', 'Incom Corporation');

-- link characters to vehicles (many to many relationship)
INSERT INTO character_vehicles (character_id, vehicle_id) Values
    -- Luke flies X-Wing
    (1, 1);

-- View all planets
SELECT * FROM planets;

-- View all vehicles
SELECT * FROM vehicles;

-- View character-vehicle links
SELECT * FROM character_vehicles;

-- View updated characters table
SELECT id, name, homeworld, homeworld_id FROM characters;