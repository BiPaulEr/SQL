CREATE TABLE pets_import (
    establishment_id bigserial,
    establishment_name VARCHAR(255),
    number_of_pets INTEGER,
    type_of_establishment VARCHAR(100),
    address VARCHAR(300)
);

COPY pets_import 
FROM 'C:/Users/PaulE/SQL/import/Pets/pets_import.csv' 
WITH (FORMAT CSV, DELIMITER '|', HEADER OFF);

