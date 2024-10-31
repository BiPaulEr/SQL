CREATE TABLE batiments_loyers (
    id INTEGER REFERENCES batiments_info(id),
    loyer_moyen_mensuel DECIMAL,
    loyer_min DECIMAL,
    loyer_max DECIMAL
);

COPY batiments_loyers (id, loyer_moyen_mensuel, loyer_min, loyer_max) 
FROM 'C:/Users/PaulE/SQL/join/exercice_data/batiments_loyers.csv'WITH (DELIMITER ',' CSV, HEADER); 