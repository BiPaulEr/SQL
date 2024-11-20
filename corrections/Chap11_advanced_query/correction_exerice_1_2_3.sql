--Exercice 1

SELECT modele 
FROM parapluies
WHERE id = (
	SELECT parapluie_id
	FROM ventes
	GROUP BY parapluie_id
	ORDER BY SUM(quantite) DESC
	LIMIT 1
);

--Exercice 2
SELECT modele as modele_vendu
FROM parapluies
WHERE EXISTS (
	SELECT 1
	FROM ventes
	WHERE parapluies.id = ventes.parapluie_id
);

SELECT modele as modele_pas_vendu
FROM parapluies
WHERE NOT EXISTS (
	SELECT 1
	FROM ventes
	WHERE parapluies.id = ventes.parapluie_id
);

--Exercice 3
SELECT parapluies.modele, 
	   ventes_par_parapluie.nb_ventes * parapluies.prix as CA,
	   ventes_par_parapluie.quantite as moyenne_de_vente
FROM 
	(SELECT parapluie_id, SUM(quantite) as nb_ventes, AVG(quantite) as quantite
	FROM ventes
	GROUP BY parapluie_id) AS ventes_par_parapluie
JOIN parapluies 
ON parapluies.id = ventes_par_parapluie.parapluie_id
ORDER BY ventes_par_parapluie.nb_ventes * parapluies.prix DESC;