CREATE TABLE revenu (
    salaire integer
);

INSERT INTO age (ages) VALUES
(500), (1000), (1500), (2000), (3000), (4000), (4500), (50000);

SELECT
unnest(
	percentile_cont(array[0.25, 0.5, 0.75])
	WITHIN GROUP (ORDER BY salaire)
	) AS "quartiles_revenus",
 	SUM(salaire) AS "total_revenus",
	AVG(salaire) AS "avg_revenus"
FROM revenus;