CREATE TABLE parapluies (
  id SERIAL PRIMARY KEY,         
  modele VARCHAR(50) NOT NULL,    
  prix NUMERIC(5, 2) NOT NULL,     
  couleur VARCHAR(20) NOT NULL     
);

CREATE TABLE ventes (
  id SERIAL PRIMARY KEY,          
  parapluie_id INT NOT NULL,     
  quantite INT NOT NULL,        
  date_vente DATE NOT NULL,      
  FOREIGN KEY (parapluie_id) REFERENCES parapluies(id)
);

INSERT INTO parapluies (modele, prix, couleur) VALUES
  ('Parapluie A', 15.00, 'Rouge'),
  ('Parapluie B', 20.00, 'Bleu'),
  ('Parapluie C', 25.00, 'Vert'),
  ('Parapluie D', 30.00, 'Jaune')
  ('Parapluie E', 60.00, 'Or');
  
INSERT INTO ventes (parapluie_id, quantite, date_vente) VALUES
  (1, 10, '2024-11-01'),
  (2, 5, '2024-11-02'),
  (3, 8, '2024-11-03'),
  (4, 3, '2024-11-04'),
  (1, 4, '2024-11-05');
  
SELECT parapluies.id, parapluies.modele, ventes.quantite as nb_ventes, ventes.date_vente
FROM ventes
JOIN parapluies 
ON parapluies.id = ventes.parapluie_id;