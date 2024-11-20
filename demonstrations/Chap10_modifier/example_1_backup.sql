CREATE TABLE producteurs_backup AS
SELECT * FROM producteurs;

SELECT
    (SELECT count(*) FROM producteurs) AS original,
    (SELECT count(*) FROM producteurs_backup) AS backup;

ALTER TABLE producteurs ADD COLUMN city_copy varchar(50);
UPDATE producteurs 
SET city_copy = city;

SELECT city_copy, city
FROM producteurs
ORDER BY city;

UPDATE producteurs
SET city = 'Toulouse'
WHERE id = 3;

UPDATE producteurs 
SET city = city_copy;

UPDATE producteurs AS original
SET city = backup.city
FROM producteurs_backup AS backup
WHERE original.id = backup.id;

ALTER TABLE producteurs
ADD COLUMN zip_copy varchar(5);

UPDATE producteurs 
SET zip = zip_copy;

UPDATE producteurs
SET zip_copy = zip || '000'
WHERE length(zip) = 2;

SELECT length(zip) AS longueur, COUNT(*) AS nombre
FROM producteurs
GROUP BY longueur;

