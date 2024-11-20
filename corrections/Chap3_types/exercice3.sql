CREATE TABLE produits (
    id_produit bigserial,
    prix_texte VARCHAR(7)
);

INSERT INTO produits (prix_texte)
VALUES
 ('10.99'),
 ('25.50'),
 ('15.00');

SELECT id_produit, prix_texte, CAST(prix_texte AS DECIMAL(6,2)) AS prix_numerique
FROM produits;