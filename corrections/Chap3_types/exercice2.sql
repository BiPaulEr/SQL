CREATE TABLE abonnements( 
id_abonnement bigserial,
date_debut date);

INSERT INTO abonnements (date_debut) VALUES
('2024-01-01'),
('2024-02-15'),
('2024-03-10');

SELECT date_debut,
    date_debut + '90 days' AS date_fin
FROM abonnements;