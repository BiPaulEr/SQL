-- Etape 1 :
CREATE TABLE bibliotheque (
    id SERIAL PRIMARY KEY,
    titre varchar(255),
    genre varchar(50),
    auteur varchar(255),
    annee_publication integer,
    emprunts integer,
    avis numeric(3, 1)
);

COPY bibliotheque(id, titre, genre, auteur, annee_publication, emprunts, avis)
FROM 'C:/Users/PaulE/SQL/data/Chap9_groupby_having/bibliotheque_data.csv'
DELIMITER ',' CSV HEADER;