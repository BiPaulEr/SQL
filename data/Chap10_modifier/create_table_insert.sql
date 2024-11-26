CREATE TABLE zip_codes (
    zip_code varchar(5),
    city VARCHAR(10)
);

INSERT INTO zip_codes (zip_code, city)
VALUES
('75001', 'Paris'),
('31000', 'Toulouse'),
('98005', 'Nice'),
('75002', 'Paris');

CREATE TABLE utilisateurs (
    id bigserial PRIMARY KEY,
	user_name varchar(20),
	email varchar(50),
	zip_code varchar(5),
    city VARCHAR(10)
);

INSERT INTO utilisateurs (user_name, email, zip_code, city)
VALUES
('Alice', 'alice.smith#gmail.com', '751', 'Paris'),
('Bob', 'bob.jackson@domain.com', '31A0', 'Toulouse'),
('Charlie', 'charlie.doe@outlook.com', '98T05', 'Nice'),
('David', 'dave123@domain.com', '00000', 'Paris');