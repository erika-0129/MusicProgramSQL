--COP4710

--Advanced SQL Script

--A select statement that selects data where an attribute is either null or not null;
SELECT *
FROM avilagut_RecordLabel
WHERE musicHits IS NULL;

--A select statement that includes an AVG;
SELECT AVG(numOfMilHits)
FROM avilagut_Song;

--A select statement that includes a COUNT;
SELECT COUNT(rlName)
FROM avilagut_RecordLabel
WHERE country = 'Canada';

--A select statement that includes a MAX;
SELECT songName, MAX(numOfMilHits)
FROM avilagut_Song
GROUP BY songName;

--A select statement that includes a MIN;
SELECT MIN(yearsActive)
FROM avilagut_Producer;


--A select statement that includes a SUM;
SELECT SUM(musicHits)
FROM avilagut_RecordLabel;

--A select statement that includes an aggregate function and an ORDER BY;
SELECT songID, COUNT(producerID)
FROM avilagut_songProducer
GROUP BY songID
ORDER BY songID;

--A select statement that uses an aggregate function and a HAVING;
SELECT songID, COUNT(producerID)
FROM avilagut_songProducer
GROUP BY songID
HAVING COUNT(producerID) > 1
ORDER BY songID;

--A select statement with a subquery that includes an IN;
SELECT producerID
FROM avilagut_songProducer
WHERE songID IN 
(SELECT songID
FROM avilagut_Song
WHERE songID = 65235478);

--A select statement with another query nested in it;
SELECT singerID
FROM avilagut_Performed
WHERE songID IN 
(SELECT songID
FROM avilagut_Singer
WHERE songID = 98452365);
