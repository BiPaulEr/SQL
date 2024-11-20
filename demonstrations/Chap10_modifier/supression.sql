DELETE FROM producteurs WHERE company IN('Oeufs Frais');

ALTER TABLE producteurs DROP COLUMN st;

DROP TABLE producteurs_backup;

START TRANSACTION

UPDATE producteurs;
SET company = 'Viandes Bio';

SELECT company 
FROM producteurs;

ROLLBACK;

SELECT company 
FROM producteurs;
