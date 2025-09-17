CREATE TABLE MovieDetails (
    MovieID INT PRIMARY KEY, 
    Title VARCHAR(100) NOT NULL,
    Genre VARCHAR(100),
    Director VARCHAR(100),
    ReleaseYear INT
);

CREATE TABLE MovieFinancials (
    FinancialID INT PRIMARY KEY,
    BudgetUSD DECIMAL(15,2),
    BoxOfficeUSD DECIMAL(15,2),
    MovieID INT,
    FOREIGN KEY (MovieID) REFERENCES MovieDetails(MovieID)
);

CREATE TABLE MovieRatingsDuration (
    RatingID INT PRIMARY KEY,
    DurationMin INT,
    Rating DECIMAL(3,1),  -- Example: rating scale 1.0 to 10.0
    Language VARCHAR(100),
    Country VARCHAR(100),
    MovieID INT,
    FOREIGN KEY (MovieID) REFERENCES MovieDetails(MovieID)
);

--1. Retrive first five distinct movies along with their title from MovieDetails table.

select distinct top 5 m.MovieID , m.title
from MovieDetails 
--2. Display the total of the BudgetUSD and BoxOfficeUSD assign the name TotalUSD from
--MovieFinancials.

select sum(BudgetUSD + BoxOfficeUSD) as totalUSD
from MovieFinancials
--3. Insert the new row with this data (11,The Incredible Hulk, Action, Louis Leterrier,2008) in
--MovieDetails table.

insert into MovieDetails values
(11,'The Incredible Hulk', 'Action ', 'Louis Leterrier',2008);
--4. Set the value of the genre to 'Action' of 'Avengers:Endgame' movie from MovieDetails table.

update MovieDetails
set Genre = 'action'
where titel = 'Avengers:Endgame'
--5. Delete the records with duration of 181 minutes from MovieRatingsDuration table.
DELETE FROM MovieRatingsDuration
WHERE DurationMin = 181;
--6. Add a new column 'Producer' into the MovieDetails table.

ALTER TABLE MovieDetails
ADD Producer VARCHAR(100);

--7. Delete records of MovieFinancials table without removing its table structure.
TRUNCATE TABLE MovieFinancials;
--8. Retrive all the movies from MovieDetails table with title starting with 'The'.

SELECT *
FROM MovieDetails
WHERE Title LIKE 'The%';

--9. Retrive name of directors includes 'son' from MovieDetails table.

SELECT DISTINCT Director
FROM MovieDetails
WHERE Director LIKE '%son%';

--10. Convert and display title of all movies in uppercase

SELECT UPPER(Title) AS UpperTitle
FROM MovieDetails;
--11. Display the highest rating from the MovieRatingsDuration table.

SELECT MAX(Rating) AS HighestRating
FROM MovieRatingsDuration;
--12. Calculate the years between current year and movies release year.
SELECT Title, YEAR(GETDATE()) - ReleaseYear AS YearsSinceRelease
FROM MovieDetails;
--13. Find the languages in which movies have an average rating of greater than 8.0. Display the language
--and the average rating.

select Language , rating from MovieRatingsDuration
group by Language 
having avg(rating) > 8.0
--14. Retrieve the minimum, maximum, and average movie duration for each language in the
--MovieRatingsDuration table, but display only those languages where the average rating is greater
--than 7.5.

select min(DurationMin) , max(DurationMin) , avg(DurationMin) , avg(rating) , language from MovieRatingsDuration
group by language 
having avg(rating) > 7.5


--15. Find the titles of movies whose budget is higher than the average budget of all movies.(Do not use
--JOINS)
 
select title from MovieDetails
where MovieID IN(select MovieID
                    from MovieFinancials
                    where BudgetUSD > (select avg(BudgetUSD) from MovieFinancials) )
--16. Find the titles of movies that have a box office revenue greater than the average box office revenue
--of all movies.

SELECT Title
FROM MovieDetails
WHERE MovieID IN (
    SELECT MovieID
    FROM MovieFinancials
    WHERE BoxOfficeUSD > (SELECT AVG(BoxOfficeUSD) FROM MovieFinancials)
);


--17. Create a view with Rating, Language and Country columns with no data and named it MovieReview.

create view movieReview as 
select rating , language , country 
from MovieRatingsDuration
where 1 = 0 ;
--18. List all movies that have the same director but different genres, displaying the director’s name, both
--movie titles, and their respective genres.

select m1.director , m.title as movie m1 , m1.genre as genre1
    m2.title as movie2 , m2.genre as genere2
from movieDetails m1
join movieDetails m2 on m1.director = m2.director AND M1.MovieId <> m2.movieId 
where m1.genre <> m2.Genre;
--19. Retrieve the title, director, and box office earnings for all movies that were released after 2010, along
--with their ratings.
SELECT 
    d.Title, 
    d.Director, 
    f.BoxOfficeUSD, 
    r.Rating
FROM MovieDetails d
JOIN MovieFinancials f 
    ON d.MovieID = f.MovieID
JOIN MovieRatingsDuration r 
    ON d.MovieID = r.MovieID
WHERE d.ReleaseYear > 2010;
--20. List all directors and the number of movies they have directed, but only include directors who have
--directed more than 1 movie.

select Director , count(*) as NumberOfMovies
from MovieDetails 
Group by Director
having count(*) > 1