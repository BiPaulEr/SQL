CREATE TABLE batiments_satisfaction (
    id INTEGER REFERENCES batiments_info(id),
    note_service DECIMAL,
    note_qualite DECIMAL,
    note_equipements DECIMAL
);

COPY batiments_satisfaction (id, note_service, note_qualite, note_equipements) 
FROM 'C:/Users/PaulE/SQL/join/exercice_data/batiments_satisfaction.csv' WITH(DELIMITER ',', FORMAT CSV, HEADER);