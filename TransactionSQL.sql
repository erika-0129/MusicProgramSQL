--COP4710

--Transaction SQL

--Drop stored proceedures
DROP PROCEDURE addMusic;
DROP PROCEDURE changeProducer_SQLException; 

Delimiter //

--A statement to create a stored procedure with handlers 
--for sqlexception and sqlwarning that will not trigger an exception when called.

CREATE PROCEDURE addMusic()
BEGIN

DECLARE exit handler for sqlexception
BEGIN
	ROLLBACK;
	SELECT 'sql exception';
END;

DECLARE exit handler for sqlwarning
BEGIN
	ROLLBACK;
	SELECT 'sql warning';
END;

START TRANSACTION;

-- Inserting into record label
INSERT INTO avilagut_RecordLabel
(recordLabelID, rlName, country, musicHits)
VALUES
(951753, 'MIAMusic', 'United States', 8542);

-- Intertin into Producer
INSERT INTO avilagut_Producer
(producerID, firstName, lastName, yearsActive)
VALUES
(14785, 'Tim', 'Simon', 30);

COMMIT;

END //

-- A statement to create a stored procedure with handlers 
-- for sqlexception and sqlwarning that will trigger an exception when called.

CREATE PROCEDURE changeProducer_SQLException()
BEGIN

DECLARE exit handler for sqlexception
BEGIN
	ROLLBACK;
	SELECT 'sql exception';
END;

DECLARE exit handler for sqlwarning
BEGIN
	ROLLBACK;
	SELECT 'sql warning';
END;

START TRANSACTION;

-- Updates year to a float where an int is expected
UPDATE avilagut_Producer
SET yearsActive = 2.5
WHERE recordLabelID = 843218;

COMMIT;

END //

Delimiter ;

CALL addMusic();
CALL changeProducer_SQLException();
