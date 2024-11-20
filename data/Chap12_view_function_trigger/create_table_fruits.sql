--Etape 1
CREATE TABLE ventes_fruits (
    fruit VARCHAR(50),
    annee INT,
    ventes INT
);

COPY ventes_fruits (fruit, annee, ventes)
FROM 'C:/Users/PaulE/SQL/data/Chap12_view_function_trigger/fruits.csv'
WITH (FORMAT CSV, DELIMITER ',', HEADER ON);