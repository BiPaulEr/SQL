CREATE TABLE books_import
(
    title VARCHAR(255),
    auteur VARCHAR(255),
    genre VARCHAR(100),
    prix numeric(5,2),
	adress VARCHAR(300)
);


COPY books_import FROM 'C:/Users/PaulE/SQL/demonstrations/Chap4_import_export/import/Books/books_import.csv'
WITH (FORMAT CSV, DELIMITER ',', QUOTE '"', HEADER)