SELECT 
    info.nom_batiment, 
    satisfaction.note_service, 
    satisfaction.note_qualite, 
    satisfaction.note_equipements
FROM 
    batiments_info AS info
JOIN 
    batiments_satisfaction AS satisfaction 
ON 
    info.id = satisfaction.id;
