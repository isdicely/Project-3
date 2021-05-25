DROP TABLE IF EXISTS red_wines;
DROP TABLE IF EXISTS white_wines;
DROP TABLE IF EXISTS wines;

CREATE TABLE red_wines (
	fixed_acidity DECIMAL,
	volatile_acidity DECIMAL,
	citric_acid DECIMAL,
	residual_sugar DECIMAL,
	chlorides DECIMAL,
	free_sulfur_dioxide DECIMAL,
	total_sulfur_dioxide DECIMAL,
	density DECIMAL,
	pH DECIMAL,
	sulphates DECIMAL,
	alchohol DECIMAL,
	quality SMALLINT
);

CREATE TABLE white_wines (
	fixed_acidity DECIMAL,
	volatile_acidity DECIMAL,
	citric_acid DECIMAL,
	residual_sugar DECIMAL,
	chlorides DECIMAL,
	free_sulfur_dioxide DECIMAL,
	total_sulfur_dioxide DECIMAL,
	density DECIMAL,
	pH DECIMAL,
	sulphates DECIMAL,
	alchohol DECIMAL,
	quality SMALLINT
);

SELECT * FROM red_wines;
SELECT * FROM white_wines;

ALTER TABLE red_wines
ADD COLUMN wine_type VARCHAR;

UPDATE red_wines
SET wine_type = 'Red';

ALTER TABLE white_wines
ADD COLUMN wine_type VARCHAR;

UPDATE white_wines
SET wine_type = 'White';


CREATE TABLE wines(
	LIKE red_wines
);

INSERT INTO wines(
fixed_acidity, volatile_acidity, citric_acid, residual_sugar,
	chlorides, free_sulfur_dioxide, total_sulfur_dioxide, density,
	pH, sulphates, alchohol, quality, wine_type
)
SELECT fixed_acidity, volatile_acidity, citric_acid, residual_sugar,
	chlorides, free_sulfur_dioxide, total_sulfur_dioxide, density,
	pH, sulphates, alchohol, quality, wine_type FROM red_wines;
	
INSERT INTO wines(
fixed_acidity, volatile_acidity, citric_acid, residual_sugar,
	chlorides, free_sulfur_dioxide, total_sulfur_dioxide, density,
	pH, sulphates, alchohol, quality, wine_type
)
SELECT fixed_acidity, volatile_acidity, citric_acid, residual_sugar,
	chlorides, free_sulfur_dioxide, total_sulfur_dioxide, density,
	pH, sulphates, alchohol, quality, wine_type FROM white_wines;
	
ALTER TABLE wines
ADD COLUMN id SERIAL PRIMARY KEY;

	
SELECT * FROM wines;
	