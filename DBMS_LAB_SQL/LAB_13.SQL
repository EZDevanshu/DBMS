CREATE TABLE AUTHOR(
AUTHORID INT PRIMARY KEY,
AUTHORNANE VARCHAR(50)NOT NULL,
COUNTRY VARCHAR(30) NULL
);

INSERT INTO AUTHOR VALUES
(1 , 'CHETAN BHAGAT' , 'INDIA'),
(2, 'Arundhati Roy' , 'INDIA'),
(3 , 'Amish Tripathi' , 'INDIA'),
(4 , 'Ruskin Bond' , 'INDIA'),
(5 , 'Jhumpa Lahiri ' , 'INDIA'),
(6 , 'Paulo Coelho' , 'BRAZIL'),
(7 , 'Sudha Murty' , 'INDIA');

SELECT *  FROM AUTHOR;

CREATE TABLE PUBLISHER (
PUBLISHERID INT PRIMARY KEY ,
PUBLISHERNAME VARCHAR(50) NOT NULL UNIQUE,
CITY VARCHAR(40) NOT NULL
);


INSERT INTO PUBLISHER VALUES
(1 ,'Rupa Publications' ,'New Delhi'),
(2 ,'Penguin India', 'Gurugram'),
(3 ,'HarperCollins India', 'Noida'),
(4, 'Aleph Book Company' ,'New Delhi');

SELECT * FROM PUBLISHER;

CREATE TABLE Book (
    BookID INT PRIMARY KEY,
    Title VARCHAR(200) NOT NULL,
    AuthorID INT NOT NULL,
    PublisherID INT NOT NULL,
    Price DECIMAL(8,2) NOT NULL,
    PublicationYear INT NOT NULL,
    FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID),
    FOREIGN KEY (PublisherID) REFERENCES Publisher(PublisherID)
);

INSERT INTO Book (BookID, Title, AuthorID, PublisherID, Price, PublicationYear) VALUES
(101, 'Five Point Someone', 1, 1, 250.00, 2004),
(102, 'The God of Small Things', 2, 2, 350.00, 1997),
(103, 'Immortals of Meluha', 3, 3, 300.00, 2010),
(104, 'The Blue Umbrella', 4, 1, 180.00, 1980),
(105, 'The Lowland', 5, 2, 400.00, 2013),
(106, 'Revolution 2020', 1, 1, 275.00, 2011),
(107, 'Sita: Warrior of Mithila', 3, 3, 320.00, 2017),
(108, 'The Room on the Roof', 4, 4, 200.00, 1956);

SELECT * FROM AUTHOR;
SELECT * FROM PUBLISHER;
SELECT * FROM BOOK ;


---------------------- PART A --------------------------------

--1. List all books with their authors.

SELECT BOOK.Title , AUTHOR.AUTHORNANE
FROM AUTHOR JOIN BOOK
ON AUTHOR.AUTHORID = BOOK.AuthorID;
--2. List all books with their publishers.

SELECT BOOK.Title , PUBLISHER.PUBLISHERNAME
FROM BOOK JOIN PUBLISHER
ON Book.PublisherID = PUBLISHER.PUBLISHERID;
--3. List all books with their authors and publishers.

SELECT BOOK.Title , PUBLISHER.PUBLISHERNAME , AUTHOR.AUTHORNANE
FROM BOOK JOIN PUBLISHER 
ON BOOK.PublisherID = PUBLISHER.PUBLISHERID 
JOIN AUTHOR 
ON BOOK.AuthorID = AUTHOR.AUTHORID

--4. List all books published after 2010 with their authors and publisher and price.

SELECT BOOK.TITLE , BOOK.PublicationYear , AUTHOR.AUTHORNANE , PUBLISHER.PUBLISHERNAME , BOOK.Price
FROM BOOK JOIN AUTHOR ON BOOK.AuthorID = AUTHOR.AUTHORID
JOIN PUBLISHER ON PUBLISHER.PUBLISHERID = Book.PublisherID

--5. List all authors and the number of books they have written.

SELECT COUNT(BOOK.BookID) , AUTHOR.AUTHORNANE
FROM BOOK JOIN AUTHOR 
ON Book.AuthorID = AUTHOR.AUTHORID
GROUP BY AUTHOR.AUTHORNANE
--6. List all publishers and the total price of books they have published.

SELECT PUBLISHER.PUBLISHERNAME  , SUM(BOOK.Price) 
FROM BOOK JOIN PUBLISHER 
ON BOOK.PublisherID = PUBLISHER.PUBLISHERID
GROUP BY PUBLISHER.PUBLISHERNAME


--7. List authors who have not written any books.

SELECT 
    AUTHOR.AuthorName,
    COUNT(B.BookID) AS TotalBooks,
    AVG(B.Price) AS AveragePrice
FROM 
    Author A
LEFT JOIN 
    Book B ON A.AuthorID = B.AuthorID
GROUP BY 
    A.AuthorName;
--8. Display total number of Books and Average Price of every Author.

SELECT COUNT(BOOK.BOOKID) , AUTHOR.AUTHORID , AVG(BOOK.Price)
FROM AUTHOR LEFT JOIN BOOK
ON BOOK.AuthorID = AUTHOR.AUTHORID

--9. lists each publisher along with the total number of books they have published, sorted from highest to
--lowest.
SELECT 
    P.PublisherName,
    COUNT(B.BookID) AS TotalBooksPublished
FROM 
    Publisher P
LEFT JOIN 
    Book B ON P.PublisherID = B.PublisherID
GROUP BY 
    P.PublisherName
ORDER BY 
    TotalBooksPublished DESC;

--10. Display number of books published each year.


--9. lists each publisher along with the total number of books they have published, sorted from highest to
--lowest.
--10. Display number of books published each year.
SELECT 
    YEAR(B.PublishDate) AS YearPublished,
    COUNT(B.BookID) AS NumberOfBooks
FROM 
    Book B
GROUP BY 
    YEAR(B.PublishDate)
ORDER BY 
    YearPublished;

--Part – B:
--1. List the publishers whose total book prices exceed 500, ordered by the total price.
select Publisher.PublisherName , sum(Book.Price) 
from Book
inner join Publisher
on Book.PublisherID = Publisher.PublisherID
group by Publisher.PublisherName
order by sum(Book.Price) 
--2. List most expensive book for each author, sort it with the highest price.
select Author.AuthorName , max(Book.Price) 
from Book
inner join Author
on Book.AuthorID = Author.AuthorID
group by Author.AuthorName
order by max(Book.Price) desc
