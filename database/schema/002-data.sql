-- Insert into styles
INSERT INTO styles (id, name) VALUES
    (gen_random_uuid(), 'Impressionism'),
    (gen_random_uuid(), 'Cubism'),
    (gen_random_uuid(), 'Surrealism');

INSERT INTO medium (id, name) VALUES
    (gen_random_uuid(), 'Oil on canvas'),
    (gen_random_uuid(), 'Watercolor'),
    (gen_random_uuid(), 'Lithograph');

-- Insert into gallery
INSERT INTO gallery (id, title, location, notes) VALUES
    (gen_random_uuid(), 'The Louvre', ST_GeogFromText('SRID=4326;POINT(2.3364 48.8606)'), 'World-famous art museum in Paris.'),
    (gen_random_uuid(), 'MoMA', ST_GeogFromText('SRID=4326;POINT(-73.9654 40.7614)'), 'Museum of Modern Art in New York.');

-- Insert into artist
INSERT INTO artist (id, first_name, last_name, image, bio, nationality) VALUES
    (gen_random_uuid(), 'Claude', 'Monet', 'https://example.com/monet.jpg', 'French painter, a founder of Impressionism.', 'French'),
    (gen_random_uuid(), 'Pablo', 'Picasso', 'https://example.com/picasso.jpg', 'Spanish painter, sculptor, and a key figure in Cubism.', 'Spanish');

-- Insert into artwork
INSERT INTO artwork (id, artist_id, title, description, image, year, styles_id, medium_id, location, gallery_id) VALUES
    (gen_random_uuid(), (SELECT id FROM artist WHERE first_name = 'Claude'), 'Water Lilies', 'A series of Impressionist paintings by Claude Monet.', 'https://example.com/waterlilies.jpg', 1919, (SELECT id FROM styles WHERE name = 'Impressionism'),(SELECT id FROM medium WHERE name = 'Oil on canvas'), ST_GeogFromText('SRID=4326;POINT(2.3364 48.8606)'), (SELECT id FROM gallery WHERE title = 'The Louvre')),
    (gen_random_uuid(), (SELECT id FROM artist WHERE first_name = 'Pablo'), 'Les Demoiselles dAvignon', 'A revolutionary Cubist painting by Pablo Picasso.', 'https://example.com/demoiselles.jpg', 1907, (SELECT id FROM styles WHERE name = 'Cubism'),(SELECT id FROM medium WHERE name = 'Oil on canvas'), ST_GeogFromText('SRID=4326;POINT(-73.9654 40.7614)'), (SELECT id FROM gallery WHERE title = 'MoMA'));

-- Insert into profile
INSERT INTO profile (id, profilename, email) VALUES
    (gen_random_uuid(), 'john_doe', 'john.doe@example.com'),
    (gen_random_uuid(), 'jane_smith', 'jane.smith@example.com');

-- Insert into profile_artwork
INSERT INTO profile_artwork (profile_id, artwork_id) VALUES
    ((SELECT id FROM profile WHERE profilename = 'john_doe'), (SELECT id FROM artwork WHERE title = 'Water Lilies')),
    ((SELECT id FROM profile WHERE profilename = 'jane_smith'), (SELECT id FROM artwork WHERE title = 'Les Demoiselles dAvignon'));
