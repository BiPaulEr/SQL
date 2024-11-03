-- Etape 1 :
CREATE TABLE bibliotheque (
    id SERIAL PRIMARY KEY,
    titre varchar(255),
    genre varchar(50),
    auteur varchar(255),
    annee_publication integer,
    emprunts integer,
    avis numeric(3, 1)
);

COPY bibliotheque(id, titre, genre, auteur, annee_publication, emprunts, avis)
FROM 'C:/Users/PaulE/SQL/group_by_having/bibliotheque_data.csv'
DELIMITER ',' CSV HEADER;
--Etape 2 :
SELECT genre, COUNT(*) AS nombre_total_livres_par_genre
FROM bibliotheque
GROUP BY genre;
--Etape 3 :
SELECT genre, COUNT(*) AS nombre_total_livres_par_genre
FROM bibliotheque
WHERE genre = 'Non-fiction'
GROUP BY genre;
--Etape 4 :
SELECT genre, COUNT(*) as nombre_total_livres_par_genre, COUNT(emprunts) AS nombre_emprunts_non_null_par_genre
FROM bibliotheque
WHERE genre = 'Non-fiction'
GROUP BY genre;
--Etape 5 :
SELECT genre, COUNT(DISTINCT auteur) as nombre_auteur_par_genre 
FROM bibliotheque
GROUP BY genre
ORDER BY nombre_auteur_par_genre DESC;
--Etape 6 :
SELECT genre, SUM(DISTINCT emprunts) as nombre_emprunts_par_genre 
FROM bibliotheque
GROUP BY genre
ORDER BY nombre_emprunts_par_genre DESC;
--Etape 7 :
SELECT genre, COUNT(DISTINCT titre) as nombre_titre_par_genre, avg(emprunts) as nombre_moyen_demprunt_par_genre 
FROM bibliotheque
GROUP BY genre
HAVING COUNT(DISTINCT titre) > 3 and avg(emprunts) < 200;
--Etape 8
SELECT annee_publication, COUNT(*) AS nombre_publications
FROM bibliotheque
GROUP BY annee_publication
ORDER BY nombre_publications DESC;
--Etape 9
SELECT genre, auteur, AVG(emprunts) AS avg_emprunts, AVG(avis) AS avg_avis
FROM bibliotheque
GROUP BY genre, auteur;