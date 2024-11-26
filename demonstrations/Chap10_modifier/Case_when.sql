
CREATE TABLE candidats_bac (
    id SERIAL PRIMARY KEY,   
    nom VARCHAR(50),         
    note DECIMAL(5,2)       
);
INSERT INTO candidats_bac (nom, note)
VALUES
    ('Alice', 18),
    ('Bob', 13),
    ('Claire', 9),
    ('David', 4);

SELECT nom, note,
    CASE
        WHEN note >= 16 THEN 'Très bien'
        WHEN note >= 12 THEN 'Bien'
        WHEN note >= 10 THEN 'Assez bien'
        ELSE 'Non admis'
    END AS mention
FROM candidats_bac;