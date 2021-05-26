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

SELECT MAX(fixed_acidity),
	   MIN(fixed_acidity),
	   AVG(fixed_acidity),
	   MAX(volatile_acidity),
	   MIN(volatile_acidity),
	   AVG(volatile_acidity),
	   MAX(citric_acid),
	   MIN(citric_acid),
	   AVG(citric_acid),
	   MAX(residual_sugar),
	   MIN(residual_sugar),
	   AVG(residual_sugar),
	   MAX(chlorides),
	   MIN(chlorides),
	   AVG(chlorides),
	   MAX(free_sulfur_dioxide),
	   MIN(free_sulfur_dioxide),
	   AVG(free_sulfur_dioxide),
	   MAX(total_sulfur_dioxide),
	   MIN(total_sulfur_dioxide),
	   AVG(total_sulfur_dioxide),
	   MAX(density),
	   MIN(density),
	   AVG(density),
	   MAX(pH),
	   MIN(pH),
	   AVG(pH),
	   MAX(sulphates),
	   MIN(sulphates),
	   AVG(sulphates),
	   MAX(alchohol),
	   MIN(alchohol),
	   AVG(alchohol),
	   MAX(quality),
	   MIN(quality),
	   AVG(quality)
FROM wines
WHERE wine_type = 'White';


SELECT MAX(fixed_acidity),
	   MIN(fixed_acidity),
	   AVG(fixed_acidity),
	   MAX(volatile_acidity),
	   MIN(volatile_acidity),
	   AVG(volatile_acidity),
	   MAX(citric_acid),
	   MIN(citric_acid),
	   AVG(citric_acid),
	   MAX(residual_sugar),
	   MIN(residual_sugar),
	   AVG(residual_sugar),
	   MAX(chlorides),
	   MIN(chlorides),
	   AVG(chlorides),
	   MAX(free_sulfur_dioxide),
	   MIN(free_sulfur_dioxide),
	   AVG(free_sulfur_dioxide),
	   MAX(total_sulfur_dioxide),
	   MIN(total_sulfur_dioxide),
	   AVG(total_sulfur_dioxide),
	   MAX(density),
	   MIN(density),
	   AVG(density),
	   MAX(pH),
	   MIN(pH),
	   AVG(pH),
	   MAX(sulphates),
	   MIN(sulphates),
	   AVG(sulphates),
	   MAX(alchohol),
	   MIN(alchohol),
	   AVG(alchohol),
	   MAX(quality),
	   MIN(quality),
	   AVG(quality)
FROM wines
WHERE wine_type = 'Red';
	
