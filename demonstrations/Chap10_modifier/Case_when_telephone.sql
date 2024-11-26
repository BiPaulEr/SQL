CREATE TABLE contacts (
    id SERIAL PRIMARY KEY,      
    nom VARCHAR(50),        
    telephone VARCHAR(20)       
);

INSERT INTO contacts (nom, telephone)
VALUES
    ('Alice', '0612345678'),
    ('Bob', '+33612345678'),
    ('Claire', '0033612345678');

UPDATE contacts
SET telephone = 
    CASE
        WHEN telephone LIKE '06%' THEN '+336' || SUBSTRING(telephone FROM 3)
        WHEN telephone LIKE '0033%' THEN '+33' || SUBSTRING(telephone FROM 5)
        ELSE telephone
    END;

SELECT *
FROM contacts;
