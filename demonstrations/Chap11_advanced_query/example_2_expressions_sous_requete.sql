CREATE TABLE employes (
	id bigserial PRIMARY KEY,
	prenom varchar(20),
	nom varchar(20)
);

INSERT INTO employes (prenom, nom) VALUES
('Jean', 'Dupont'),
('Marie', 'Curie'),
('Pierre', 'Lafite'),
('Sophie', 'Martin');

CREATE TABLE retraites(
 id integer REFERENCES employes(id)
);
INSERT INTO retraites VALUES
(1),
(3);

-- IN
SELECT prenom, nom
FROM employes
WHERE id IN (
    SELECT id
    FROM retraites
);

-- NOT IN
SELECT prenom, nom
FROM employes
WHERE id NOT IN (
    SELECT id
    FROM retraites
);

--EXISTS
SELECT prenom, nom
FROM employes
WHERE EXISTS (
    SELECT 1
    FROM retraites
    WHERE employes.id = retraites.id AND length(prenom) > 4
);