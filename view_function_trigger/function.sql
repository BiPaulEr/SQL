CREATE OR REPLACE FUNCTION total_ventes_par_region (region_input text)
RETURNS integer AS
$$
    SELECT SUM(ventes)
    FROM ventes_tondeuses
    WHERE region = region_input
$$
LANGUAGE SQL;

SELECT total_ventes_par_region('Île-de-France');

CREATE OR REPLACE FUNCTION moyenne_ventes_par_regions(region_input text)
RETURNS numeric AS
$$
    SELECT AVG(ventes)
    FROM ventes_tondeuses
    WHERE region = region_input;
$$
LANGUAGE SQL;

SELECT moyenne_ventes_par_regions('Île-de-France');

CREATE OR REPLACE FUNCTION total_ventes_par_annee_et_region (region_input text, annee_input integer)
RETURNS integer AS
$$
    SELECT SUM(ventes)
    FROM ventes_tondeuses
    WHERE region = region_input and annee = annee_input
$$
LANGUAGE SQL;

SELECT total_ventes_par_annee_et_region('Île-de-France', 2023);

CREATE OR REPLACE FUNCTION ventes_par_region(region_input text)
RETURNS TABLE(region text, annee integer, ventes numeric) AS
$$
    SELECT region, annee, ventes
    FROM ventes_tondeuses
    WHERE region = region_input;
$$
LANGUAGE SQL;

SELECT * FROM ventes_par_region('Normandie');