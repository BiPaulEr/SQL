CREATE TABLE rank_ventes (
    region VARCHAR(50),
    annee INT,
    ventes INT
);

INSERT INTO rank_ventes (region, annee, ventes)
VALUES 
    ('Nord', 2022, 500),
    ('Nord', 2023, 550),
    ('Sud', 2022, 550),
    ('Sud', 2023, 700);

SELECT region,
       annee,
       ventes,
       RANK() OVER(ORDER BY ventes DESC) AS rank,
       DENSE_RANK() OVER(ORDER BY ventes DESC) AS dense_rank
FROM rank_ventes;

INSERT INTO rank_ventes (region, annee, ventes)
VALUES 
    ('Nord', 2021, 200),
    ('Sud', 2021, 550),
    ('Sud', 2020, 200);

SELECT region,
       annee,
       ventes,
       RANK() OVER(PARTITION BY region ORDER BY ventes DESC) AS rank,
       DENSE_RANK() OVER(PARTITION BY region ORDER BY ventes DESC) AS dense_rank
FROM rank_ventes;

SELECT 
    REGEXP_MATCH('figeac@figeac.com', '^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$') AS Valide,
	REGEXP_MATCH('figeac@', '^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$') AS Invalide
	