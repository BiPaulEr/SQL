SELECT 
    info.nom_batiment, 
    (loyers.loyer_min::decimal / loyers.loyer_max) * 100 AS pourcentage_loyer_min_max
FROM 
    batiments_info AS info
JOIN 
    batiments_loyers AS loyers ON info.id = loyers.id;
