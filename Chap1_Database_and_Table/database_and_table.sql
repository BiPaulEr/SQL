CREATE DATABASE library_system;

CREATE TABLE books (
    id bigserial,
    title varchar(100),
    author varchar(50),
    genre varchar(30),
    publication_year date,
    available_copies integer
);

INSERT INTO books (title, author, genre, publication_year, available_copies)
VALUES 
    ('Le Petit Prince', 'Antoine de Saint-Exupéry', 'Fiction', '1943-04-06', 5),
    ('1984', 'George Orwell', 'Dystopian', '1949-06-08', 8),
    ('LÉtranger', 'Albert Camus', 'Philosophical', '1942-05-07', 3),
    ('Pride and Prejudice', 'Jane Austen', 'Romance', '1813-01-28', 10),
    ('To Kill a Mockingbird', 'Harper Lee', 'Fiction', '1960-07-11', 4);