-- Création de la table
CREATE TABLE producteurs (
    id SERIAL PRIMARY KEY,
    company VARCHAR(100),
    city VARCHAR(50),
    st VARCHAR(2),
    zip VARCHAR(5)
);

-- Insertion des données
INSERT INTO producteurs (id, company, city, st, zip) VALUES
(1, 'Viande Delicieuse', 'Toulouse', '31', '31'),
(2, 'Poulet Parfait', NULL, '31', '31001'),
(3, 'Oeufs Frais', 'Bordeaux', NULL, '33000'),
(4, 'Viande Bio', 'Paris', '75', '75000');


SELECT id, company, city, st, zip
FROM producteurs
WHERE city IS NULL OR st IS NULL;

SELECT st, COUNT(*) AS st_count
FROM producteurs
GROUP BY st
ORDER BY st;

SELECT company, COUNT(*) AS company_count
FROM producteurs
GROUP BY company
ORDER BY company;

SELECT length(zip), COUNT(*) AS length_count
FROM producteurs
GROUP BY length(zip)
ORDER BY length(zip) ASC;