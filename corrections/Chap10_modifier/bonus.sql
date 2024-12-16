--Etape 1
CREATE TABLE clients (
    id INT,
    client VARCHAR(50),
    email VARCHAR(100),
    abonnement INT
);

INSERT INTO clients (id, client, email, abonnement)
VALUES
    (1, 'Alice', 'alice@mycompany.com', 250),
    (2, 'Bob', 'bob@yahoo.com', 75),
    (3, 'Claire', 'claire@modernmail.com', 450),
    (4, 'David', 'david@hotmail.com', 125);

--Etape 2
ALTER TABLE clients
ADD COLUMN categorie VARCHAR(20);

UPDATE clients
SET categorie = 
    CASE
        WHEN abonnement >= 400 THEN 'Premium'
        WHEN abonnement BETWEEN 200 AND 399 THEN 'Standard'
        WHEN abonnement < 200 THEN 'Economique'
    END;

--Etape 3
UPDATE clients
SET email = 
    CASE
        WHEN email LIKE '%@mycompany.com' THEN REPLACE(email, '@mycompany.com', '@corporate.com')
        WHEN email LIKE '%@yahoo.com' THEN REPLACE(email, '@yahoo.com', '@yahoo.fr')
        WHEN email LIKE '%@modernmail.com' THEN REPLACE(email, '@modernmail.com', '@futuremail.org')
        ELSE email
    END;
