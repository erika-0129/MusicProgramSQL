--A statement that drops an index that you will create later in the script
DROP INDEX avilagut_songLengthProduction ON avilagut_Song;

--A select statement that runs a sql statement 
SELECT prod.producerID, prod.lastName, songProd.songID, song.songName, song.songLength, song.releaseDate
FROM avilagut_Producer AS prod INNER JOIN avilagut_songProducer AS songProd 
ON prod.producerID = songProd.producerID INNER JOIN avilagut_Song AS song 
ON songProd.songID = song.songID
WHERE song.songLength > '00:01:30';

--Use Explain on the A select statement above to see how this query was executed 
EXPLAIN
SELECT prod.producerID, prod.lastName, songProd.songID, song.songName, song.songLength, song.releaseDate
FROM avilagut_Producer AS prod INNER JOIN avilagut_songProducer AS songProd 
ON prod.producerID = songProd.producerID INNER JOIN avilagut_Song AS song 
ON songProd.songID = song.songID
WHERE song.songLength > '00:01:30';

--A statement that creates an index that optimizes the select SQL statement
CREATE INDEX avilagut_songLengthProduction ON avilagut_Song(songID) USING BTree;

--A select statement that runs the same sql statement
SELECT prod.producerID, prod.lastName, songProd.songID, song.songName, song.songLength, song.releaseDate
FROM avilagut_Producer AS prod INNER JOIN avilagut_songProducer AS songProd 
ON prod.producerID = songProd.producerID INNER JOIN avilagut_Song AS song 
ON songProd.songID = song.songID
WHERE song.songLength > '00:01:30';

--Use Explain on the A select statement above to see how this query was executed
EXPLAIN
SELECT prod.producerID, prod.lastName, songProd.songID, song.songName, song.songLength, song.releaseDate
FROM avilagut_Producer AS prod INNER JOIN avilagut_songProducer AS songProd 
ON prod.producerID = songProd.producerID INNER JOIN avilagut_Song AS song 
ON songProd.songID = song.songID
WHERE song.songLength > '00:01:30';
