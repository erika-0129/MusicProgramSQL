--COP4710

--Intermediate SQL Elements

--A select statement that selects data from a single table;
SELECT *
FROM avilagut_songProducer;


--A select statement that selects data from a single table that limits the columns returned;
SELECT songID, songName
FROM avilagut_Song;


--A select statement that selects data from a single table that limits the rows returned;
SELECT *
FROM avilagut_songProducer
WHERE producerID = 45215;

--A select statement that selects data from a single table that limits both the columns and the rows returned;
SELECT songID
FROM avilagut_songProducer
WHERE producerID = 45215;

--A select statement that selects data from a single table with a where clause that uses a like 
SELECT *
FROM avilagut_Singer
WHERE singerID LIKE '3%';

--A select statement that selects data from a single table with a where clause that uses a between
SELECT *
FROM avilagut_Producer
WHERE producerID BETWEEN 60000 AND 100000;


--A select statement that inner joins two tables
SELECT *
FROM avilagut_Producer AS prod INNER JOIN avilagut_songProducer AS songProd
ON prod.producerID = songProd.producerID;


--A select statement that right joins two tables
SELECT *
FROM avilagut_Producer AS prod RIGHT JOIN avilagut_songProducer AS songProd
ON prod.producerID = songProd.producerID;

--A select statement that left joins two tables
SELECT *
FROM avilagut_Producer AS prod LEFT JOIN avilagut_songProducer AS songProd
ON prod.producerID = songProd.producerID;
