CREATE TABLE STU_INFO (
    Rno INT PRIMARY KEY,
    Name VARCHAR(50),
    Branch VARCHAR(10)
);

INSERT INTO STU_INFO (Rno, Name, Branch) VALUES
(101, 'Raju', 'CE'),
(102, 'Amit', 'CE'),
(103, 'Sanjay', 'ME'),
(104, 'Neha', 'EC'),
(105, 'Meera', 'EE'),
(106, 'Mahesh', 'ME');


CREATE TABLE RESULT (
    Rno INT,
    SPI DECIMAL(3,1),
);

INSERT INTO RESULT (Rno, SPI) VALUES
(101, 8.8),
(102, 9.2),
(103, 7.6),
(104, 8.2),
(105, 7.0);


CREATE TABLE EMPLOYEE_MASTER (
    EmployeeNo VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(50),
    ManagerNo VARCHAR(10),
    FOREIGN KEY (ManagerNo) REFERENCES EMPLOYEE_MASTER(EmployeeNo)
);


INSERT INTO EMPLOYEE_MASTER (EmployeeNo, Name, ManagerNo) VALUES
('E01', 'Tarun', NULL),
('E02', 'Rohan', 'E02'),  
('E03', 'Priya', 'E01'),
('E04', 'Milan', 'E03'),
('E05', 'Jay', 'E01'),
('E06', 'Anjana', 'E04');


--------------------------------- PART - A --------------------------

--1. Combine information from student and result table using cross join or Cartesian product.

SELECT * FROM student , RESULT ;
--2. Perform inner join on Student and Result tables.

SELECT * 
FROM STU_INFO INNER JOIN RESULT 
ON STU_INFO.RNO = RESULT.Rno;
--3. Perform the left outer join on Student and Result tables.

SELECT * 
FROM STU_INFO LEFT JOIN RESULT
ON STU_INFO.RNO = RESULT.RNO
--4. Perform the right outer join on Student and Result tables.

SELECT * 
FROM STU_INFO RIGHT JOIN RESULT 
ON STU_INFO.RNO = RESULT.RNO
--5. Perform the full outer join on Student and Result tables.

SELECT * 
FROM STU_INFO FULL OUTER JOIN RESULT 
ON STU_INFO.RNO = RESULT.RNO
--6. Display Rno, Name, Branch and SPI of all students.

SELECT STU_INFO.RNO , STU_INFO.Branch , RESULT.SPI
FROM STU_INFO
FULL OUTER JOIN RESULT
ON STU_INFO.RNO = RESULT.RNO

--7. Display Rno, Name, Branch and SPI of CE branch’s student only.

SELECT STU_INFO.RNO , STU_INFO.Name , STU_INFO.Branch , RESULT.SPI 
FROM STU_INFO JOIN RESULT 
ON STU_INFO.Rno = RESULT.RNO
WHERE STU_INFO.Branch = 'CE';

--8. Display Rno, Name, Branch and SPI of other than EC branch’s student only.

SELECT STU_INFO.Rno , STU_INFO.Name , STU_INFO.Branch , RESULT.SPI
FROM STU_INFO JOIN RESULT 
ON STU_INFO.RNO = RESULT.RNO
WHERE STU_INFO.Branch = 'EC'

--9. Display average result of each branch.

SELECT STU_INFO.Branch , AVG(RESULT.SPI) 
FROM STU_INFO JOIN RESULT
ON STU_INFO.RNO = RESULT.RNO
GROUP BY BRANCH;
--10. Display average result of CE and ME branch.

SELECT STU_INFO.BRANCH , AVG(RESULT.SPI) 
FROM STU_INFO LEFT OUTER JOIN RESULT 
ON STU_INFO.RNO = RESULT.RNO 
WHERE STU_INFO.BRANCH = 'CE' OR STU_INFO.BRANCH = 'ME'
GROUP BY STU_INFO.BRANCH
--11. Display Maximum and Minimum SPI of each branch.

SELECT STU_INFO.BRANCH , MIN(RESULT.SPI) , MAX(RESULT.SPI)
FROM STU_INFO JOIN RESULT 
ON STU_INFO.RNO = RESULT.RNO
GROUP BY BRANCH 
--12. Display branch wise student’s count in descending order.

SELECT STU_INFO.BRANCH , COUNT(STU_INFO.RNO) AS COUNT_INFO
FROM STU_INFO JOIN RESULT
ON STU_INFO.RNO = RESULT.RNO
GROUP BY STU_INFO.BRANCH
ORDER BY COUNT_INFO DESC


------------------------------PART B ---------------

--1. Display average result of each branch and sort them in ascending order by SPI.

SELECT STU_INFO.BRANCH , AVG(RESULT.SPI) 
FROM STU_INFO JOIN RESULT
ON STU_INFO.RNO = RESULT.RNO
GROUP BY STU_INFO.Branch 
ORDER BY AVG(RESULT.SPI) 
--2. Display highest SPI from each branch and sort them in descending order.

SELECT STU_INFO.BRANCH , MAX(RESULT.SPI) 
FROM STU_INFO JOIN RESULT 
ON STU_INFO.RNO = RESULT.RNO 
GROUP BY STU_INFO.Branch
ORDER BY MAX(RESULT.SPI) DESC

-------------------PART C ----------------------

--1. Retrieve the names of employee along with their manager’s name from the Employee table.

SELECT A.NAME , B.NAME 
FROM EMPLOYEE_MASTER A LEFT OUTER JOIN EMPLOYEE_MASTER B
ON A.ManagerNo = B.EmployeeNo;