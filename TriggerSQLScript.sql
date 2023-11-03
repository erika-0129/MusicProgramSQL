--COP4710
--Erika Avila Gutierrez

DROP TABLE avilagut_DataLog;

CREATE TABLE avilagut_DataLog (
UserName VARCHAR(20),
TableName VARCHAR(120),
Action VARCHAR(150),
KeyRecord VARCHAR(100),
LastUpdate DATETIME
);

--Trigger1
DROP TRIGGER insertToTable;

DELIMITER //

CREATE TRIGGER insertCheck
BEFORE INSERT
ON avilagut_Song

FOR EACH ROW
BEGIN

IF (new.songID = 00000000) THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Invalid Song ID. Record not added.';

ELSEIF (new.songName IS NULL) THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Entry must have a name. Record not added.';

ELSEIF (new.releaseDate = '9999-01-01') THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Invalid Date. Record not added.';

END IF;

END //

DELIMITER ; 

--Test Trigger1 with each limit
INSERT INTO avilagut_Song
(songID, songName, songLength, releaseDate, numOfMilHits)
VALUES
(00000000, 'Hello', '00:03:20', '2001/12/01', 3.5);

INSERT INTO avilagut_Song
(songID, songName, songLength, releaseDate, numOfMilHits)
VALUES
(98653274, NULL, '00:03:20', '2001/12/01', 3.5);

INSERT INTO avilagut_Song
(songID, songName, songLength, releaseDate, numOfMilHits)
VALUES
(98653274, 'Hello', '00:03:20', '9999-01-01', 3.5);

--Trigger2

DROP TRIGGER insert_DataLog;

DELIMITER //

CREATE TRIGGER insert_DataLog
AFTER INSERT
ON avilagut_Song
FOR EACH ROW

BEGIN

INSERT INTO avilagut_DataLog
(UserName, TableName, Action, KeyRecord, LastUpdate)
VALUES
('avilagut', 'Song', 'Insert-After', new.songID, NOW());

END //

DELIMITER ;

-- Add a Song
INSERT INTO avilagut_Song
(songID, songName, songLength, releaseDate, numOfMilHits)
VALUES
(98653274, 'Hello', '00:03:20', '2001/12/11', 3.5);

-- Confirm song was added
SELECT *
FROM avilagut_Song;

--Check data log
SELECT *
FROM avilagut_DataLog;

--Trigger3
DROP TRIGGER update_DataLog;

DELIMITER //

CREATE TRIGGER update_DataLog
AFTER UPDATE
ON avilagut_Song
FOR EACH ROW

BEGIN

INSERT avilagut_DataLog
(UserName, TableName, Action, KeyRecord, LastUpdate)
VALUES
('avilagut', 'Song', 'Update-After', new.songID, NOW());

END //

DELIMITER ;

-- Update a Song
UPDATE avilagut_Song
SET songLength = '00:02:58'
WHERE songID = 98653274;

-- Confirm song was updated
SELECT *
FROM avilagut_Song;

--Check data log
SELECT *
FROM avilagut_DataLog;

--Trigger4
DROP TRIGGER delete_DataLog;

DELIMITER //

CREATE TRIGGER delete_DataLog
AFTER DELETE
ON avilagut_Song
FOR EACH ROW

BEGIN

INSERT avilagut_DataLog
(UserName, TableName, Action, KeyRecord, LastUpdate)
VALUES
('avilagut', 'Song', 'Delete-After', OLD.songID, NOW());

END //

DELIMITER ;

-- Delete a Song
DELETE FROM avilagut_Song
WHERE songID = 98653274;

-- Confirm song was deleted
SELECT *
FROM avilagut_Song;

--Check data log
SELECT *
FROM avilagut_DataLog;
