SELECT 
    SUM(info.nombre_appartements) AS nombre_total_appartements,
    AVG(info.surface_totale_m2 / info.nombre_appartements) AS surface_moyenne
FROM 
    batiments_info AS info;
