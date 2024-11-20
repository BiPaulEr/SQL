CREATE TABLE population_villes (
    nom_ville VARCHAR(50),
    etat VARCHAR(2),
    population INTEGER
);

COPY population_villes(nom_ville, etat, population)
FROM 'C:/Users/PaulE/SQL/demonstrations/Chap11_advanced_query/example_1_data.csv'
WITH (DELIMITER ',', FORMAT CSV, HEADER);

SELECT * FROM population_villes;

SELECT nom_ville, etat, population
FROM population_villes
WHERE population >= (
    SELECT percentile_cont(0.85) WITHIN GROUP (ORDER BY population)
    FROM population_villes
)
ORDER BY population DESC;

CREATE TABLE population_villes_top15 AS
SELECT * FROM population_villes;

DELETE FROM population_villes_top15
WHERE population < (
    SELECT percentile_cont(0.85) WITHIN GROUP (ORDER BY population)
    FROM population_villes_top15
);

SELECT * FROM population_villes_top15;

-- SUBQUERY + JOIN

SELECT avg(population) AS average,
       percentile_cont(0.5) WITHIN GROUP (ORDER BY population) AS mediane
FROM population_villes

SELECT calcs.average AS moyenne,
       calcs.mediane,
       calcs.average - calcs.mediane AS ecart_moyenne_mediane
FROM (
    SELECT avg(population) AS average,
            percentile_cont(0.5) WITHIN GROUP (ORDER BY population) AS mediane
    FROM population_villes
) AS calcs;

-- SUBQUERY + JOIN
SELECT etat, COUNT(*) AS nb_villes
FROM population_villes
GROUP BY etat;

SELECT etat, sum(population) AS population_etat
FROM population_villes
GROUP BY etat;

SELECT census.etat,
       census.population_etat,
       cities.nb_villes,
       ROUND((cities.nb_villes / census.population_etat::numeric) * 1000000,1) AS villes_par_million
FROM (
    SELECT etat, COUNT(*) AS nb_villes
	FROM population_villes
	GROUP BY etat
) AS cities
JOIN (
    SELECT etat, sum(population) AS population_etat
	FROM population_villes
	GROUP BY etat
) AS census
ON cities.etat = census.etat
ORDER BY villes_par_million DESC;

--SUBQUERY - COLONNES 
SELECT nom_ville,
       etat,
       population AS population_totale,
       (SELECT percentile_cont(0.5) WITHIN GROUP (ORDER BY population)
        FROM population_villes) AS mediane_nationale
FROM population_villes;

SELECT nom_ville,
       etat,
       population AS population_totale,
       (SELECT percentile_cont(0.5) WITHIN GROUP (ORDER BY population)
        FROM population_villes) AS mediane_nationale,
       population - (SELECT percentile_cont(0.5) WITHIN GROUP (ORDER BY population)
                     FROM population_villes) AS ecart_median
FROM population_villes
WHERE (population - (SELECT percentile_cont(0.5) WITHIN GROUP (ORDER BY population)
                     FROM population_villes)) BETWEEN -100000 AND 100000;
