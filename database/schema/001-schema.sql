-- Extension to enable PostGIS features
CREATE EXTENSION IF NOT EXISTS postgis;

-- User table
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    created TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    updated TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

-- Style table (assuming it's necessary for the reference)
CREATE TABLE style (
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
    style_id UUID REFERENCES style(id),
    created TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    updated TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

-- Artwork table
CREATE TABLE artwork (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    artist_id UUID REFERENCES artist(id),
    title VARCHAR(255) NOT NULL,
    description TEXT,
    type_id UUID REFERENCES artist(id), -- Assuming "type" refers to the "artist"
    location GEOGRAPHY(POINT, 4326) NOT NULL,
    gallery_id UUID REFERENCES gallery(id),
    created TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    updated TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

-- User_Artwork association table
CREATE TABLE user_artwork (
    user_id UUID REFERENCES users(id),
    artwork_id UUID REFERENCES artwork(id),
    PRIMARY KEY (user_id, artwork_id)
);


