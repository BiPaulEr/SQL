CREATE TABLE batiments_info (
    id SERIAL PRIMARY KEY,
    nom_batiment VARCHAR(50),
    nombre_appartements INTEGER,
    surface_totale_m2 DECIMAL
);

COPY batiments_info (id, nom_batiment, nombre_appartements, surface_totale_m2) 
FROM 'C:/Users/PaulE/SQL/join/exercice_data/batiments_info.csv' WITH (DELIMITER ',', FORMAT CSV, HEADER);