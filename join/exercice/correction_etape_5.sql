SELECT 
    info.nom_batiment, 
    loyers.loyer_moyen_mensuel, 
    (satisfaction.note_service + satisfaction.note_qualite + satisfaction.note_equipements) / 3 AS moyenne_des_notes
FROM 
    batiments_info AS info
JOIN 
    batiments_loyers AS loyers ON info.id = loyers.id
JOIN 
    batiments_satisfaction AS satisfaction ON info.id = satisfaction.id
ORDER BY moyenne_des_notes DESC