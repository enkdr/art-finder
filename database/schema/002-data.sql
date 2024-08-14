-- Insert into the artist table
INSERT INTO artist (id, first_name, last_name, bio, nationality, style_id)
VALUES
    (gen_random_uuid(), 'Pablo', 'Picasso', 'A Spanish painter, sculptor, printmaker, ceramicist and theatre designer', 'Spanish', NULL),
    (gen_random_uuid(), 'Frida', 'Kahlo', 'A Mexican painter known for her many portraits and works inspired by the nature and artifacts of Mexico', 'Mexican', NULL);

-- Insert into the style table
INSERT INTO style (id, name)
VALUES
    (gen_random_uuid(), 'Cubism'),
    (gen_random_uuid(), 'Surrealism');

-- Assuming the style_id in the artist table refers to a style table entry
UPDATE artist SET style_id = (SELECT id FROM style WHERE name = 'Cubism') WHERE first_name = 'Pablo';
UPDATE artist SET style_id = (SELECT id FROM style WHERE name = 'Surrealism') WHERE first_name = 'Frida';

-- Insert into the gallery table
INSERT INTO gallery (id, title, location, notes)
VALUES
    (gen_random_uuid(), 'The Metropolitan Museum of Art', ST_GeogFromText('SRID=4326;POINT(-73.9632 40.7794)'), 'One of the worlds largest and finest art museums.'),
    (gen_random_uuid(), 'Museo Frida Kahlo', ST_GeogFromText('SRID=4326;POINT(-99.1627 19.3559)'), 'Also known as the Blue House, it is a historic house museum dedicated to the life and work of Mexican artist Frida Kahlo.');

-- Insert into the artwork table
INSERT INTO artwork (id, artist_id, title, description, type_id, location, gallery_id)
VALUES
    (gen_random_uuid(), (SELECT id FROM artist WHERE first_name = 'Pablo'), 'Les Demoiselles dAvignon', 'A large oil painting considered as the most famous example of Cubism.', (SELECT id FROM artist WHERE first_name = 'Pablo'), ST_GeogFromText('SRID=4326;POINT(-73.9632 40.7794)'), (SELECT id FROM gallery WHERE title = 'The Metropolitan Museum of Art')),
    (gen_random_uuid(), (SELECT id FROM artist WHERE first_name = 'Frida'), 'The Two Fridas', 'An oil painting which depicts two versions of Kahlo seated together.', (SELECT id FROM artist WHERE first_name = 'Frida'), ST_GeogFromText('SRID=4326;POINT(-99.1627 19.3559)'), (SELECT id FROM gallery WHERE title = 'Museo Frida Kahlo'));

-- Insert into the users table
INSERT INTO users (id, username, email)
VALUES
    (gen_random_uuid(), 'artlover', 'artlover@example.com'),
    (gen_random_uuid(), 'gallerygoer', 'gallerygoer@example.com');

-- Insert into the user_artwork table
INSERT INTO user_artwork (user_id, artwork_id)
VALUES
    ((SELECT id FROM users WHERE username = 'artlover'), (SELECT id FROM artwork WHERE title = 'Les Demoiselles dAvignon')),
    ((SELECT id FROM users WHERE username = 'gallerygoer'), (SELECT id FROM artwork WHERE title = 'The Two Fridas'));
