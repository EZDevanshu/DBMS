USE CSE_3A_258;

CREATE TABLE EMP (
    EID INT PRIMARY KEY,
    EName VARCHAR(50),
    Department VARCHAR(50),
    Salary INT,
    JoiningDate DATE,
    City VARCHAR(50),
    Gender VARCHAR(10)
);

INSERT INTO EMP (EID, EName, Department, Salary, JoiningDate, City, Gender) VALUES
(101, 'Rahul', 'Admin', 56000, '1990-01-01', 'Rajkot', 'Male'),
(102, 'Hardik', 'IT', 18000, '1990-09-25', 'Ahmedabad', 'Male'),
(103, 'Bhavin', 'HR', 25000, '1991-05-14', 'Baroda', 'Male'),
(104, 'Bhoomi', 'Admin', 39000, '1991-02-08', 'Rajkot', 'Female'),
(105, 'Rohit', 'IT', 17000, '1990-07-23', 'Jamnagar', 'Male'),
(106, 'Priya', 'IT', 9000, '1990-10-18', 'Ahmedabad', 'Female'),
(107, 'Bhoomi', 'HR', 34000, '1991-12-25', 'Rajkot', 'Female');

SELECT * FROM EMP;

---------------------------------------PART-A--------------------------------

--1. Display the Highest, Lowest, Label the columns Maximum, Minimum respectively.

SELECT 
    MAX(SALARY) AS Maximum,
    MIN(SALARY) AS Minimum
FROM EMP;

--2. Display Total, and Average salary of all employees. Label the columns Total_Sal and Average_Sal,
--respectively.

SELECT 
    AVG(SALARY) AS AVG_SALARY,
    SUM(Salary) AS SLARYSUM 
FROM EMP;
--3. Find total number of employees of EMPLOYEE table.

SELECT COUNT(ENAME) AS EMP_NAME
FROM EMP;
--4. Find highest salary from Rajkot city

SELECT MAX(SALARY) AS MAX_SALARY
FROM EMP;

--5. Give maximum salary from IT department.

SELECT MAX(SALARY) AS MAX_SALARY
FROM EMP
WHERE Department = 'IT';
--6. Count employee whose joining date is after 8-feb-91.

SELECT COUNT(ENAME) AS jOIN_DATE 
FROM EMP
WHERE JoiningDate = '1991-02-08';
--7. Display average salary of Admin department.

SELECT AVG(SALARY) AS AVG_SAL
FROM EMP
WHERE Department = 'ADMIN';
--8. Display total salary of HR department.

SELECT SUM(SALARY) AS SUM_HR
FROM EMP
WHERE Department = 'HR';
--9. Count total number of cities of employee without duplication.

SELECT COUNT(DISTINCT CITY) AS CITY_LIST 
FROM EMP
--10. Count unique departments.

SELECT COUNT(DISTINCT department) AS UNI_DEP
FROM EMP
--11. Give minimum salary of employee who belongs to Ahmedabad.

SELECT MIN(SALARY) AS MIN_SAL_AHM
FROM EMP 
WHERE City = 'Ahmedabad';
--12. Find city wise highest salary.

SELECT MAX(SALARY) AS MAX_SALARY
FROM EMP 
GROUP BY CITY;
--13. Find department wise lowest salary.

SELECT MIN(SALARY) AS MIN_SALARY
FROM EMP 
GROUP BY Department;
--14. Display city with the total number of employees belonging to each city.

SELECT COUNT(*) AS TOTA_EMP
FROM EMP 
GROUP BY CITY;
--15. Give total salary of each department of EMP table.

SELECT SUM(SALARY) AS TOTAL_SAL
FROM EMP
GROUP BY Department;
--16. Give average salary of each department of EMP table without displaying the respective department
--name.

SELECT AVG(SALARY) AS AVG_AS_DEPART
FROM EMP
GROUP BY Department;
--17. Count the number of employees for each department in every city.

SELECT COUNT(EID) AS EID_COUNT
FROM EMP
GROUP BY Department;
--18. Calculate the total salary distributed to male and female employees.

SELECT SUM(SALARY) AS TOTAL_GENDERWISE
FROM EMP
GROUP BY Gender;
--19. Give city wise maximum and minimum salary of female employees.

SELECT MAX(SALARY) AS MAX_DIST , MIN(SALARY) AS MIN_DIST 
FROM EMP
WHERE GENDER = 'Female'
GROUP BY CITY;
--20. Calculate department, city, and gender wise average salary.

SELECT CITY , Department , Gender , AVG(SALARY) AS DEPARTMENT_WISE 
FROM EMP
GROUP BY CITY , Department , Gender ;


---------------------------PART-B---------------------------------

--1. Count the number of employees living in Rajkot.

SELECT COUNT(EID) COUNT_EMP_IN_RAJKOT
FROM EMP 
WHERE CITY = 'RAJKOT';
--2. Display the difference between the highest and lowest salaries. Label the column DIFFERENCE.

SELECT (MAX(SALARY) - MIN(SALARY)) AS DIFFERENCE
FROM EMP ;

--3. Display the total number of employees hired before 1st January, 1991.

SELECT COUNT(EID) AS HIRED 
FROM EMP
WHERE JoiningDate < '1991-01-01';

--------------------------Part – C-----------------------------------
--1. Count the number of employees living in Rajkot or Baroda.

SELECT COUNT(EID) AS RAJKOT_EMP
FROM EMP
WHERE CITY IN ('RAJKOT' , 'BARODA');
--2. Display the total number of employees hired before 1st January, 1991 in IT department.
    
SELECT COUNT(EID) AS DISPLAY
FROM EMP 
WHERE JoiningDate < '1991-01-01' AND Department = 'IT';
--3. Find the Joining Date wise Total Salaries.

SELECT SUM(SALARY) AS Date_WISE
FROM EMP
GROUP BY JoiningDate;
--4. Find the Maximum salary department & city wise in which city name starts with ‘R’.

SELECT Department , CITY, MAX(SALARY) AS MAXiNrNAME
FROM EMP
WHERE CITY LIKE 'R%'
GROUP BY Department , CITY;
