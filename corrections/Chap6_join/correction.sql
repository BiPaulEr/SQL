--Etape 1
CREATE TABLE batiments_info (
    id SERIAL PRIMARY KEY,
    nom_batiment VARCHAR(50),
    nombre_appartements INTEGER,
    surface_totale_m2 DECIMAL
);

CREATE TABLE batiments_loyers (
    id INTEGER REFERENCES batiments_info(id),
    loyer_moyen_mensuel DECIMAL,
    loyer_min DECIMAL,
    loyer_max DECIMAL
);
CREATE TABLE batiments_satisfaction (
    id INTEGER REFERENCES batiments_info(id),
    note_service DECIMAL,
    note_qualite DECIMAL,
    note_equipements DECIMAL
);

--Etape 2

COPY batiments_satisfaction (id, note_service, note_qualite, note_equipements) 
FROM 'C:/Users/PaulE/SQL/data/Chap6_join/batiments_satisfaction.csv' WITH(DELIMITER ',', FORMAT CSV, HEADER);

COPY batiments_loyers (id, loyer_moyen_mensuel, loyer_min, loyer_max) 
FROM 'C:/Users/PaulE/SQL/data/Chap6_join/batiments_loyers.csv'WITH (DELIMITER ',' CSV, HEADER); 

COPY batiments_info (id, nom_batiment, nombre_appartements, surface_totale_m2) 
FROM 'C:/Users/PaulE/SQL/data/Chap6_join/batiments_info.csv' WITH (DELIMITER ',', FORMAT CSV, HEADER);


--Etape 3
SELECT 
    info.nom_batiment, 
    info.surface_totale_m2, 
    info.nombre_appartements, 
    loyers.loyer_moyen_mensuel, 
    loyers.loyer_min, 
    loyers.loyer_max
FROM 
    batiments_info AS info
JOIN 
    batiments_loyers AS loyers 
ON 
    info.id = loyers.id;

--Etape 4
SELECT 
    info.nom_batiment, 
    satisfaction.note_service, 
    satisfaction.note_qualite, 
    satisfaction.note_equipements
FROM 
    batiments_info AS info
JOIN 
    batiments_satisfaction AS satisfaction 
ON 
    info.id = satisfaction.id;

--Etape 5
SELECT 
    info.nom_batiment, 
    loyers.loyer_moyen_mensuel, 
    (satisfaction.note_service + satisfaction.note_qualite + satisfaction.note_equipements) / 3 AS moyenne_des_notes
FROM 
    batiments_info AS info
JOIN 
    batiments_loyers AS loyers ON info.id = loyers.id
JOIN 
    batiments_satisfaction AS satisfaction ON info.id = satisfaction.id
ORDER BY moyenne_des_notes DESC;

--Etape 6
SELECT 
    info.nom_batiment, 
    (loyers.loyer_moyen_mensuel / info.surface_totale_m2) AS loyer_moyen_par_m2
FROM 
    batiments_info AS info
JOIN 
    batiments_loyers AS loyers ON info.id = loyers.id
ORDER BY loyer_moyen_par_m2 DESC;

--Etape 7
SELECT 
    info.nom_batiment, 
    (loyers.loyer_min::decimal / loyers.loyer_max) * 100 AS pourcentage_loyer_min_max
FROM 
    batiments_info AS info
JOIN 
    batiments_loyers AS loyers ON info.id = loyers.id;

--Etape 8
SELECT 
    info.nom_batiment, 
    loyers.loyer_moyen_mensuel, 
    info.nombre_appartements, 
    (loyers.loyer_moyen_mensuel * info.nombre_appartements) AS chiffre_affaires_total
FROM 
    batiments_info AS info
JOIN 
    batiments_loyers AS loyers ON info.id = loyers.id
ORDER BY chiffre_affaires_total DESC;

--Etape 9
SELECT 
    AVG(loyers.loyer_moyen_mensuel) AS loyer_moyen,
    SUM(loyers.loyer_moyen_mensuel * info.nombre_appartements) AS chiffre_affaires_total_global
FROM 
    batiments_info AS info
JOIN 
    batiments_loyers AS loyers ON info.id = loyers.id;

--Etape 10 
SELECT 
    SUM(info.nombre_appartements) AS nombre_total_appartements,
    AVG(info.surface_totale_m2 / info.nombre_appartements) AS surface_moyenne
FROM 
    batiments_info AS info;

--Etape 11
SELECT 
    PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY loyers.loyer_moyen_mensuel) AS percentile_25,
    PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY loyers.loyer_moyen_mensuel) AS percentile_50,
    PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY loyers.loyer_moyen_mensuel) AS percentile_75
FROM 
    batiments_loyers AS loyers;

