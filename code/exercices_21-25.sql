/*SQL Server Exercise Development*/
------------------------------------

USE Northwind;

--21. From the report obtained in response 20, show the first 5 salespeople
--for each year.

-- Solved

SELECT
	TOP 5
	T1.FirstName + ' ' + T1.LastName AS [Sales Man],
	DATEPART(YEAR, T2.OrderDate) AS [Year],
	COUNT (T2.OrderID) AS [Nro. Orders],
	SUM(T3.Quantity * T3.UnitPrice) AS [Total]
FROM Employees T1
INNER JOIN Orders T2 ON T2.EmployeeID = T1.EmployeeID
INNER JOIN [Order Details] T3 ON T3.OrderID = T2.OrderID
GROUP BY T1.FirstName, T1.LastName, T2.OrderDate
ORDER BY 4 DESC

-- Solved as ranking using OVER(PARTITION)

SELECT
	RANK() OVER(PARTITION BY DATEPART(YEAR, T2.OrderDate) ORDER BY SUM(T3.Quantity * T3.UnitPrice) DESC) AS Ranking,
	T1.FirstName + ' ' + T1.LastName AS [Sales Man],
	DATEPART(YEAR, T2.OrderDate) AS [Year],
	COUNT (T2.OrderID) AS [Nro. Orders],
	SUM(T3.Quantity * T3.UnitPrice) AS [Total]
FROM Employees T1
INNER JOIN Orders T2 ON T2.EmployeeID = T1.EmployeeID
INNER JOIN [Order Details] T3 ON T3.OrderID = T2.OrderID
GROUP BY T1.FirstName, T1.LastName, T2.OrderDate

-- Solved suing subquery

SELECT * FROM
(
	SELECT 
		RANK() OVER(PARTITION BY DATEPART(YEAR, T2.OrderDate) ORDER BY SUM(T3.Quantity * T3.UnitPrice) DESC) AS Ranking,
		T1.FirstName + ' ' + T1.LastName AS [Sales Man],
		DATEPART(YEAR, T2.OrderDate) AS [Year],
		COUNT (T2.OrderID) AS [Nro. Orders],
		SUM(T3.Quantity * T3.UnitPrice) AS [Total]
FROM Employees T1
INNER JOIN Orders T2 ON T2.EmployeeID = T1.EmployeeID
INNER JOIN [Order Details] T3 ON T3.OrderID = T2.OrderID
GROUP BY T1.FirstName, T1.LastName, T2.OrderDate
) AS T
WHERE Ranking < 6

-- 22. Show the total sales grouped by product category.

-- Step 1: get data
SELECT * FROM Categories
SELECT * FROM "Order Details"
SELECT * FROM Products

-- Solved

SELECT
	T3.CategoryName,
	SUM(T1.Quantity * T1.UnitPrice) AS [Total sale]
FROM [Order Details] T1
INNER JOIN Products T2 ON T2.ProductID = T1.ProductID
INNER JOIN Categories T3 ON T3.CategoryID = T2.CategoryID
GROUP BY T3.CategoryName
ORDER BY 2 DESC

--23. From the report obtained in response 21, show the evolution of sales by
--product category grouped for each year of operations.

-- Step 1: 

SELECT
	T3.CategoryName,
	DATEPART(YEAR, T4.OrderDate) AS [Year]
FROM [Order Details] T1
INNER JOIN Products T2 ON T2.ProductID = T1.ProductID
INNER JOIN Categories T3 ON T3.CategoryID = T2.CategoryID
GROUP BY T3.CategoryName
ORDER BY 2 DESC

-- Solved:

SELECT
	T3.CategoryName,
	DATEPART(YEAR, T4.OrderDate) AS [Year],
	SUM(T1.Quantity * T1.UnitPrice) AS [Ammount]
FROM [Order Details] T1
INNER JOIN Products T2 ON T2.ProductID = T1.ProductID
INNER JOIN Categories T3 ON T3.CategoryID = T2.CategoryID
INNER JOIN Orders T4 ON T4.OrderID = T1.OrderID
GROUP BY T3.CategoryName, T4.OrderDate
ORDER BY 1, 2

--24. Show the sales report by region.

-- Solved:

SELECT T1.ShipRegion, SUM(t2.Quantity * T2.UnitPrice) AS [Ammount]
FROM Orders T1
INNER JOIN [Order Details] T2 ON T2.OrderID = T1.OrderID
GROUP BY T1.ShipRegion

--25. From the report obtained in response 24, show the evolution of sales by
--region grouped for each year of operations.

-- Solved

SELECT 
	T1.ShipRegion, 
	SUM(T2.Quantity * T2.UnitPrice) AS [Ammount],
	YEAR(T1.OrderDate) AS [Year]
FROM Orders T1
INNER JOIN [Order Details] T2 ON T2.OrderID = T1.OrderID
GROUP BY T1.ShipRegion, YEAR(T1.OrderDate)

-- End
