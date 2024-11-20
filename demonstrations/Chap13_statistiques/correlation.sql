CREATE TABLE vols (
    annee INT,
    nombre_singes INT,
    bananes_volees INT,
    lunettes_piscine_volees INT
);

INSERT INTO vols (annee, nombre_singes, bananes_volees, lunettes_piscine_volees)
VALUES
(2016, 5, 100, 2),
(2017, 9, 130, 5),
(2018, 5, 100, 30),
(2019, 2, 30, 2),
(2020, 5, 100, 30),
(2021, 6, 120, 15),
(2022, 7, 130, 25),
(2023, 8, 150, 22),
(2024, 9, 180, 30);
SELECT corr(nombre_singes, bananes_volees) as singes_bananes_corr
FROM vols

WITH correlation_singes_lunettes AS(
SELECT corr(nombre_singes, lunettes_piscine_volees) as corr
FROM vols
),
correlation_singes_bananes AS(
SELECT corr(nombre_singes, bananes_volees)  as corr
FROM vols
)

SELECT correlation_singes_lunettes.corr as singe_lunette_corr, correlation_singes_bananes.corr as singe_banane_corr
FROM correlation_singes_bananes, correlation_singes_lunettes;

SELECT
    REGR_SLOPE(bananes_volees, nombre_singes)::NUMERIC AS slope,
    REGR_INTERCEPT(bananes_volees, nombre_singes)::NUMERIC AS y_intercept
FROM vols;


