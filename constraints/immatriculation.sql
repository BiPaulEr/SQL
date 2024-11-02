-- Etape1
CREATE TABLE immatriculation (
    id bigserial PRIMARY KEY,
    num_immatriculation varchar(10),
    permis_id bigint REFERENCES permis(id)
);

--Etape 2
INSERT INTO immatriculation VALUES ('AA', 68);

INSERT INTO immatriculation (num_immatriculation, permis_id) VALUES ('AA', 6);
INSERT INTO immatriculation (num_immatriculation, permis_id) VALUES ('BB', 6);
INSERT INTO immatriculation (num_immatriculation, permis_id) VALUES ('CC', 7);
INSERT INTO immatriculation (num_immatriculation, permis_id) VALUES ('DD', 7);

--Etape 3
ALTER TABLE immatriculation ALTER COLUMN num_immatriculation SET NOT NULL;
ALTER TABLE immatriculation ADD CONSTRAINT unique_immatriculation_permis_id UNIQUE(num_immatriculation, permis_id);
INSERT INTO immatriculation (num_immatriculation, permis_id) VALUES ('AA', 6);

--Etape 4
ALTER TABLE immatriculation DROP CONSTRAINT unique_immatriculation_permis_id;
INSERT INTO immatriculation (num_immatriculation, permis_id) VALUES ('BB', 6);

--Etape 5
DELETE FROM permis WHERE prenom = 'prenom2' AND nom='nom2';
--Etape 6
ALTER TABLE immatriculation DROP CONSTRAINT immatriculation_permis_id_fkey;

ALTER TABLE immatriculation 
ADD CONSTRAINT immatriculation_permis_id_fkey 
FOREIGN KEY (permis_id)
REFERENCES permis(id) ON DELETE CASCADE;

--Etape 7
DELETE FROM permis WHERE prenom = 'prenom2' AND nom='nom2'; -- working !
