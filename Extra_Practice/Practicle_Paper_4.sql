-- Authors Table
CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    birth_year INT,
    nationality VARCHAR(50)
);

-- Books Table
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author_id INT,
    genre VARCHAR(50),
    publish_year INT,
    available_copies INT DEFAULT 0,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Members Table
CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(20),
    membership_date DATE
);

-- Loans Table
CREATE TABLE Loans (
    loan_id INT PRIMARY KEY,
    book_id INT,
    member_id INT,
    loan_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

--1. Display the top 3 percentages books order by title in descending.

select top 3 percentage * from Books
order by title desc
--2. Display a distinct list of genres.

select distinct genre from Books
--3. Insert a new book into the books table. ('The Adventures of Sherlock Holmes', 2, 'Mystery', 1892,
--5)

INSERT INTO Books (title, author_id, genre, publish_year, available_copies)
VALUES ('The Adventures of Sherlock Holmes', 2, 'Mystery', 1892, 5);

--4. Update the number of available copies is 10 for a book whose book_id is available.

UPDATE Books
SET available_copies = 10
WHERE book_id = 1; 

--5. Delete a member from the members table whose member_id is 4.

DELETE FROM Members
WHERE member_id = 4;


--6. Add a new column language varchar(20) to the books table.

ALTER TABLE Books
ADD language VARCHAR(20);

--7. Truncate all data from the loans table. (Using Truncate)

truncate table Loans;
--8. Find books whose title starts with ‘H’ and end with ‘L’.

SELECT title
FROM Books
WHERE title LIKE 'H%L';

--9. Find authors whose name does not ends with vowel.

select name 
from authors 
where name not like '%[aeiouAEIUO]'
--10. Find Lenth of ‘Manish Pandey’

SELECT LEN('Manish Pandey') AS NAME_LEN
--11. Calculate your age in year.

SELECT DATEDIFF(YEAR , '2006-11-02' , GETDATE()) AS AGE 
--12. Display the total number of books by genre.


SELECT GENRE , COUNT(*) AS TOTAL_BOOK
FROM Books
GROUP BY GENRE
--13. Display the minimum, maximum, and average number of available copies for each genre whose
--book_id is available.

SELECT MIN(available_copies) , MAX(available_copies) , AVG(available_copies) , BOOK_ID 
FROM BOOKS
WHERE BOOK_ID IS NOT NULL
GROUP BY GENRE
--14. Display the title of books where the author was born before 1970.(Using Sub query)

SELECT T.TITLE 
FROM BOOKS T
WHERE author_id iN (SELECT author_id FROM AUTHOR WHERE BIRHT_YEAR < 1970) 
--15. Create a view View_Member whose membership date is not available from members table

CREATE VIEW VIEW_MAMER AS 
SELECT member_id, name, email, phone_number, membership_date FROM Members
WHERE membership_date IS NULL
--16. Find the title of books that have been borrowed the most (the top 1 book) and the corresponding
--author name (Using sub Query)

SELECT B.TITLE , A.AUTHORE AS AUTHORNAME 
FROM BOOKS B
JOIN AUTHORS A ON B.author_id = A.author_id
WHERE B.author_id = (
SELECT TOP 1 BOOKS_ID 
FROM LOANS 
GROUP BY BOOK_ID
ORDER BY COUNT(*) DESC
):
--17. Display the loan_id ,member name ,title ,loan date whose member name is 'Raj'.

SELECT L.loan_id, M.name AS MemberName, B.title AS BookTitle, L.loan_date
FROM Loans L
JOIN Members M ON L.member_id = M.member_id
JOIN Books B ON L.book_id = B.book_id
WHERE M.name = 'Raj';

--18. List the titles of books that have been borrowed by members who registered before 2020.(using
--Sub query)


--19. Display the total number of books borrowed by each member.

SELECT M.name AS MemberName, COUNT(L.loan_id) AS TotalBooksBorrowed
FROM Members M
LEFT JOIN Loans L ON M.member_id = L.member_id
GROUP BY M.name;

--20. Display the title of books that have not been borrowed by any members

SELECT B.title
FROM Books B
LEFT JOIN Loans L ON B.book_id = L.book_id
WHERE L.book_id IS NULL;

