CREATE TABLE SalesData (
    Region VARCHAR(50),
    Product VARCHAR(20),
    Sales_Amount INT,
    Year INT
);

INSERT INTO SalesData (Region, Product, Sales_Amount, Year) VALUES
('North America', 'Watch', 1500, 2023),
('Europe', 'Mobile', 1200, 2023),
('Asia', 'Watch', 1800, 2023),
('North America', 'TV', 900, 2024),
('Europe', 'Watch', 2000, 2024),
('Asia', 'Mobile', 1000, 2024),
('North America', 'Mobile', 1600, 2023),
('Europe', 'TV', 1500, 2023),
('Asia', 'TV', 1100, 2024),
('North America', 'Watch', 1700, 2024);

--Part – A:
--1. Display Total Sales Amount by Region.
select Region , sum(Sales_Amount) as total
from SalesData
group by Region
--2. Display Average Sales Amount by Product
select Product , avg(Sales_Amount) as total
from SalesData
group by Product
--3. Display Maximum Sales Amount by Year
select year , max(Sales_Amount)
from SalesData
group by year
--4. Display Minimum Sales Amount by Region and Year
select year , Region , min(Sales_Amount)
from SalesData
group by year , Region
--5. Count of Products Sold by Region
select Region , count(Sales_Amount)
from SalesData
group by Region
--6. Display Sales Amount by Year and Product
select year , Product , sum(Sales_Amount)
from SalesData
group by year , Product
--7. Display Regions with Total Sales Greater Than 5000
select Region , sum(Sales_Amount)
from SalesData
group by Region
having sum(Sales_Amount) > 5000

--8. Display Products with Average Sales Less Than 10000
select Product , avg(Sales_Amount)
from SalesData
group by Product
having avg(Sales_Amount) < 10000

--9. Display Years with Maximum Sales Exceeding 500
select year , max(Sales_Amount)
from SalesData
group by year
having  max(Sales_Amount) > 500

--10. Display Regions with at Least 3 Distinct Products Sold.
select Region , count( distinct PRODUCT)
from SalesData
group by Region
having  count( distinct PRODUCT) >= 3 
--11. Display Years with Minimum Sales Less Than 1000
select year , min(Sales_Amount)
from SalesData
group by year
having  min(Sales_Amount) < 1000
--12. Display Total Sales Amount by Region for Year 2023, Sorted by Total Amount
select Region , sum(Sales_Amount)
from SalesData
where year = 2023
group by Region
order by sum(Sales_Amount)
--13. Find the Region Where 'Mobile' Had the Lowest Total Sales Across All Years.
select top 1 Region , sum(Sales_Amount)
from SalesData
where product = 'Mobile'
group by Region
order by sum(Sales_Amount)
--14. Find the Product with the Highest Sales Across All Regions in 2023.
select top 1 Product , sum(Sales_Amount)
from SalesData
where year = 2023
group by Product
order by sum(Sales_Amount) desc
--15. Find Regions Where 'TV' Sales in 2023 Were Greater Than 1000.
select Region , sum(Sales_Amount)
from SalesData
where PRODUCT = 'tv' and year = 2023
group by Region
having sum(Sales_Amount) > 1000



--Part – B:


--1. Display Count of Orders by Year and Region, Sorted by Year and Region
select year , region , count(product)
from SalesData
group by year , Region
order by year , Region
--2. Display Regions with Maximum Sales Amount Exceeding 1000 in Any Year, Sorted by Region
select region , max(Sales_Amount)
from SalesData
group by Region
having max(Sales_Amount) >= 1000
order by  Region
--3. Display Years with Total Sales Amount Less Than 10000, Sorted by Year Descending
select Year , max(Sales_Amount)
from SalesData
group by Year
having max(Sales_Amount) < 10000
order by  year desc
--4. Display Top 3 Regions by Total Sales Amount in Year 2024
select top 3 Region , max(Sales_Amount)
from SalesData
where year = 2024
group by Region
--5. Find the Year with the Lowest Total Sales Across All Regions.
SELECT TOP 1 Year, SUM(Sales_Amount) AS TotalSales
FROM SalesData
GROUP BY Year
ORDER BY TotalSales ASC


--Part – C:


--1. Display Products with Average Sales Amount Between 1000 and 2000, Ordered by Product Name
select PRODUCT ,  avg(Sales_Amount)
from SalesData
group by product
having avg(Sales_Amount) > 1000 and avg(Sales_Amount) < 2000
order by product
--2. Display Years with More Than 1 Orders from Each Region
SELECT Year, Region, COUNT(*) AS OrderCount
FROM SalesData
GROUP BY Year, Region
HAVING COUNT(*) > 1
ORDER BY Year DESC, Region
--3. Display Regions with Average Sales Amount Above 1500 in Year 2023 sort by amount in descending.
select Region ,  avg(Sales_Amount)
from SalesData
where year = 2023
group by Region
having avg(Sales_Amount) > 1500 
order by  avg(Sales_Amount) desc
--4. Find out region wise duplicate product.
select Region , PRODUCT ,  count(*)
from SalesData
group by Region , PRODUCT
having count(*) > 1
--5. Find out year wise duplicate product.
select year , PRODUCT ,  count(*)
from SalesData
group by year , PRODUCT
having count(*) > 1