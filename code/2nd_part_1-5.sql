/*SQL SERVER EXERCISE DEVELOPMENT*/
------------------------------------

USE Northwind;

--1. Show the records from the Employees table.

-- Solved:

SELECT * FROM Employees

--2. Show the first and last names of the employees.

-- Solved:

SELECT 
	FirstName, 
	LastName ,
	CONCAT(FirstName,  ' ', LastName) AS [Agent]
FROM Employees

--3. Show the names of the cities that appear in the Employees table.
--(Do not show the same city name more than once).

-- Solved

SELECT 
	DISTINCT City 	
FROM Employees

--4. Show the product names and unit prices from the Products table.

SELECT 
	ProductName, UnitPrice	
FROM Products

-- 5. Show the employees from the Employees table who live in the USA.

SELECT 
	*
FROM Employees
WHERE Country = 'USA'

END
