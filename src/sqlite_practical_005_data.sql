-- database: ../runtime/db/StarWars.db

-- Practical 5: Multiple Tables and Relationships (Data)
-- Student Name: [Your Name]
-- Date: [Today's Date]
--
-- This script inserts data into related tables

-- Insert planets
INSERT INTO planets (name, climate, terrain, population) 
VALUES
('Tatooine', 'arid', 'desert', 200000),
('Alderaan', 'temperate', 'grasslands, mountains', 2000000000),
('Hoth', 'frozen', 'tundra, ice caves', Null),
('Kashyyyk', 'tropical', 'jungle, forests', 45000000),
('Naboo', 'temperate', 'grassy hills, swamps', 4500000000),
('Corellia', 'temperate', 'plains, urban', 3000000000),
('Stewjon', 'temperate', 'grass', NULL),
('Unknown', NULL, NULL, NULL);


-- Update characters with homeworld_id
UPDATE characters SET homeworld_id = (SELECT id FROM planets WHERE name =
'Tatooine') WHERE homeworld = 'Tatooine';
UPDATE characters SET homeworld_id = (SELECT id FROM planets WHERE name =
'Alderaan') WHERE homeworld = 'Alderaan';
UPDATE characters SET homeworld_id = (SELECT id FROM planets WHERE name =
'Corellia') WHERE homeworld = 'Corellia';
UPDATE characters SET homeworld_id = (SELECT id FROM planets WHERE name =
'Kashyyyk') WHERE homeworld = 'Kashyyyk' ;
UPDATE characters SET homeworld_id = (SELECT id FROM planets WHERE name =
'Stewjon') WHERE homeworld = 'Stewjon';
UPDATE characters SET homeworld_id = (SELECT id FROM planets WHERE name =
'Naboo') WHERE homeworld = 'Naboo';
UPDATE characters SET homeworld_id = (SELECT id FROM planets WHERE name =
'Unknown') WHERE homeworld = 'Unknown';




-- Insert vehicles
INSERT INTO vehicles (name, model, vehicle_class, manufacturer) VALUES ('X-wing', 'T-65 X-wing', 'Starfighter', 'Incom Corporation'), ('Millennium Falcon', 'YT-1300 light freighter', 'Light freighter',
'Corellian Engineering Corporation'),
('TIE Fighter', 'Twin Ion Engine Fighter', 'Starfighter', 'Sienar Fleet
Systems'),
('Imperial Speeder Bike', '74-Z speeder bike', 'Speeder', 'Aratech
Repulsor Company'),
('Snowspeeder', 'T-47 airspeeder', 'Airspeeder', 'Incom Corporation'), ('Lambda Shuttle', 'Lambda-class shuttle', 'Transport', 'Sienar Fleet
Systems'),
('AT-AT', 'All Terrain Armoured Transport', 'Assault walker', 'Kuat
Drive Yards'),
('Jedi Starfighter', 'Delta-T Aethersprite', 'Starfighter', 'Kuat
Systems Engineering');

-- Link characters to vehicles (many-to-many relationship)

INSERT INTO character_vehicles (character_id, vehicle_id) VALUES

-- Luke flies X-wing, Snowspeeder

(1, 1),

(1, 5),
-- Han flies Millennium Falcon

(3, 2),


-- Chewbacca also flies Millennium Falcon
(4, 2) ,

-- Obi-Wan flies Jedi Starfighter

(5, 8),


-- Darth Vader flies TIE Fighter, Lambda Shuttle
(6, 3),

(6, 6) ,


-- Yoda flies... nothing (wise, he walks)

-- R2-D2 is IN X-wing and Jedi Starfighter
(8, 1),

(8, 8);



-- link characters to vehicles (many to many relationship)
INSERT INTO character_vehicles (character_id, vehicle_id) Values
    -- Luke flies X-Wing
    (1, 1);

-- Insert vehicles
INSERT INTO vehicles (name, model, vehicle_class, manufacturer) VALUES ('X-wing', 'T-65 X-wing', 'Starfighter', 'Incom Corporation'), ('Millennium Falcon', 'YT-1300 light freighter', 'Light freighter',
'Corellian Engineering Corporation'),
('TIE Fighter', 'Twin Ion Engine Fighter', 'Starfighter', 'Sienar Fleet
Systems'),
('Imperial Speeder Bike', '74-Z speeder bike', 'Speeder', 'Aratech
Repulsor Company'),
('Snowspeeder', 'T-47 airspeeder', 'Airspeeder', 'Incom Corporation'), ('Lambda Shuttle', 'Lambda-class shuttle', 'Transport', 'Sienar Fleet
Systems'),
('AT-AT', 'All Terrain Armoured Transport', 'Assault walker', 'Kuat
Drive Yards'),
('Jedi Starfighter', 'Delta-T Aethersprite', 'Starfighter', 'Kuat
Systems Engineering');




-- View all planets
SELECT * FROM planets;

-- View all vehicles
SELECT * FROM vehicles;

-- View character-vehicle links
SELECT * FROM character_vehicles;

-- View updated characters table
SELECT id, name, homeworld, homeworld_id FROM characters;