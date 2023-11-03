--COP4710

--View SQL

-- Three statements that drop the three views (referred to below as View1, View2, and View3)
DROP VIEW viewSongsIDProduced;
DROP VIEW viewSongsProduced;
DROP VIEW maxHits;

-- A statement that creates a view that combines at least 2 tables (referred to later as View1) 
CREATE VIEW viewSongsIDProduced AS
SELECT prod.producerID, prod.lastName, songProd.songID
FROM avilagut_Producer AS prod INNER JOIN avilagut_songProducer AS songProd
ON prod.producerID = songProd.producerID;

-- A statement that creates a view that combines at least 3 tables (referred to later as View2)
CREATE VIEW viewSongsProduced AS
SELECT prod.producerID, prod.lastName, songProd.songID, song.songName
FROM avilagut_Producer AS prod INNER JOIN avilagut_songProducer AS songProd 
ON prod.producerID = songProd.producerID INNER JOIN avilagut_Song AS song ON songProd.songID = song.songID;

-- A statement that creates a view that uses an aggregate function (referred to later as View3)
CREATE VIEW maxHits AS
SELECT songName, MAX(numOfMilHits)
FROM avilagut_Song
GROUP BY songName; 

-- A select statement that utilizes View1
SELECT *
FROM viewSongsIDProduced;

-- A select statement that utilizes View2
SELECT songID, COUNT(producerID)
FROM viewSongsProduced
GROUP BY songID
HAVING COUNT(producerID) > 1;

-- A select statement that utilizes View3
SELECT *
FROM maxHits;

-- At least 1 of the select statements above must utilize an aggregate function
