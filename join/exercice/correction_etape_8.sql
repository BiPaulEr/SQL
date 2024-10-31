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
