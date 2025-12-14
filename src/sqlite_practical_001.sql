-- database: ../runtime/db/StarWars.db

-- practical 1: Databases and Tables 
-- Student Name: [your name]
-- Date: [Today's Date] 
-- 
-- This script creates the star wars characters database 

-- create the characters table
CREATE TABLE IF NOT EXISTS characters (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    NAME TEXT NOT NULL,
    species TEXT,
    homeworld TEXT
);

INSERT INTO characters (name, species, homeworld) Values 
    ('Luke Skywalker', 'Human', 'Tatooine'),
    ('Leia Organa', 'Human', 'Alderaan'),
    ('Han Solo', 'Human', 'Corellia'),
    ('Chewbacca', 'Wookie','Kashyyyk'),
    ('Obi-Wan Kenobi', 'Human','StewJon'),
    ('Darth Vader', 'Human', 'Tattoine'),
    ('Yoda','Yoda''s species', 'unkown'),
    ('R2-D2', 'Droid', 'Naboo');

-- view all characters 
SELECT * FROM characters;

--Additional characters (practise excercise)
INSERT INTO characters (name, species, homeworld) VALUES
    ('Padme Amidala' , 'Human' , 'Naboo'),
    ('Boba Fett' , 'Human' , 'Kamino'),
    ('Jabba the Hutt' , 'Hutt' , 'Nal Hutta');


