CREATE TABLE ventes_tondeuses (
    region VARCHAR(50),
    annee INT,
    ventes INT
);

COPY ventes_tondeuses (region, annee, ventes)
FROM 'C:/Users/PaulE/SQL/view_function_trigger/view.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM ventes_tondeuses;

CREATE OR REPLACE VIEW ventes_2022 AS
SELECT region, ventes
FROM ventes_tondeuses
WHERE annee = 2022
ORDER BY ventes DESC;

SELECT * from ventes_2022;

CREATE OR REPLACE VIEW ventes_2023 AS
SELECT region, ventes
FROM ventes_tondeuses
WHERE annee = 2023
ORDER BY ventes DESC;

SELECT * from ventes_2023;

SELECT v2023.region,
       v2023.ventes AS ventes_2023,
       v2022.ventes AS ventes_2022,
       ROUND(((v2023.ventes - v2022.ventes) / v2022.ventes::numeric) * 100, 1) AS pct_evolution
FROM ventes_2023 as v2023
JOIN ventes_2022 as v2022
  ON v2023.region = v2022.region

--materialized
CREATE MATERIALIZED VIEW ventes_2023_materialized AS
SELECT region, ventes
FROM ventes_tondeuses
WHERE annee = 2023
ORDER BY ventes DESC;

SELECT * FROM ventes_2023_materialized;

--make change
INSERT INTO ventes_tondeuses (region, annee, ventes) VALUES
('Normandie', 2022, 350),
('Normandie', 2023, 150)

--see evolution view are updated every time
SELECT v2023.region,
       v2023.ventes AS ventes_2023,
       v2022.ventes AS ventes_2022,
       ROUND(((v2023.ventes - v2022.ventes) / v2022.ventes::numeric) * 100, 1) AS pct_evolution
FROM ventes_2023 as v2023
JOIN ventes_2022 as v2022
  ON v2023.region = v2022.region

--transorm this in view
CREATE OR REPLACE VIEW evolution_ventes_2023_2022 AS
SELECT v2023.region,
       v2023.ventes AS ventes_2023,
       v2022.ventes AS ventes_2022,
       ROUND(((v2023.ventes - v2022.ventes) / v2022.ventes::numeric) * 100, 1) AS pct_evolution
FROM ventes_2023 as v2023
JOIN ventes_2022 as v2022
  ON v2023.region = v2022.region;

SELECT * from evolution_ventes_2023_2022;

INSERT INTO ventes_tondeuses (region, annee, ventes) VALUES
('Limousin', 2022, 500),
('Limousin', 2023, 750);

SELECT * from evolution_ventes_2023_2022;
