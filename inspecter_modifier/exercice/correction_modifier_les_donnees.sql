--Etape 1
CREATE TABLE zip_codes (
    zip_code varchar(5),
    city VARCHAR(10)
);

COPY zip_codes (zip_code, city)
FROM 'C:/Users/PaulE/SQL/inspecter_modifier/exercice/zip_codes.csv'
WITH (FORMAT CSV, DELIMITER ',', HEADER ON);

CREATE TABLE utilisateurs (
    id bigserial PRIMARY KEY,
	user_name varchar(20),
	email varchar(50),
	zip_code varchar(5),
    city VARCHAR(10)
);

COPY utilisateurs
FROM 'C:/Users/PaulE/SQL/inspecter_modifier/exercice/utilisateurs.csv'
WITH (FORMAT CSV, DELIMITER ',', HEADER ON);

--Etape 2
CREATE TABLE utilisateurs_backup AS
(SELECT * FROM utilisateurs);

--Etape 3
ALTER TABLE utilisateurs ADD COLUMN email_copy varchar(50);

UPDATE utilisateurs 
SET email_copy = email;

SELECT * from utilisateurs;

--Etape 4
UPDATE utilisateurs
SET email_copy = 'alice.smith@gmail.com'
WHERE email_copy = 'alice.smith#gmail.com';

SELECT email_copy from utilisateurs;

--Etape 5 
UPDATE utilisateurs 
SET email = email_copy;

ALTER TABLE utilisateurs DROP email_copy;

SELECT * FROM utilisateurs;

--Etape 6
SELECT length(zip_code) as zip_longeur, COUNT(*) as zip_count
FROM utilisateurs
GROUP BY length(zip_code);

--Etape 7
ALTER TABLE utilisateurs ADD COLUMN zip_code_copy varchar(5);

SELECT * from utilisateurs;

--Etape 8
UPDATE utilisateurs
SET zip_code_copy = zip_code;

SELECT * from utilisateurs;

--Etape 9
UPDATE utilisateurs as u
SET zip_code_copy = z.zip_code
FROM zip_codes as z
WHERE u.city = z.city;

SELECT * from utilisateurs;

--Etape 10
UPDATE utilisateurs
SET zip_code = zip_code_copy;

ALTER TABLE utilisateurs DROP COLUMN zip_code_copy;

SELECT * from utilisateurs;