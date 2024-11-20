CREATE TABLE users_import (
    nom VARCHAR(255),
    email VARCHAR(255),
    ville VARCHAR(100),
    age INT
);

COPY users_import  FROM 'C:/Users/PaulE/SQL/import/Users/users.csv' WITH (FORMAT CSV, HEADER, DELIMITER ',');