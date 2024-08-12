-- Insert sample data into the "artists" table
INSERT INTO artists (name, bio, nationality, style) VALUES
    ('Vincent van Gogh', 'Post-Impressionist painter known for his vivid works.', 'Dutch', 'Post-Impressionism'),
    ('Pablo Picasso', 'Spanish painter and sculptor known for co-founding Cubism.', 'Spanish', 'Cubism'),
    ('Claude Monet', 'French painter and a founder of French Impressionist painting.', 'French', 'Impressionism'),
    ('Frida Kahlo', 'Mexican painter known for her self-portraits and works inspired by Mexican culture.', 'Mexican', 'Surrealism');

-- Insert sample data into the "artworks" table with PostGIS geography type
INSERT INTO artworks (title, description, type, location, artist_id) VALUES
    ('Starry Night', 'A depiction of the view from the asylum room.', 'painting', ST_MakePoint(-73.9772, 40.7616)::geography, 1),
    ('Guernica', 'A large black and white painting capturing the horrors of war.', 'painting', ST_MakePoint(-73.9772, 40.7616)::geography, 2),
    ('Water Lilies', 'A series of oil paintings depicting Monet’s water lily pond.', 'painting', ST_MakePoint(2.2950, 48.8738)::geography, 3),
    ('The Two Fridas', 'A double self-portrait by Frida Kahlo.', 'painting', ST_MakePoint(-99.1332, 19.4326)::geography, 4);

-- Insert sample data into the "users" table
INSERT INTO users (username, email, favorites) VALUES
    ('johndoe', 'johndoe@example.com', ARRAY[1, 2]),
    ('janedoe', 'janedoe@example.com', ARRAY[3, 4]),
    ('alice', 'alice@example.com', ARRAY[1, 3]),
    ('bob', 'bob@example.com', ARRAY[2, 4]);
