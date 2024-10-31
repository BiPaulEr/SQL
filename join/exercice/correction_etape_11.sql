SELECT 
    PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY loyers.loyer_moyen_mensuel) AS percentile_25,
    PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY loyers.loyer_moyen_mensuel) AS percentile_50,
    PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY loyers.loyer_moyen_mensuel) AS percentile_75
FROM 
    batiments_loyers AS loyers;