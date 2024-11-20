CREATE TABLE zip_codes (
    zip_code varchar(5),
    city VARCHAR(10)
);

COPY zip_codes (zip_code, city)
FROM 'C:/Users/PaulE/SQL/data/Chap10_modifier/zip_codes.csv'
WITH (FORMAT CSV, DELIMITER ',', HEADER ON);

CREATE TABLE utilisateurs (
    id bigserial PRIMARY KEY,
	user_name varchar(20),
	email varchar(50),
	zip_code varchar(5),
    city VARCHAR(10)
);

COPY utilisateurs
FROM 'C:/Users/PaulE/SQL/data/Chap10_modifier/utilisateurs.csv'
WITH (FORMAT CSV, DELIMITER ',', HEADER ON);
