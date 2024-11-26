CREATE TABLE revenu (
    salaire integer
);

INSERT INTO revenu (salaire) VALUES
(500), (1000), (1500), (2000), (3000), (4000), (4500), (50000);

--Version 1
SELECT
	percentile_cont(0.25) WITHIN GROUP (ORDER BY salaire) AS "1er quartile",
	percentile_cont(0.5) WITHIN GROUP (ORDER BY salaire) AS "mediane",
	percentile_cont(0.75) WITHIN GROUP (ORDER BY salaire) AS "3e quartiles",
 	SUM(salaire) AS "total_revenus",
	AVG(salaire) AS "avg_revenus"
FROM revenu;

--Version 2
SELECT
unnest(
	percentile_cont(array[0.25,0.5,0.75]) WITHIN GROUP (ORDER BY salaire) AS "quartiles",
 	SUM(salaire) AS "total_revenus",
	AVG(salaire) AS "avg_revenus"
)
FROM revenu;