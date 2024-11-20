CREATE TABLE membres_club (
    id_membre bigserial,  
    nom VARCHAR(100),              
    date_inscription DATE,        
    cotisation_active BOOLEAN,      
    email VARCHAR(255),            
    montant_cotisation DECIMAL(4,2)
);

INSERT INTO membres_club (nom, date_inscription, cotisation_active, email, montant_cotisation)
VALUES ('Jean Dupont', '2024-01-15', TRUE, 'jean.dupont@email.com', 99.50),
('Marie Curie', '2023-09-10', FALSE, 'marie.curie@email.com', 15.99);