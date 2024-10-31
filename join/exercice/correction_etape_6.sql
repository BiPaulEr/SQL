SELECT 
    info.nom_batiment, 
    (loyers.loyer_moyen_mensuel / info.surface_totale_m2) AS loyer_moyen_par_m2
FROM 
    batiments_info AS info
JOIN 
    batiments_loyers AS loyers ON info.id = loyers.id
ORDER BY loyer_moyen_par_m2 DESC;
