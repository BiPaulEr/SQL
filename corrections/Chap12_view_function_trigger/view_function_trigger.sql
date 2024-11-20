--Etape 1
CREATE TABLE ventes_fruits (
    fruit VARCHAR(50),
    annee INT,
    ventes INT
);

COPY ventes_fruits (fruit, annee, ventes)
FROM 'C:/Users/PaulE/SQL/data/Chap12_view_function_trigger/fruits.csv'
WITH (FORMAT CSV, DELIMITER ',', HEADER ON);

--Etape 2
CREATE OR REPLACE VIEW ventes_2022 AS
SELECT fruit, ventes
FROM ventes_fruits
WHERE annee = 2022
ORDER BY ventes DESC;

SELECT * FROM ventes_2022;

--Etape 3
CREATE OR REPLACE VIEW ventes_2023 AS
SELECT fruit, ventes
FROM ventes_fruits
WHERE annee = 2023
ORDER BY ventes DESC;

SELECT * FROM ventes_2023;

--Etape 4
INSERT INTO ventes_fruits (fruit, annee, ventes) VALUES
('Poire', 2022, 50);
SELECT * FROM ventes_2022;
INSERT INTO ventes_fruits (fruit, annee, ventes) VALUES
('Poire', 2023, 150);
SELECT * FROM ventes_2023;

--Etape 5
CREATE OR REPLACE VIEW evolution_ventes_2023_2022 AS
SELECT v2023.fruit,
       v2023.ventes AS ventes_2023,
       v2022.ventes AS ventes_2022,
       ROUND(((v2023.ventes - v2022.ventes) / v2022.ventes::numeric) * 100, 1) AS pct_evolution
FROM ventes_2023 AS v2023
JOIN ventes_2022 AS v2022
  ON v2023.fruit = v2022.fruit;

SELECT * FROM evolution_ventes_2023_2022;

--Etape 6
INSERT INTO ventes_fruits (fruit, annee, ventes) VALUES
('Prune', 2022, 750);
('Prune', 2023, 850);
SELECT * FROM evolution_ventes_2023_2022;

--Etape 7
CREATE OR REPLACE FUNCTION total_ventes_par_fruit (fruit_input TEXT)
RETURNS INTEGER AS
$$
    SELECT SUM(ventes)
    FROM ventes_fruits
    WHERE fruit = fruit_input;
$$
LANGUAGE SQL;
SELECT total_ventes_par_fruit('Pomme');

--Etape 8
CREATE OR REPLACE FUNCTION total_ventes_par_fruit_et_annee (fruit_input TEXT, annee_input INT)
RETURNS INTEGER AS
$$
    SELECT SUM(ventes)
    FROM ventes_fruits
    WHERE fruit = fruit_input AND annee = annee_input;
$$
LANGUAGE SQL;
SELECT total_ventes_par_fruit_et_annee('Pomme', 2023);

--Etape 9
CREATE TABLE total_ventes_fruits (
    fruit VARCHAR(50),
    annee INT,
    total_vente INT
);

CREATE OR REPLACE FUNCTION update_total_ventes_fruits() 
RETURNS TRIGGER AS 
$$
BEGIN
    IF EXISTS (SELECT 1 FROM total_ventes_fruits WHERE fruit = NEW.fruit AND annee = NEW.annee) THEN
        UPDATE total_ventes_fruits 
        SET total_vente = total_vente + NEW.ventes 
        WHERE fruit = NEW.fruit AND annee = NEW.annee;
    ELSE
        INSERT INTO total_ventes_fruits (fruit, annee, total_vente) 
        VALUES (NEW.fruit, NEW.annee, NEW.ventes);
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_update_total_ventes_fruits
AFTER INSERT ON ventes_fruits
FOR EACH ROW
EXECUTE FUNCTION update_total_ventes_fruits();

INSERT INTO ventes_fruits (fruit, annee, ventes) VALUES
('Peche', 2022, 250),
('Peche', 2023, 300);

SELECT * FROM total_ventes_fruits;

--Etape 10
INSERT INTO ventes_fruits (fruit, annee, ventes) VALUES
('Peche', 2022, 650),
('Peche', 2023, 700);


SELECT * FROM total_ventes_fruits;