/*SQL Server Exercise Development*/
------------------------------------

USE Northwind;

-- 16. Show the employees who have placed more than 15 orders.

SELECT EmployeeID, COUNT(OrderID)
FROM Orders
GROUP BY EMployeeID
HAVING COUNT(OrderID) > 15
ORDER BY 2 ASC

-- Solved using query union.

SELECT
	T2.EmployeeID,
	T1.FirstName + ' ' + T1.LastName AS [Employee],
	COUNT(T2.OrderID) AS [Many Orders]
FROM Employees T1
INNER JOIN Orders T2 ON T2.EmployeeID = T1.EmployeeID
GROUP BY T2.EmployeeID, T1.FirstName, T1.LastName
HAVING COUNT(T2.OrderID) > 15
ORDER BY COUNT(T2.OrderID) ASC

-- 17. Show the customers who have placed more than 20 orders.

SELECT CustomerID, COUNT(OrderID) AS 'Many Orders'
FROM Orders
GROUP BY CustomerID
HAVING COUNT(OrderID) > 20
ORDER BY COUNT(OrderID) ASC

-- 18. Show the employees who have placed the most orders for the countries.
-- Germany and Brazil.

SELECT EmployeeID, ShipCountry, COUNT(OrderID) AS 'Many Orders'
FROM Orders
WHERE ShipCountry IN ('germany', 'Brazil')
GROUP BY EmployeeID, ShipCountry

-- 19. Obtain a report that shows the number of orders for each Sales Representative.

SELECT 
	EmployeeID AS 'Vendor ID', 
	COUNT(OrderID) AS 'Many Orders'
FROM Orders
WHERE ShipCountry IN ('germany', 'Brazil')
GROUP BY EmployeeID
ORDER BY 2 DESC

-- 20. Obtain a report by Salesperson that shows the number of orders and the 
-- sales amount for each year of operations.

-- Step 1: get data

SELECT * FROM Employees
SELECT * FROM Orders
SELECT * FROM [Order Details]

-- Step 2: join tables

SELECT *
FROM Employees T1
INNER JOIN Orders T2 ON T2.EmployeeID = T1.EmployeeID
INNER JOIN [Order Details] T3 ON T3.OrderID = T2.OrderID

-- Step 3: filter by Year

SELECT 
	T1.FirstName + ' ' + T1.LastName AS [Sales Man],
	COUNT (T2.OrderID) AS [Nro. Orders],
	SUM(T3.Quantity * T3.UnitPrice) AS [Total]
FROM Employees T1
INNER JOIN Orders T2 ON T2.EmployeeID = T1.EmployeeID
INNER JOIN [Order Details] T3 ON T3.OrderID = T2.OrderID
GROUP BY T1.FirstName, T1.LastName

-- Step 4: solve query

SELECT 
	T1.FirstName + ' ' + T1.LastName AS [Sales Man],
	DATEPART(YEAR, T2.OrderDate) AS [Year],
	COUNT (T2.OrderID) AS [Nro. Orders],
	SUM(T3.Quantity * T3.UnitPrice) AS [Total]
FROM Employees T1
INNER JOIN Orders T2 ON T2.EmployeeID = T1.EmployeeID
INNER JOIN [Order Details] T3 ON T3.OrderID = T2.OrderID
GROUP BY T1.FirstName, T1.LastName, T2.OrderDate
