CREATE TABLE Stadium (
    stadium_id INT PRIMARY KEY,
    stadium_name VARCHAR(100) NOT NULL,
    stadium_city VARCHAR(50) NOT NULL,
    stadium_capacity INT NOT NULL
);

-- 2. Team Table
CREATE TABLE Team (
    team_id INT PRIMARY KEY,
    team_name VARCHAR(100) NOT NULL,
    team_coach VARCHAR(100),
    team_wins INT DEFAULT 0,
    team_total_matches INT DEFAULT 0,
    home_stadium_id INT,
    FOREIGN KEY (home_stadium_id) REFERENCES Stadium(stadium_id)
);

-- 3. Player Table
CREATE TABLE Player (
    player_id INT PRIMARY KEY,
    player_first_name VARCHAR(50) NOT NULL,
    player_last_name VARCHAR(50),
    team_id INT,
    player_role VARCHAR(20),
    player_jersey_number INT,
    player_matches_played INT DEFAULT 0,
    FOREIGN KEY (team_id) REFERENCES Team(team_id)
);

--1. Retrieve Unique Roles of Players.

select distinct player_role 
from Player
--2. Calculate the winning percentage of each team.

select (team_wins * 100 / team_total_matches)
from Team
--3. Insert a new record to Stadium Table. (2, Wankhede Stadium, Mumbai,33000)

INSERT INTO Stadium (stadium_id , stadium_name , stadium_city , stadium_capacity) VALUES
(2, 'Wankhede Stadium' , 'Mumbai', 33000);

--4. Update Team Coach Name of Team RCB to Ashish Nehra.

UPDATE Team
SET team_coach = 'Ashish Nehra'
WHERE team_name = 'RCB';

--5. Delete All the Records of Player Shikhar Dhawan.

DELETE 
FROM Player
WHERE player_first_name = 'SHIKHER' 
AND player_last_name = 'DHAWAN';
--6. Change the size of stadium_name column from VARCHAR (100) to VARCHAR (15).

ALTER TABLE Stadium 
ALTER COLUMN stadium_name VARCHAR(15)
--7. Remove Player Table.

DROP TABLE Player
--8. Display Top 30 Players Whose First Name Starts with Vowel.

SELECT TOP 30 player_first_name FROM Player
WHERE player_first_name LIKE '[AEIOUaeiou]%'
--9. Display City Whose Stadium Name does not Ends with ‘M’.

SELECT stadium_city FROM Stadium 
WHERE stadium_name NOT LIKE '%M'
--10. Generate Random Number between 0 to 100.

SELECT RAND() * 101;
--11. Display 4th to 9th Character of ‘Virat Kohli’.

SELECT SUBSTRING('Virat Kohli' , 4 , 6)
--12. Display The Day of week on 01-01-2005.

SELECT DATENAME(WEEKDAY , '2005-01-01');

--13. Display City Wise Maximum Stadium Capacity.

SELECT stadium_city, stadium_capacity FROM Stadium
GROUP BY stadium_city;

--14. Display City Whose Average Stadium Capacity is Above 20000.

SELECT stadium_city FROM 
Stadium 
GROUP BY stadium_city
HAVING AVG(stadium_capacity) > 20000
--15. Display All Players Full Name, Jersey No and Role Who is Playing for Mumbai Indians. (Using Sub
--query).

SELECT CONCAT('player_first_name' , ' ', 'player_last_name') , player_jersey_number , player_role
FROM PLAYER 
WHERE team_id in (SELECT 
               team_name FROM  Team
               WHERE team_name = 'MI'
                )
--16. Display Team Name Having Home Stadium Capacity Over 50000. (Using Sub query ).
SELECT team_name FROM TEAM
WHERE home_stadium_id = (SELECT 
                stadium_capacity FROM Stadium
                WHERE stadium_capacity > 50000)

--17. Create a View Players_Above_100_Matches of Players Who have Played More than 100 Matches.

CREATE VIEW Players_Above_100_Matches AS 
SELECT player_id , player_first_name , player_last_name ,player_role ,player_jersey_number , player_matches_played FROM PLAYER
WHERE player_matches_played > 100;
--18. Get the Player name, Team name, and their Jersey number who have played Between than 50 to
--100 matches.

SELECT CONCAT(P.player_first_name , ' ' ,P.player_last_name) , P.player_jersey_number , T.team_name
FROM PLAYER P 
JOIN TEAM T 
ON P.team_id = T.team_id
WHERE P.player_matches_played > 50 AND P.player_matches_played < 100
--19. Produce Output Like: <PlayerFirstName> Plays For <TeamName> and Has Played <PlayerMatches>
--matches. (In single column)

SELECT P.PLAYER_FIRST_NAME + ' ' + 'PLAYS FOR' + ' ' +  T.team_name + ' ' + 'AND HAS PLAYED' + CAST(P.player_matches_played AS varchar(50))
FROM Player P JOIN TEAM T
ON P.TEAM_ID = T.TEAM_ID
--20. Display Stadium Capacity of Team CSK.

SELECT S.stadium_capacity , T.TEAM_NAME
FROM Stadium S 
JOIN TEAM T
ON T.HOME_STADIUM_ID = S.stadium_id
WHERE T.TAME_NAME = 'CSK'