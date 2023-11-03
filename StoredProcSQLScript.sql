--COP4710
--Erika Avila Gutierrez
--Stored Proceedure Script

-- StoreProc1
DROP PROCEDURE Max_Years_Active;

DELIMITER //

CREATE PROCEDURE Max_Years_Active()
BEGIN

SELECT MAX(yearsActive)
FROM avilagut_Producer;

END //

DELIMITER ;

CALL Max_Years_Active();


-- StoreProc2
DROP PROCEDURE LimitSongsDisplayed;

DELIMITER //

CREATE PROCEDURE LimitSongsDisplayed (IN display INT)
BEGIN

SELECT songName, MAX(numOfMilHits)
FROM avilagut_Song
GROUP BY songName
ORDER BY MAX(numOfMilHits) DESC
LIMIT display;

END //

DELIMITER ;

CALL LimitSongsDisplayed(3);


-- StoreProc3
DROP PROCEDURE Top_Songs_Hits_Num;

DELIMITER //

CREATE PROCEDURE Top_Songs_Hits_Num(IN NumOfHits FLOAT, OUT NumOfSongs INTEGER)
BEGIN

SELECT COUNT(*) INTO NumOfSongs
FROM avilagut_Song
WHERE numOfMilHits > NumOfHits;

END //

DELIMITER ;

CALL Top_Songs_Hits_Num(3.5, @numberofSongs);
SELECT @numberofSongs;
