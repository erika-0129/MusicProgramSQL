--COP4710

--DML Script

-- INSTER 10 records to each table

INSERT INTO avilagut_RecordLabel
(recordLabelID, rlName, country, musicHits)

VALUES
(843218, 'atlRecords', 'United States', 3000),
(895305, 'bogunite', 'Colombia', 2500),
(245268, 'someRecords', 'Canada', 6562),
(854625, 'nycRecords', 'United States', 9513),
(325894, 'casitaConnects', 'Peru', 2562),
(845713, 'RioRecords', 'Brazil', 4538),
(362154, 'parisRecords', 'France', NULL),
(123456, 'londonDarling', 'England', NULL),
(951257, 'montrealRCDS', 'Canada', 7452),
(753951, 'cityofAngels', 'United States', 9654);

INSERT INTO avilagut_Producer
(producerID, firstName, lastName, yearsActive)

VALUES
(65428, 'Ron', 'Cook', 20),
(85632, 'Darell', 'Steel', 15),
(45215, 'Jessica', 'Jones', 10),
(95682, 'Joe', 'Deesk', 25),
(32568, 'Bryan', 'Oneal', 15),
(75986, 'Randy', 'Tames', 12),
(32547, 'Tiffany', 'Haze', 20),
(36589, 'Natalia', 'Tim', 16),
(78242, 'Bobby', 'Brown', 17),
(73584, 'Milly', 'James', 14);

INSERT INTO avilagut_Song
(songID, songName, songLength, releaseDate, numOfMilHits)

VALUES
(98562465, 'Loving You', '00:03:20', '2015/12/10', 6.2),
(65235846, 'Here I Am', '00:04:12', '2000/02/14', 5.8),
(95865421, 'Be There', '00:02:50', '2016/07/15', 3.9),
(30215014, 'Time to Shine', '00:03:45', '2020/11/19', 5.6),
(32568475, 'Schrute', '00:02:30', '2005/06/05', 9.5),
(98452365, 'You Are', '00:04:00', '2010/08/17', 1.2),
(32658945, 'Fly Away', '00:02:53', '2009/10/30', 7.2),
(65235478, 'Beat It', '00:01:21', '2012/12/12', 7.4),
(12548702, 'Frame This', '00:04:12', '1998/07/21', 3.2),
(30257452, 'Lighting', '00:01:59', '1990/10/10', 5.5);

INSERT INTO avilagut_songProducer
(songID, producerID)

VALUES
(98562465, 65428),
(32568475, 85632),
(95865421, 45215),
(30215014, 95682),
(32568475, 32568),
(65235478, 75986),
(65235478, 32547),
(65235478, 36589),
(12548702, 78242),
(30257452, 73584);

INSERT INTO avilagut_Singer
(singerID, firstName, lastName, genre)

VALUES
(2365, 'Joe', 'Smith', 'Pop'),
(9562, 'Jane', 'Doe', 'Blues'),
(4857, 'Carrie', 'Jane', 'R&B'),
(3265, 'Nick', 'James', 'Hip Hop'),
(2150, 'Sandra', 'Tamara', 'Latin'),
(3025, 'Ben', 'Tone', 'Rock'),
(8452, 'Sian', 'Deal', 'Reggae'),
(3074, 'Tim', 'June', 'Country'),
(9501, 'Tammy', 'Jones', 'Alternative'),
(7841, 'Kay', 'Day', 'Pop');

INSERT INTO avilagut_Performed
(songID, singerID)

VALUES
(98562465, 2365),
(65235846, 9562),
(95865421, 4857),
(98452365, 3265),
(98452365, 2150),
(98452365, 3025),
(30257452, 8452),
(12548702, 3074),
(12548702, 9501),
(30257452, 7841);

--DELETION of one SQL Statement 

DELETE FROM avilagut_Performed
WHERE songID = 12548702 AND singerID = 9501;

DELETE FROM avilagut_songProducer
WHERE songID = 12548702 AND producerID = 78242;

DELETE FROM avilagut_Singer
WHERE singerID = 9501;

DELETE FROM avilagut_Song
WHERE songID = 32658945;

DELETE FROM avilagut_Producer
WHERE producerID = 78242;

DELETE FROM avilagut_RecordLabel
WHERE recordLabelID = 362154;

-- UPDATE of the SQL Statement 

UPDATE avilagut_Performed
SET singerID = 7841
WHERE songID = 65235846;

UPDATE avilagut_songProducer
SET producerID = 45215
WHERE songID = 30215014;

UPDATE avilagut_Singer
SET firstName = 'Sonya'
WHERE singerID = 2150;

UPDATE avilagut_Song
SET songLength = '00:05:01'
WHERE songID = 32658945;

UPDATE avilagut_Producer
SET yearsActive = 28
WHERE producerID = 95682;

UPDATE avilagut_RecordLabel
SET musicHits = 8552
WHERE recordLabelID = 845713;
