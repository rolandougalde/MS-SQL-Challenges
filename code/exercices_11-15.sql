/*SQL Server Exercise Development*/
------------------------------------

USE Northwind;

-- 11. Retrieve the employees ordered alphabetically by FirstName and LastName.

SELECT *
FROM Employees
ORDER BY FirstName, LastName;


-- 12.Retrieve the employees where the Title column has the value ‘Sales Representatives’ 
-- and the City field has the values Seattle or Redmond.

SELECT *
FROM Employees
WHERE Title = 'Sales Representative' 
	AND City = 'Seattle' OR City = 'Redmond';

-- 13. Retrieve the columns CompanyName, ContactTitle, City, and Country from 
-- the Customers who are in Mexico City or in any city in Spain except Madrid.

SELECT CompanyName, ContactTitle, City, Country
FROM Customers
WHERE Country = 'Mexico' OR Country = 'Spain' 
AND NOT City = 'Madrid'

-- Solved using clause IN.

SELECT CompanyName, ContactTitle, City, Country
FROM Customers
WHERE Country IN ('Mexico', 'Spain')
AND NOT City = 'Madrid'

-- 14. Retrieve the list of orders, and display a column where a 10% tax is 
-- calculated when the value of the Freight column is greater than or equal to 480.

SELECT OrderID, Freight,
0.10 * Freight AS [Impuesto 10%]
FROM Orders
WHERE Freight >= 480

-- 15. Retrieve the number of employees for each city.

SELECT City,
COUNT(EmployeeID) AS [Employees per City]
FROM Employees
GROUP BY City
ORDER BY 2

-- END
