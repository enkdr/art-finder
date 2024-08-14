-- dummy data
-- Insert into the styles table
INSERT INTO styles (id, name) VALUES
    (gen_random_uuid(), 'Abstract'),
    (gen_random_uuid(), 'Impressionism'),
    (gen_random_uuid(), 'Realism');

-- Insert into the gallery table
INSERT INTO gallery (id, title, location, notes) VALUES
    (gen_random_uuid(), 'National Gallery', ST_GeogFromText('SRID=4326;POINT(-77.0427 38.8921)'), 'A renowned art gallery in Washington, D.C.'),
    (gen_random_uuid(), 'Tate Modern', ST_GeogFromText('SRID=4326;POINT(-0.0984 51.5076)'), 'An art gallery located in London, known for its contemporary art collections.');

-- Insert into the artist table
INSERT INTO artist (id, first_name, last_name, bio, nationality, styles_id) VALUES
    (gen_random_uuid(), 'Claude', 'Monet', 'A French painter and a founder of French Impressionist painting.', 'French', (SELECT id FROM styles WHERE name = 'Impressionism')),
    (gen_random_uuid(), 'Pablo', 'Picasso', 'A Spanish painter and sculptor, a major figure in the development of modern art.', 'Spanish', (SELECT id FROM styles WHERE name = 'Abstract')),
    (gen_random_uuid(), 'Gustav', 'Klimt', 'An Austrian symbolist painter and one of the most prominent members of the Vienna Secession movement.', 'Austrian', (SELECT id FROM styles WHERE name = 'Realism'));

-- Insert into the artwork table
INSERT INTO artwork (id, artist_id, title, description, year, type_id, location, gallery_id) VALUES
    (gen_random_uuid(), (SELECT id FROM artist WHERE first_name = 'Claude'), 'Water Lilies', 'A series of approximately 250 oil paintings depicting Claude Monets flower garden at Giverny.', 1919, (SELECT id FROM artist WHERE first_name = 'Claude'), ST_GeogFromText('SRID=4326;POINT(-77.0427 38.8921)'), (SELECT id FROM gallery WHERE title = 'National Gallery')),
    (gen_random_uuid(), (SELECT id FROM artist WHERE first_name = 'Pablo'), 'Les Demoiselles dAvignon', 'A large oil painting by Pablo Picasso, considered a masterpiece of modern art.', 1907, (SELECT id FROM artist WHERE first_name = 'Pablo'), ST_GeogFromText('SRID=4326;POINT(-0.0984 51.5076)'), (SELECT id FROM gallery WHERE title = 'Tate Modern')),
    (gen_random_uuid(), (SELECT id FROM artist WHERE first_name = 'Gustav'), 'The Kiss', 'An iconic painting by Gustav Klimt, widely recognized for its decorative and sensual qualities.', 1908, (SELECT id FROM artist WHERE first_name = 'Gustav'), ST_GeogFromText('SRID=4326;POINT(-77.0427 38.8921)'), (SELECT id FROM gallery WHERE title = 'National Gallery'));

-- Insert into the profile table
INSERT INTO profile (id, profilename, email) VALUES
    (gen_random_uuid(), 'art_lover', 'art_lover@example.com'),
    (gen_random_uuid(), 'museum_visitor', 'museum_visitor@example.com');

-- Insert into the profile_artwork table
INSERT INTO profile_artwork (profile_id, artwork_id) VALUES
    ((SELECT id FROM profile WHERE profilename = 'art_lover'), (SELECT id FROM artwork WHERE title = 'Water Lilies')),
    ((SELECT id FROM profile WHERE profilename = 'museum_visitor'), (SELECT id FROM artwork WHERE title = 'Les Demoiselles dAvignon'));
