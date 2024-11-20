--Etape 1
CREATE TABLE music_albums_import (
    album_id INT,
    album_name VARCHAR(100),
    artist VARCHAR(100),
    release_year INT,
    genre VARCHAR(50)
);

COPY music_albums_import 
FROM 'C:/Users/PaulE/SQL/data/Chap4_import_export/import/music_albums.csv'
WITH (FORMAT CSV, DELIMITER ',', HEADER ON);

--Etape 2
CREATE TABLE movie_ratings_import (
    movie_id INT,
    movie_title VARCHAR(100),
    director VARCHAR(100),
    release_year INT,
    rating NUMERIC(3, 1)
);

COPY movie_ratings_import 
FROM 'C:/Users/PaulE/SQL/data/Chap4_import_export/import/movie_ratings.csv'
WITH (FORMAT CSV, DELIMITER ',', QUOTE '"', HEADER ON);

--Etape 3
CREATE TABLE coffee_orders_import (
    order_id INT,
    customer_name VARCHAR(100),
    coffee_type VARCHAR(50),
    size VARCHAR(20),
    price NUMERIC(5, 2)
);

COPY coffee_orders_import 
FROM 'C:/Users/PaulE/SQL/data/Chap4_import_export/import/coffee_orders.csv'
WITH (FORMAT CSV, HEADER ON, DELIMITER '|');

--Etape 4
CREATE TABLE travel_destinations_import (
    destination_id INT,
    city VARCHAR(50),
    country VARCHAR(50),
    cost INT
);

COPY travel_destinations_import 
FROM 'C:/Users/PaulE/SQL/data/Chap4_import_export/import/travel_destinations.csv'
WITH (FORMAT CSV, DELIMITER ',', HEADER OFF);
