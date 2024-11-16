--Etape 1
BEGIN TRANSACTION;

UPDATE utilisateurs_backup as b
SET user_name = u.user_name, email = u.email, 
zip_code = u.zip_code, city = u.city
FROM utilisateurs as u
WHERE b.id = u.id;

SELECT * FROM utilisateurs_backup;

-- sauvegarde
COMMIT;

--Etape 2
SELECT * FROM utilisateurs_backup;

--Etape 3
BEGIN TRANSACTION;

ALTER TABLE utilisateurs_backup DROP COLUMN city;

SELECT * FROM utilisateurs_backup;

--Etape 4

ROLLBACK;

SELECT * FROM utilisateurs_backup;

--Etape 5
BEGIN TRANSACTION;

COMMANDE ERRONE;
--Etape 6
SELECT * from utilisateurs_backup;
--ERREUR

--Etape 7
ROLLBACK;

SELECT * from utilisateurs_backup;
