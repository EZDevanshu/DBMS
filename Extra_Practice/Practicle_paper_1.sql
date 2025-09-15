USE CSE_3A_258;


-- Astronauts Table
CREATE TABLE Astronauts (
    astronaut_id INT PRIMARY KEY,
    astronaut_name VARCHAR(100) NOT NULL,
    age INT,
    nationality VARCHAR(50),
    total_space_missions INT DEFAULT 0
);

-- Missions Table
CREATE TABLE Missions (
    mission_id INT  PRIMARY KEY,
    mission_name VARCHAR(100) NOT NULL,
    launch_date DATE,
    duration_days INT,
    mission_type VARCHAR(50)
);

-- Spacecrafts Table
CREATE TABLE Spacecrafts (
    spacecraft_id INT  PRIMARY KEY,
    spacecraft_name VARCHAR(100) NOT NULL,
    capacity INT,
    manufacturer VARCHAR(100)
);

-- Participation Table
CREATE TABLE Participation (
    astronaut_id INT,
    mission_id INT,
    spacecraft_id INT,
    role VARCHAR(50),
    PRIMARY KEY (astronaut_id, mission_id, spacecraft_id),
    FOREIGN KEY (astronaut_id) REFERENCES Astronauts(astronaut_id),
    FOREIGN KEY (mission_id) REFERENCES Missions(mission_id),
    FOREIGN KEY (spacecraft_id) REFERENCES Spacecrafts(spacecraft_id)
);


--1. Retrieve the distinct mission names where the mission lasted more than 30 days.

SELECT DISTINCT(mission_name) FROM MISSION 
where duration_days > 30;
--2. Retrieve the top 3 astronauts who participated in the most missions, ensuring no duplicates.

select top 3 A.astronaut_name  FROM Astronauts A
ORDER BY total_space_missions DESC
--3. Insert a new space mission called "Jupiter Exploration" that is scheduled to launch on '2024-11-
--01', lasting 365 days, and classified as an exploration mission.

INSERT INTO Missions (mission_name ,  launch_date , duration_days , mission_type) VALUES
('Jupiter Exploration' , '2024-11-01' , 365 , 'exploration');
--4. Update the total space missions count for astronaut with ID = 5, increasing it by 1.

UPDATE ASTRONUAT 
SET total_space_missions = total_space_missions + 1
WHERE astronaut_id = 5;

--5. Delete participation record for astronaut ID 3 in mission ID 2.

DELETE FROM Participation
WHERE astronaut_id = 3 AND mission_id = 2;
--6. Add a new column experience_level (VARCHAR(50)) to the Astronauts table to store the
--astronaut's experience level.

ALTER TABLE Astronauts
ADD COLUMN experience_level VARCHAR(50);

--7. Clear all the data from the Participation table.(Truncate)

TRUNCATE TABLE Participation;
--8. Retrieve all mission names where the mission type contains 'exploration'.

SELECT	mission_name FROM MISSSION 
WHERE MISION_type = 'EXPLORATION'
--9. Retrieve all missions that contain the word "Mars" and lasted more than 100 days.

select mission_name , mission_name from missions 
where mission_name like '%mars%' and mission_name > 100;
--10. Retrieve the square root of the total number of missions for astronaut ID 102

select SQRT(total_space_missions) from astrunut 
where astronaut_id = 102;
--11. Retrieve the first 3 characters of each astronaut's name

select SUBSTRING(astronaut_name , 1 , 3) as first_three_char
from Astronauts;

--12. Retrieve the astronauts who participated in missions launched in the current year.

select distinct a.astronaut_id , a.astronaut_name 
from Astronauts a 
join Participation p 
on a.astronaut_id = p.astronaut_id
join Missions m
on m.mission_id = p.mission_id
where year(m.launch_date) = year(curdate()


--13. Count the number of astronauts from each nationality who have participated in more than 2
--space missions.

select count(astronuat_id) ,nationality 
from Astronauts 
where total_space_missions  > 2
group by nationality;


--14. Retrieve the total number of missions and the average mission duration for each mission type,
--but only include mission types that have been involved in more than 3 missions.

select m.mission_type , avg(m.duration_days) , count(m.mission_id)
from mission 
group by mission_type
having count(mission_id) > 2
--15. Find the number of missions commanded by astronauts for each nationality where more than 5
--missions were 

select a.nationality , count(mission_id) 
from Astronauts a
join Participation p on a.astronaut_id = p.astronaut_id
join Missions m
on m.mission_id = p.mission_id
where p.role = 'commander'
group by a.nationality
having count(mission_id) > 5
--16. Retrieve the name of the spacecraft used in the mission "Apollo 11" (Use sub Query)

select spaccraft_name
from Spacecrafts
where spacecraft_id IN (
    select spacecraft_id 
    from Participation
    where mission_id = (
        select mission_id 
        from Missions 
        where mission_name = 'Apollo 11'
    )
);
--17. Create a view that shows all active missions (those that launched after 2020).
create view view_missions as 
select mission_name , launch_date , duration_days , mission_type
from Missions
where launch_date > '2020-01-01'


--18. List all astronauts and their respective spacecraft for each mission they participated in.

select a.astronaut_name , m.mission_name ,s.spacecraft_name
from Astronauts a join Participation p 
on a.astronaut_id = p.astronaut_id 
join Missions m 
on m.mission_id = p.mission_id
join Spacecrafts s
on s.spacecraft_id = p.spacecraft_id
--19. Retrieve the names of astronauts who participated in missions using spacecrafts manufactured by
--"SpaceX", along with the names of those missions and the duration of each mission. Include only
--astronauts who have participated in more than 2 missions.

select a.astronaut_name , m.mission_name , m.duration_days , a.total_space_missions
from Astronauts a
join Participation p
on a.astronaut_id = p.astronaut_id
join Missions m
on m.mission_id = p.mission_id 
join Spacecrafts s 
on s.spacecraft_id = p.spacecraft_id
where s.manufacturer = 'SpaceX' and a.total_space_missions > 2
--20. Retrieve the names of astronauts, the names of missions they participated in, the names of
--spacecraft used in those missions, and the manufacturers of those spacecraft, for missions where
--the mission duration is greater than the average duration of all missions conducted by astronauts
--from the "USA".

select a.astronaut_name, 
m.mission_name , 
s.spacecraft_name ,
s.manufacturer ,
avg(m.duration_days) ,
a.nationality
from Astronauts a
join Participation p
on a.astronaut_id = p.astronaut_id
join Missions m
on m.mission_id = p.mission_id 
join Spacecrafts s 
on s.spacecraft_id = p.spacecraft_id
where m.duration_days > (
select avg(m2.duration_days) 
from Missions m2
join Participation p2
on m2.mission_id = p2.mission_id
join Astronauts a2
on a2.astronaut_id = p2.astronaut_id
where a2.nationality = 'usa')