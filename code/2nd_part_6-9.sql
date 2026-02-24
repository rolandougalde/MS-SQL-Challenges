/*DEVELOPMENT SQL SERVER EXCERCISES*/
------------------------------------

-- 6. Show the customers: list the company name of all customers who live in the cities London, Brücke, and Cowes.

SELECT CompanyName, City
FROM customers
WHERE City IN ('London', 'Bräcke', 'Cowes')

-- 7. Show the countries along with their number of customers.

SELECT 
	Country, 
	COUNT(CustomerID) AS [Many Customers]
FROM Customers
GROUP BY Country
ORDER BY 2 DESC

-- 8. Show the customers whose region field is blank (NULL).

SELECT * FROM Customers
WHERE Region IS NULL
