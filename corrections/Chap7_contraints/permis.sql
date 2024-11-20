--Etape 1
CREATE TABLE permis (
    id bigserial PRIMARY KEY,
    nom varchar(50),
    prenom varchar(50)
);

--Etape 2
INSERT INTO permis (nom, prenom) VALUES ('nom1', NULL);

--Etape 3
ALTER TABLE permis ALTER COLUMN nom SET NOT NULL;

INSERT INTO permis (nom, prenom) VALUES (NULL, 'prenom1'); --Not working

INSERT INTO permis (nom, prenom) VALUES ('NULL', 'prenom1');

--Etape 4
ALTER TABLE permis ALTER COLUMN prenom SET NOT NULL; --Not working because prenom is NULL for one row

DELETE FROM permis WHERE prenom IS NULL;

ALTER TABLE permis ALTER COLUMN prenom SET NOT NULL;

INSERT INTO permis (nom, prenom) VALUES ('nom2', NULL);

INSERT INTO permis (nom, prenom) VALUES ('nom2', 'prenom2');

INSERT INTO permis (nom, prenom) VALUES ('nom3', 'prenom3');

--Etape 5
DELETE FROM permis WHERE nom = 'NULL';

--Etape 6
ALTER TABLE permis ADD CONSTRAINT check_prenom_longueur CHECK (LENGTH(prenom) > 3);

ALTER TABLE permis ADD CONSTRAINT check_nom_longueur CHECK (LENGTH(nom) > 3);

--Etape 7
INSERT INTO permis (nom, prenom) VALUES ('nom', 'prenom3'); --not working

INSERT INTO permis (nom, prenom) VALUES ('nom4', 'pre'); --not working