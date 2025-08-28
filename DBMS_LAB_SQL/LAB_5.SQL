USE CSE_3A_258;

CREATE TABLE DEPOSITE(
	ACTNO INT,
	CNAME VARCHAR(50),
	BNAME VARCHAR(50),
	AMOUNT DECIMAL(8 , 2),
	ADATE DATETIME
);

SELECT * FROM DEPOSITE;

DROP TABLE DEPOSITE;
--1. Add two more columns City VARCHAR (20) and Pincode INT.
ALTER TABLE DEPOSITE
ADD CITY VARCHAR(20) , pincode int;
--2. Add column state VARCHAR(20).

ALTER TABLE DEPOSITE
ADD STATEX VARCHAR(20);
--3. Change the size of CNAME column from VARCHAR (50) to VARCHAR (35).

ALTER TABLE DEPOSITE
ALTER COLUMN CNAME VARCHAR(35);
--4. Change the data type DECIMAL to INT in amount Column.
ALTER TABLE DEPOSITE 
ALTER COLUMN AMOUNT INT;
--5. Delete Column City from the DEPOSIT table.
ALTER TABLE DEPOSITE
DROP COLUMN CITY;
--6. Rename Column ActNo to ANO
SP_RENAME 'DEPOSITE.ACTNO' , 'ANO';
--7. Change name of table DEPOSIT to DEPOSIT_DETAIL.
SP_RENAME 'DEPOSITE' , 'DEPOSITE_DETAIL';

SELECT * FROM DEPOSITE_DETAIL;


--1. Rename Column ADATE to AOPENDATE OF DEPOSIT_DETAIL table
SP_RENAME 'DEPOSITE_DETAIL.ADATE' , 'AOPENDATE';
--2. Delete Column AOPENDATE from the DEPOSIT_DETAIL table.
ALTER TABLE DEPOSITE_DETAIL
DROP COLUMN AOPENDATE;
--3. Rename Column CNAME to CustomerName.
SP_RENAME 'DEPOSITE_DETAIL.CNAME' , 'CUSTOMER_NAME';
--4. Add Column country.

ALTER TABLE DEPOSITE_DETAIL
ADD COUNTRY VARCHAR(50);


CREATE TABLE STUDENT_DETAIL(
ENROLLMENT_NO VARCHAR(20),
ANAME VARCHAR(25),
CPI DECIMAL(5,2),
BIRTHDATE DATETIME
);

SELECT * FROM STUDENT_DETAIL;


--From the above given tables perform the following queries (ALTER, RENAME Operation):


--1. Add two more columns City VARCHAR (20) (Not null) and Backlog INT (Null).
ALTER TABLE STUDENT_DETAIL
ADD CITY VARCHAR(20) NOT NULL , BACKLOG INT NULL ;

--2. Add column department VARCHAR (20) Not Null.

DROP TABLE STUDENT_DETAIL
ALTER TABLE STUDENT_DETAIL
ADD DEPARTMENT VARCHAR(20) NOT NULL
--3. Change the size of NAME column of student_detail from VARCHAR (25) to VARCHAR (35).

ALTER TABLE STUDENT_DETAIL
ALTER COLUMN ANAME VARCHAR(35);
--4. Change the data type DECIMAL to INT in CPI Column.

ALTER TABLE STUDENT_DETAIL
ALTER COLUMN CPI INT;
--5. Delete Column City from the student_detail table.

ALTER TABLE STUDENT_DETAIL
DROP COLUMN CITY;
--6. Rename Column Enrollment_No to ENO.

SP_RENAME 'STUDENT_DETAIL.ENROLLMENT_NO' , 'ENO';
--7. Change name of table student_detail to STUDENT_MASTER.

SP_RENAME 'STUDENT_DETAIL' , 'STUDENT_MASTER';


CREATE TABLE DEPOSITE_DETAIL1(
ANO INT,
CUSTOMERNAME VARCHAR(50),
BNAME VARCHAR(50),
AMOUNT INT ,
PINCODE INT
);
 
SELECT * FROM DEPOSITE_DETAIL1;



--1. Delete all the records of DEPOSIT_DETAIL table having amount less than and equals to 4000.

DELETE FROM DEPOSITE_DETAIL1
WHERE AMOUNT <= 4000;
--2. Delete all the accounts CHANDI BRANCH.

DELETE FROM DEPOSITE_DETAIL1
WHERE BNAME = 'CHANDI';
--3. Delete all the accounts having account number (ANO) is greater than 102 and less than 105.

DELETE FROM DEPOSITE_DETAIL1
WHERE ANO > 102 AND ANO < 105;
--4. Delete all the accounts whose branch is ‘AJNI’ or ‘POWAI’

DELETE FROM DEPOSITE_DETAIL1
WHERE BNAME IN ('AJNI' , 'POWAI');
--5. Delete all the accounts whose account number is NULL.

DELETE FROM DEPOSITE_DETAIL1
WHERE ANO IS NULL;
--6. Delete all the remaining records using Delete command.

DELETE FROM DEPOSITE_DETAIL1;
--7. Delete all the records of Deposit_Detail table. (Use Truncate)

TRUNCATE TABLE DEPOSITE_DETAIL;
--8. Remove Deposit_Detail table. (Use Drop)

DROP TABLE DEPOSITE_DETAIL1;


CREATE TABLE EMPLOYEE_MASTER(
EMP_NO INT,
EMP_NAME VARCHAR(25),
JOINNING_DATE DATETIME,
SALARY DECIMAL(8,2),
CITY VARCHAR(20)
);

SELECT * FROM EMPLOYEE_MASTER;

INSERT INTO EMPLOYEE_MASTER (EMP_NO, EMP_NAME, JOINNING_DATE, SALARY, CITY)
VALUES
(101, 'Keyur', '2002-01-05', 12000.00, 'Rajkot'),
(102, 'Hardik', '2004-02-15', 14000.00, 'Ahmedabad'),
(103, 'Kajal', '2006-03-14', 15000.00, 'Baroda'),
(104, 'Bhoomi', '2005-06-23', 12500.00, 'Ahmedabad'),
(105, 'Harmit', '2004-02-15', 14000.00, 'Rajkot'),
(106, 'Mitesh', '2001-09-25', 5000.00, 'Jamnagar'),
(107, 'Meera', NULL, 7000.00, 'Morbi'),
(108, 'Kishan', '2003-02-06', 10000.00, NULL);

-- 1. Delete all records with salary >= 14000
DELETE FROM Employee_MASTER
WHERE Salary >= 14000;

-- 2. Delete all employees from 'RAJKOT' city
DELETE FROM Employee_MASTER
WHERE City = 'RAJKOT';

-- 3. Delete employees who joined after 1st Jan 2007
DELETE FROM Employee_MASTER
WHERE JOINNING_DATE > '2007-01-01';

-- 4. Delete employees with NULL joining date but non-null name
DELETE FROM Employee_MASTER
WHERE JOINNING_DATE IS NULL AND EMP_NAME IS NOT NULL;

-- 5. Delete employees with salary = 50% of 20000 (i.e., 10000)
DELETE FROM Employee_MASTER
WHERE Salary = 0.5 * 20000;

-- 6. Delete employees whose City is not empty (i.e., not NULL)
DELETE FROM Employee_MASTER
WHERE City IS NOT NULL;

-- 7. Delete all records using TRUNCATE
TRUNCATE TABLE Employee_MASTER;

-- 8. Remove the entire table using DROP
DROP TABLE Employee_MASTER;

DROP TABLE STUDENT;
