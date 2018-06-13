DROP TABLE IF EXISTS robots;
DROP TABLE IF EXISTS factions;
DROP TABLE IF EXISTS Dogs;
DROP TABLE IF EXISTS names;
DROP TABLE IF EXISTS dog_name;

CREATE TABLE Dogs(
dogId INTEGER PRIMARY KEY AUTOINCREMENT,
name TEXT);

CREATE TABLE names(
nameID INTEGER PRIMARY KEY AUTOINCREMENT,
name TEXT);

CREATE TABLE dog_name(
dogNameid INTEGER PRIMARY KEY AUTOINCREMENT,
dogId INTEGER,
nameId INTEGER);

INSERT INTO names
(name)
VALUES 
("Charlie"),("PB"), ("Johnny");

INSERT INTO dogs
(name, nameId)
VALUES
("poodle"), 
("pitbull"),
("gr"),

INSERT INTO dog_name
(dogId, nameId)
VALUES
((SELECT dogId FROM dogs WHERE name="poodle"),(SELECT nameID FROM names WHERE name="Charlie")),
((SELECT dogId FROM dogs WHERE name="pitbull"),(SELECT nameID FROM names WHERE name="PB")),
((SELECT dogId FROM dogs WHERE name="gr"),(SELECT nameID FROM names WHERE name="Johnny"));

SELECT * FROM dogs;
SELECT * FROM names;
SELECT * FROM dog_name;

SELECT dogs.name AS "DogName", names.name AS "DogName"
FROM dogs
JOIN dog_name
USING(dogId)
Join names
USING (nameId);