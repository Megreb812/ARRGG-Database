
DROP TABLE IF EXISTS pirates;
DROP TABLE IF EXISTS ships;
DROP TABLE IF EXISTS quests;
DROP TABLE IF EXISTS shoulderPets;
DROP VIEW IF EXISTS pirate_booty;

CREATE TABLE IF NOT EXISTS pirates(
pirateId INTEGER PRIMARY KEY AUTOINCREMENT,
name TEXT,
rank TEXT,
numberOfMissingLimbs INTEGER,
scurvyness INTERGER,
bounty TEXT,
shipId INTEGER,
questId INTEGER,
shoulderPetId INTEGER
);

DROP TABLE IF EXISTS ships;


CREATE TABLE IF NOT EXISTS ships(
shipId INTEGER PRIMARY KEY AUTOINCREMENT,
name TEXT,
class TEXT,
durability INTEGER,
numCrew INTEGER
);

CREATE TABLE IF NOT EXISTS quests(
questId INTEGER PRIMARY KEY AUTOINCREMENT,
name TEXT,
givenBy TEXT,
cursed TEXT,
reward TEXT,
risk TEXT
);

CREATE TABLE IF NOT EXISTS shoulderPets(
shoulderPetId INTEGER PRIMARY KEY AUTOINCREMENT,
name TEXT,
typeOfAnimal TEXT,
isDead TEXT,
phrase TEXT
);

CREATE VIEW pirate_booty
AS
SELECT 
pirates.pirateId,
pirates.name AS "PirateName",
pirates.rank,
pirates.scurvyness,
pirates.bounty,
ships.name AS "ShipName",
ships.class,
ships.durability,
ships.numCrew,
quests.name AS "QuestName",
quests.givenBy,
quests.cursed,
quests.reward,
quests.risk,
shoulderPets.*
FROM pirates
LEFT JOIN ships USING (shipId)
LEFT JOIN shoulderPets USING (shoulderPetId)
LEFT JOIN quests USING (questId);