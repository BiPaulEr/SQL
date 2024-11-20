CREATE TABLE library (
    id SERIAL PRIMARY KEY,
    titre VARCHAR(50),
    genre VARCHAR(30),
    emprunts INT
);

INSERT INTO library (titre, genre, emprunts) VALUES
    ('Le Petit Prince', 'Fiction', 150),
    ('1984', 'Fiction', 200),
    ('Sapiens', 'Non-fiction', NULL),
    ('Homo Deus', 'Non-fiction', 250);

SELECT genre, SUM(emprunts) AS total_emprunts, AVG(emprunts) AS emprunts_moyens
FROM library
GROUP BY genre;

INSERT INTO library (titre, genre, emprunts) VALUES
    ('Une vie',	'Fiction', 150),
    ('Le Mythe de Sisyphe', 'Philosophie', 210);

SELECT genre, COUNT(*) AS asterix, COUNT(emprunts) AS COUNT_emprunts, 
COUNT(DISTINCT emprunts) as DISTINCT_COUNT_emprunts
FROM library
GROUP BY genre;

SELECT genre, MAX(emprunts) AS max_emprunts
FROM library
GROUP BY genre
ORDER BY max_emprunts DESC;


SELECT genre, SUM(emprunts) AS total_emprunts
FROM library
GROUP BY genre
HAVING SUM(emprunts) > 250
ORDER BY total_emprunts DESC;

