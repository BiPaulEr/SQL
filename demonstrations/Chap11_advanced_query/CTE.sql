WITH cities AS ( 
    SELECT etat, COUNT(*) AS nb_villes
    FROM population_villes
    GROUP BY etat
),
census AS (
    SELECT etat, sum(population) AS population_etat
    FROM population_villes
    GROUP BY etat
)

SELECT census.etat,
       census.population_etat,
       cities.nb_villes,
       ROUND((cities.nb_villes / census.population_etat::numeric) * 1000000,2) AS villes_par_million
FROM cities
JOIN census
ON cities.etat = census.etat
ORDER BY villes_par_million DESC;

WITH mediane_nationale(md) AS (
	SELECT percentile_cont(0.5) WITHIN GROUP (ORDER BY population) 
	FROM population_villes
)
SELECT nom_ville,
       etat,
       population AS population_totale,
       mediane_nationale.md,
       population - mediane_nationale.md AS ecart_median
FROM population_villes, mediane_nationale
WHERE (population - mediane_nationale.md) BETWEEN -100000 AND 100000;