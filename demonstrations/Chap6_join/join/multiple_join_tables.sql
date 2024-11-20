CREATE TABLE schools_enrollment (
    id integer REFERENCES schools_left (id),
    inscription integer
);

CREATE TABLE schools_grades (
    id integer REFERENCES schools_left (id),
    niveaux varchar(20)
);

INSERT INTO schools_enrollment (id, inscription)
VALUES
    (1, 360),
    (2, 1001),
    (5, 450),
    (6, 927);

INSERT INTO schools_grades (id, niveaux)
VALUES
    (1, 'Maternelle - CE1'),
    (2, 'Lycée - Terminale'),
    (5, 'Collège - 6ème'),
    (6, 'Lycée - Terminale');
