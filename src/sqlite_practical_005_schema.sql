-- database: ../runtime/db/StarWars.db

-- practical 5: Multiple Tables and Relationships (Schema)
-- Student name: [Your Name]
-- Date: [Today's Date]
--
-- This script creates related tables with foreign keys 

CREATE TABLE IF NOT EXISTS planets (
    id INTEGER PRIMARY KEY Autoincrement, 
    name TEXT NOT NULL UNIQUE,
    climate TEXT,
    terrain TEXT,
    population INTEGER
);

-- create vechiles table
CREATE TABLE IF NOT EXISTS vehicles (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL, 
    model TEXT, 
    vehicle_class TEXT,
    manufacturer TEXT
);

-- create character_vehicles junction table
CREATE TABLE IF NOT EXISTS character_vehicles (
    character_id INTEGER NOT NULL,
    vehicle_id INTEGER NOT NULL,
    PRIMARY KEY (character_id, vehicle_id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(id) 
);

-- Add homeworld_id column
ALTER TABLE characters ADD COLUMN homeworld_id INTEGER;

-- Add foreign key constraint (Note: SQlite has limited Alter Table support)
-- In production, you'd recreate the table with FOREIGN KEY constraint

