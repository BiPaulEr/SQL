--Exerice 1

WITH ventes_par_parapluie AS (
    SELECT parapluie_id, 
           SUM(quantite) AS nb_ventes, 
           AVG(quantite) AS quantite
    FROM ventes
    GROUP BY parapluie_id
)
SELECT parapluies.modele, 
       ventes_par_parapluie.nb_ventes * parapluies.prix AS CA,
       ventes_par_parapluie.quantite AS moyenne_de_vente
FROM ventes_par_parapluie
JOIN parapluies 
ON parapluies.id = ventes_par_parapluie.parapluie_id
ORDER BY CA DESC;

--Exerice 2
WITH moyenne_ventes AS (
    SELECT AVG(quantite) AS moyenne
    FROM ventes
)
SELECT parapluies.modele, 
       SUM(ventes.quantite) AS total_ventes
FROM parapluies
JOIN ventes ON parapluies.id = ventes.parapluie_id
CROSS JOIN moyenne_ventes m
GROUP BY parapluies.modele
HAVING SUM(ventes.quantite) > m.moyenne;
