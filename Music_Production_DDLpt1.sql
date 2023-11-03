DROP TABLE avilagut_songProducer;
DROP TABLE avilagut_Performed;
DROP TABLE avilagut_Song;
DROP TABLE avilagut_Singer;
DROP TABLE avilagut_Producer;
DROP TABLE avilagut_RecordLabel;

CREATE TABLE avilagut_RecordLabel(
recordLabelID int PRIMARY KEY,
rlName CHAR(30),
country CHAR(30),
musicHits int
);

CREATE TABLE avilagut_Producer(
producerID int PRIMARY KEY,
firstName VARCHAR(20),
lastName VARCHAR(20),
yearsActive int
);

CREATE TABLE avilagut_Song(
songID int PRIMARY KEY,
songName CHAR(20),
songLength TIME,
releaseDate DATE,
numOfMilHits FLOAT
);

CREATE TABLE avilagut_songProducer(
songID int,
producerID int,
PRIMARY KEY (songID, producerID)
);

ALTER TABLE avilagut_songProducer
ADD FOREIGN KEY fk_song_ID(songID)
REFERENCES avilagut_Song(songID);

ALTER TABLE avilagut_songProducer
ADD FOREIGN KEY fk_producer_ID(producerID)
REFERENCES avilagut_Producer(producerID);

CREATE TABLE avilagut_Singer(
singerID int PRIMARY KEY,
firstName VARCHAR(20),
lastName VARCHAR(20),
genre VARCHAR(20)
);

CREATE TABLE avilagut_Performed(
songID int,
singerID int,
PRIMARY KEY (songID, singerID)
);

ALTER TABLE avilagut_Performed
ADD FOREIGN KEY fk_song_ID(songID)
REFERENCES avilagut_Song(songID);

ALTER TABLE avilagut_Performed
ADD FOREIGN KEY fk_singer_ID(singerID)
REFERENCES avilagut_Singer(singerID);
