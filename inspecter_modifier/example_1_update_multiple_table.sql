CREATE TABLE numbers (
    id SERIAL PRIMARY KEY,
    company_id integer REFERENCES producteurs(id),
    phone_number varchar(14)
);

INSERT INTO numbers (company_id, phone_number) VALUES
(1, '01 66 76 66 67'),
(2, '01 22 23 24 25'),
(3, '01 10 01 10 01');

ALTER TABLE producteurs ADD COLUMN phone_number VARCHAR(14);

UPDATE producteurs
SET phone_number = numbers.phone_number
FROM numbers
WHERE producteurs.id = numbers.company_id;

SELECT * 
FROM producteurs;