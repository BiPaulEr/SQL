CREATE TABLE restaurant_ratings_etat (
    id bigserial,
    restaurant_name varchar(50),
    city varchar(30),
    rating numeric(2,1),
    cuisine_type varchar(30),
    comments text,
    etat varchar(10)
);

CREATE TEMPORARY TABLE restaurant_ratings_temp (LIKE restaurant_ratings_etat );

COPY restaurant_ratings_temp (restaurant_name, city, rating, cuisine_type, comments)
FROM 'C:/Users/PaulE/SQL/emonstrations/Chap4_import_export/import/default_value/restaurant_ratings.csv'
WITH (FORMAT CSV, HEADER);

INSERT INTO restaurant_ratings_etat (restaurant_name, city, rating, cuisine_type, comments, etat)
SELECT restaurant_name, city, rating, cuisine_type, comments, 'ferme'
FROM restaurant_ratings_temp;

DROP TABLE restaurant_ratings_temp;