CREATE TABLE restaurant_ratings (
    id bigserial,
    restaurant_name varchar(50),
    city varchar(30),
    rating numeric(2,1),
    cuisine_type varchar(30),
    comments text
);

COPY restaurant_ratings
FROM 'C:/Users/PaulE/SQL/demonstrations/Chap4_import_export/import/subsequences/restaurant_ratings.csv'
WITH (FORMAT CSV, DELIMITER ',', QUOTE '"', HEADER ON);

COPY restaurant_ratings (restaurant_name, city, rating, cuisine_type, comments)
FROM 'C:/Users/PaulE/SQL/demonstrations/Chap4_import_export/import/subsequences/restaurant_ratings.csv'
WITH (FORMAT CSV, DELIMITER ',', QUOTE '"', HEADER ON);