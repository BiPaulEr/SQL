CREATE TABLE ventes_tondeuses_trigger (
    region VARCHAR(50),
    annee INT,
    ventes INT
);

CREATE TABLE total_ventes_tondeuses (
    region VARCHAR(50),
    annee INT,
    total_vente INT
);

CREATE OR REPLACE FUNCTION update_total_ventes() 
RETURNS TRIGGER AS 
$$
BEGIN
    -- Vérifier si le total pour la région et l'année existe déjà
    IF EXISTS (SELECT 1 FROM total_ventes_tondeuses WHERE region = NEW.region AND annee = NEW.annee) THEN
        -- Mettre à jour le total existant
        UPDATE total_ventes_tondeuses 
        SET total_vente = total_vente + NEW.ventes 
        WHERE region = NEW.region AND annee = NEW.annee;
    ELSE
        -- Insérer une nouvelle ligne si le total n'existe pas
        INSERT INTO total_ventes_tondeuses (region, annee, total_vente) 
        VALUES (NEW.region, NEW.annee, NEW.ventes);
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_update_total_ventes
AFTER INSERT ON ventes_tondeuses_trigger
FOR EACH ROW
EXECUTE FUNCTION update_total_ventes();

INSERT INTO ventes_tondeuses_trigger (region, annee, ventes) VALUES
('Normandie', 2022, 350);

INSERT INTO ventes_tondeuses_trigger (region, annee, ventes) VALUES
('Normandie', 2022, 650);

INSERT INTO ventes_tondeuses_trigger (region, annee, ventes) VALUES
('Normandie', 2022, 500);