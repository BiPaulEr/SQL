CREATE TABLE age (
    ages integer
);

INSERT INTO age (ages) VALUES
(9), (10), (10), (11), (12), (13), (46);

SELECT 
    percentile_cont(0.5) WITHIN GROUP (ORDER BY ages) AS "Mediane Continue",
    percentile_disc(0.5) WITHIN GROUP (ORDER BY ages) AS "Mediane Discrete"
FROM 
    age;
