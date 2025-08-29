--1. Display the result of 5 multiply by 30.

SELECT 5 * 30 AS RESULT;

--2. Find out the absolute value of -25, 25, -50 and 50.

SELECT ABS(-25) , ABS(25) , ABS(-50) , ABS(50)
--3. Find smallest integer value that is greater than or equal to 25.2, 25.7 and -25.2.

SELECT FLOOR(25.2) , FLOOR(25.7) , FLOOR(-25.2) 
--4. Find largest integer value that is smaller than or equal to 25.2, 25.7 and -25.2.

SELECT CEILING(25.2) , CEILING(25.2) , CEILING(-25.2) 
--5. Find out remainder of 5 divided 2 and 5 divided by 3.

SELECT 5 % 2 AS Remainder_5_2,
5 % 3 AS Remainder_5_3;
--6. Find out value of 3 raised to 2nd power and 4 raised 3rd power.

SELECT 
    POWER(3, 2) AS Power_3_2,
    POWER(4, 3) AS Power_4_3;
--7. Find out the square root of 25, 30 and 50.

SELECT 
    SQRT(25) AS Sqrt_25,
    SQRT(30) AS Sqrt_30,
    SQRT(50) AS Sqrt_50;
--8. Find out the square of 5, 15, and 25.

SELECT 
    POWER(5, 2) AS Square_5,
    POWER(15, 2) AS Square_15,
    POWER(25, 2) AS Square_25;

--9. Find out the value of PI.

SELECT PI() AS Pi_Value;
--10. Find out round value of 157.732 for 2, 0 and -2 decimal points.

SELECT 
    ROUND(157.732, 2) AS Round_2dp,
    ROUND(157.732, 0) AS Round_0dp,
    ROUND(157.732, -2) AS Round_neg2dp;

--11. Find out exponential value of 2 and 3.

SELECT 
    EXP(2) AS Exp_2,
    EXP(3) AS Exp_3;
--12. Find out logarithm having base e of 10 and 2.

SELECT 
    LOG(10) AS Ln_10,
    LOG(2) AS Ln_2;
--13. Find out logarithm having base b having value 10 of 5 and 100.

SELECT 
    LOG10(5) AS Log10_5,
    LOG10(100) AS Log10_100;
--14. Find sine, cosine and tangent of 3.1415.

SELECT 
    SIN(3.1415) AS Sine,
    COS(3.1415) AS Cosine,
    TAN(3.1415) AS Tangent;
--15. Find sign of -25, 0 and 25.

SELECT 
    SIGN(-25) AS Sign_Neg,
    SIGN(0) AS Sign_Zero,
    SIGN(25) AS Sign_Pos;
--16. Generate random number using function.
SELECT RAND() AS Random_Number;


--------------------------------------PART B ---------------------------------------

CREATE TABLE EMP_MASTERS (
    EmpNo INT PRIMARY KEY,
    EmpName VARCHAR(50),
    JoiningDate DATE,
    Salary DECIMAL(10,2),
    Commission DECIMAL(10,2),
    City VARCHAR(50),
    DeptCode VARCHAR(10)
);


INSERT INTO EMP_MASTERS (EmpNo, EmpName, JoiningDate, Salary, Commission, City, DeptCode) VALUES
(101, 'Keyur', '2002-01-05', 12000.00, 4500.00, 'Rajkot', '3@g'),
(102, 'Hardik', '2004-02-15', 14000.00, 2500.00, 'Ahmedabad', '3@'),
(103, 'Kajal', '2006-03-14', 15000.00, 3000.00, 'Baroda', '3-GD'),
(104, 'Bhoomi', '2005-06-23', 12500.00, 1000.00, 'Ahmedabad', '1A3D'),
(105, 'Harmit', '2004-02-15', 14000.00, 2000.00, 'Rajkot', '312A');


--1. Display the result of Salary plus Commission.

SELECT EMPNO , EMPNAME ,Salary , Commission , (SALARY + Commission) AS TOTAL_SALARY
FROM EMP_MASTERS;

--2. Find smallest integer value that is greater than or equal to 55.2, 35.7 and -55.2.

SELECT FLOOR(55.2) , FLOOR(35.7) , FLOOR(-55.2) 
--3. Find largest integer value that is smaller than or equal to 55.2, 35.7 and -55.2.

SELECT CEILING(55.2) , CEILING(35.7) , CEILING(-55.2) 
--4. Find out remainder of 55 divided 2 and 55 divided by 3.

SELECT 55 % 2 , 55 % 3;
--5. Find out value of 23 raised to 2nd power and 14 raised 3rd power.

SELECT POWER(23, 2) , POWER(14,3)


----------------------------------------PART C  ------------------------------------

--1. Retrieve the details of employees whose total earnings (Salary + Commission) are greater than 15000.

SELECT (Salary + Commission) AS TOTAL_SAL
FROM EMP_MASTERS;
--2. Find the details of employees whose commission is more than 25% of their salary.

SELECT EmpNo,
    EmpName,
    Salary,
    Commission,
    City,
    DeptCode
FROM EMP_MASTERS
WHERE COMMISSION > SALARY * 0.25;

--3. List the employees who joined before 2005 and whose total earnings (Salary + Commission) are greater
--than 15000.

SELECT JoiningDate , empno , empname 
from EMP_MASTERS
WHERE  (Salary + Commission)  > 15000
--4. Find employees whose total earnings (Salary + Commission) are at least double their salary.

SELECT Salary 
FROM EMP_MASTERS
WHERE (Salary + Commission)  = 2*Salary;



---------------------------------STRING FUNCTION ------------------------------


--1. Find the length of following. (I) NULL (II) ‘ hello ’ (III) Blank

SELECT LEN(NULL) AS NULL_LANGTH, 
        LEN('HELLO') AS HELLO_LEN,
        LEN('') AS BLANK_LENGTH 
--2. Display your name in lower & upper case.

SELECT LOWER('DEVANSHU') , UPPER('devanshu');
--3. Display first three characters of your name.
 
SELECT LEFT('DEVANSHU' , 3)
--4. Display 3rd to 10th character of your name.

SELECT SUBSTRING('DEVANHU' , 3 , 10)
--5. Write a query to convert ‘abc123efg’ to ‘abcXYZefg’ & ‘abcabcabc’ to ‘ab5ab5ab5’ using REPLACE.

SELECT REPLACE('ABC123EFG' , '123' , 'XYZ') , REPLACE('ABCABCABC' , 'C' , '5');
--6. Write a query to display ASCII code for ‘a’,’A’,’z’,’Z’, 0, 9.

SELECT ASCII('A') , ASCII('a') ,ASCII('Z') ,ASCII('z') ,ASCII('0') ,  ASCII('5')
--7. Write a query to display character based on number 97, 65,122,90,48,57.

SELECT char(97) , char(122) , char(90) , char(48) , char(57) ,
--8. Write a query to remove spaces from left of a given string ‘hello world ‘.
--9. Write a query to remove spaces from right of a given string ‘ hello world ‘.
--10. Write a query to display first 4 & Last 5 characters of ‘SQL Server’.
--11. Write a query to convert a string ‘1234.56’ to number (Use cast and convert function).
--12. Write a query to convert a float 10.58 to integer (Use cast and convert function).
--13. Put 10 space before your name using function.
--14. Combine two strings using + sign as well as CONCAT ().
--15. Find reverse of “Darshan”.
--16. Repeat your name 3 times.