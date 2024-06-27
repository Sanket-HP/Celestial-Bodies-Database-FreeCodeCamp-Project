psql --username=freecodecamp --dbname=postgres

CREATE DATABASE universe;

\c universe

-- Create galaxy table
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    description TEXT,
    galaxy_type VARCHAR(50),
    has_life BOOLEAN,
    distance_from_earth NUMERIC
);

-- Create star table
CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    age_in_millions_of_years INT,
    galaxy_id INT REFERENCES galaxy(galaxy_id),
    is_spherical BOOLEAN,
    star_type VARCHAR(50)
);

-- Create planet table
CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    star_id INT REFERENCES star(star_id),
    distance_from_star INT,
    has_life BOOLEAN,
    planet_type VARCHAR(50)
);

-- Create moon table
CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    planet_id INT REFERENCES planet(planet_id),
    distance_from_planet INT,
    is_spherical BOOLEAN
);

-- Example additional table: spacecraft
CREATE TABLE spacecraft (
    spacecraft_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    description TEXT,
    launched BOOLEAN,
    capacity INT
);

-- Insert data into galaxy table
INSERT INTO galaxy (name, description, galaxy_type, has_life, distance_from_earth)
VALUES
    ('Milky Way', 'Our home galaxy', 'Spiral', TRUE, 0),
    ('Andromeda', 'Nearest spiral galaxy', 'Spiral', FALSE, 2537000),
    ('Triangulum', 'Third largest in the Local Group', 'Spiral', FALSE, 3000000),
    ('Whirlpool', 'Interacting grand design spiral galaxy', 'Spiral', FALSE, 23000000),
    ('Sombrero', 'Unbarred spiral galaxy', 'Spiral', FALSE, 29000000),
    ('Pinwheel', 'Face-on spiral galaxy', 'Spiral', FALSE, 21000000);

-- Insert data into star table
INSERT INTO star (name, age_in_millions_of_years, galaxy_id, is_spherical, star_type)
VALUES
    ('Sun', 4600, 1, TRUE, 'G-type main-sequence'),
    ('Alpha Centauri A', 5500, 1, TRUE, 'G-type main-sequence'),
    ('Alpha Centauri B', 5500, 1, TRUE, 'K-type main-sequence'),
    ('Proxima Centauri', 4600, 1, TRUE, 'M-type main-sequence'),
    ('Betelgeuse', 10000, 2, TRUE, 'Red supergiant'),
    ('Rigel', 8000, 2, TRUE, 'Blue supergiant');

-- Insert data into planet table
INSERT INTO planet (name, star_id, distance_from_star, has_life, planet_type)
VALUES
    ('Mercury', 1, 57, FALSE, 'Terrestrial'),
    ('Venus', 1, 108, FALSE, 'Terrestrial'),
    ('Earth', 1, 150, TRUE, 'Terrestrial'),
    ('Mars', 1, 228, FALSE, 'Terrestrial'),
    ('Jupiter', 1, 778, FALSE, 'Gas giant'),
    ('Saturn', 1, 1427, FALSE, 'Gas giant'),
    ('Uranus', 1, 2871, FALSE, 'Ice giant'),
    ('Neptune', 1, 4497, FALSE, 'Ice giant'),
    ('Alpha Centauri Bb', 2, 42000000, FALSE, 'Terrestrial'),
    ('Proxima Centauri b', 4, 7000000, FALSE, 'Terrestrial'),
    ('Betelgeuse b', 5, 320000000, FALSE, 'Gas giant'),
    ('Rigel b', 6, 600000000, FALSE, 'Gas giant');

-- Insert data into moon table
INSERT INTO moon (name, planet_id, distance_from_planet, is_spherical)
VALUES
    ('Moon', 3, 0, TRUE),
    ('Phobos', 4, 9, TRUE),
    ('Deimos', 4, 23, TRUE),
    ('Io', 5, 422, TRUE),
    ('Europa', 5, 671, TRUE),
    ('Ganymede', 5, 1070, TRUE),
    ('Callisto', 5, 1883, TRUE),
    ('Titan', 6, 1222, TRUE),
    ('Rhea', 6, 527, TRUE),
    ('Iapetus', 6, 3561, TRUE),
    ('Oberon', 7, 584, TRUE),
    ('Titania', 7, 435, TRUE),
    ('Ariel', 7, 191, TRUE),
    ('Umbriel', 7, 266, TRUE),
    ('Miranda', 7, 129, TRUE),
    ('Triton', 8, 354, TRUE),
    ('Nereid', 8, 5511, TRUE),
    ('Proteus', 8, 117, TRUE),
    ('Larissa', 8, 74, TRUE),
    ('Charon', 12, 19, TRUE);

-- Insert data into spacecraft table
INSERT INTO spacecraft (name, description, launched, capacity)
VALUES
    ('Voyager 1', 'NASA space probe', TRUE, 0),
    ('Voyager 2', 'NASA space probe', TRUE, 0),
    ('Apollo 11', 'First manned moon landing mission', TRUE, 3);

pg_dump -cC --inserts -U freecodecamp universe > universe.sql

psql -U postgres < universe.sql

