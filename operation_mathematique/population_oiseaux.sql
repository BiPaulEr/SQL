CREATE TABLE population_oiseaux (
	region varchar(20), 
	nombre_moineaux smallint,
	nombre_colombes smallint,
	nombre_herons smallint,
	total_oiseaux smallint
);

INSERT INTO population_oiseaux (region, nombre_moineaux, nombre_colombes, nombre_herons, total_oiseaux)
VALUES 
('Toulouse', 1200, 350, 100, 1650),
('Lyon', 800, 200, 50, 1050),
('Marseille', 950, 150, 70, 1170),
('Figeac', 600, 300, 80, 980)
;