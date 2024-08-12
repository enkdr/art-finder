-- Enable PostGIS extension
CREATE EXTENSION IF NOT EXISTS postgis;

-- Create the "artists" table with additional fields
CREATE TABLE artists (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    bio TEXT,
    nationality VARCHAR(100),
    style VARCHAR(100)
);

-- Create the "artworks" table with PostGIS geography type
CREATE TABLE artworks (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    type VARCHAR(50) NOT NULL,
    location GEOGRAPHY(POINT, 4326) NOT NULL, -- Using GEOGRAPHY type for latitude and longitude
    created TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    updated TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    artist_id INT REFERENCES artists(id) ON DELETE SET NULL,
    CONSTRAINT type_check CHECK (type IN ('sculpture', 'painting', 'drawing', 'photography'))
);

-- Create the "users" table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    favorites INT[] DEFAULT '{}'  -- Array to store favorite artwork IDs
);

-- Add a trigger function to update the "updated" timestamp on artworks
CREATE OR REPLACE FUNCTION update_artwork_timestamp()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create the trigger on the "artworks" table to automatically update the "updated" field
CREATE TRIGGER trg_update_artwork
BEFORE UPDATE ON artworks
FOR EACH ROW
EXECUTE FUNCTION update_artwork_timestamp();
