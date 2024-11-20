CREATE TABLE fake_adresses (
longitude numeric(10,6),
latitude numeric(10,6),
street_number varchar(10),
street varchar(32),
unit varchar(12),
postcode varchar(5),
id bigserial PRIMARY KEY
);

COPY fake_adresses (street_number, street, unit, postcode, longitude, latitude)
FROM 'C:/Users/PaulE/SQL/demonstrations/Chap8_index/fake_addresses.csv'
WITH (FORMAT CSV, HEADER);

SELECT * FROM fake_adresses
WHERE street = 'Rivera Fall';
SELECT * FROM fake_adresses
WHERE street = 'Kyle Cove';
SELECT * FROM fake_adresses
WHERE street = 'Logan Avenue';

CREATE INDEX street_idx ON fake_adresses (street);

EXPLAIN ANALYZE SELECT * FROM fake_adresses
WHERE street = 'Rivera Fall';