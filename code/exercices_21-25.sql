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
