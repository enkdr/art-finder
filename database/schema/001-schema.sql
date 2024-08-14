-- Extension to enable PostGIS features
CREATE EXTENSION IF NOT EXISTS postgis;

-- Profile table
CREATE TABLE profile (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    profilename VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    created TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    updated TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

-- Styles table (assuming it's necessary for the reference)
CREATE TABLE styles (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(255) NOT NULL
);


-- Gallery table
CREATE TABLE gallery (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title VARCHAR(255) NOT NULL,
    location GEOGRAPHY(POINT, 4326) NOT NULL,
    notes TEXT,
    created TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    updated TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

-- Artist table
CREATE TABLE artist (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    bio TEXT,
    nationality VARCHAR(255),
    styles_id UUID REFERENCES styles(id),
    created TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    updated TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

-- Artwork table
CREATE TABLE artwork (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    artist_id UUID REFERENCES artist(id),
    title VARCHAR(255) NOT NULL,
    description TEXT,
    year integer,
    type_id UUID REFERENCES artist(id), -- Assuming "type" refers to the "artist"
    location GEOGRAPHY(POINT, 4326) NOT NULL,
    gallery_id UUID REFERENCES gallery(id),
    created TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    updated TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

-- Profile_Artwork association table
CREATE TABLE profile_artwork (
    profile_id UUID REFERENCES profile(id),
    artwork_id UUID REFERENCES artwork(id),
    PRIMARY KEY (profile_id, artwork_id)
);


