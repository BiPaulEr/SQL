SELECT 
    AVG(loyers.loyer_moyen_mensuel) AS loyer_moyen,
    SUM(loyers.loyer_moyen_mensuel * info.nombre_appartements) AS chiffre_affaires_total_global
FROM 
    batiments_info AS info
JOIN 
    batiments_loyers AS loyers ON info.id = loyers.id;
