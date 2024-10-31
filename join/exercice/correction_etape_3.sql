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
    info.id = loyers.id;code 