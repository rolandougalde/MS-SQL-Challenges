/*SQL SERVER EXERCISE DEVELOPMENT*/
------------------------------------

--18. Show the average sales per employee.
SELECT
	E.EmployeeID,
	E.FirstName + '  ' + E.LastName AS [Employee],
	AVG(OD.UnitPrice * OD.Quantity) AS [Prom. Ventas]
FROM Employees E
INNER JOIN Orders O ON O.EmployeeID = E.EmployeeID
INNER JOIN [Order Details] OD ON OD.OrderID = O.OrderID
GROUP BY E.EmployeeID, E.FirstName, E.LastName
ORDER BY 1

--19. Show the customers and their sales that exceed 5000.
--(Show Example with Sub-Queries or CTE)
SELECT
	C.CustomerID,
	C.CompanyName,
    SUM(OD.UnitPrice * OD.Quantity) AS [Total]	
FROM Customers C
INNER JOIN Orders O ON O.CustomerID = C.CustomerID
INNER JOIN [Order Details] OD ON OD.OrderID = O.OrderID
GROUP BY C.CustomerID, C.CompanyName
HAVING SUM(OD.Unitprice * OD.Quantity) > 5000
ORDER BY 3 DESC

-- Solved with CTE
WITH Import AS
(
SELECT
	C.CustomerID,
	C.CompanyName,
    SUM(OD.UnitPrice * OD.Quantity) AS [Total]	
FROM Customers C
INNER JOIN Orders O ON O.CustomerID = C.CustomerID
INNER JOIN [Order Details] OD ON OD.OrderID = O.OrderID
GROUP BY C.CustomerID, C.CompanyName
)
SELECT * FROM Import
WHERE Total > 5000
ORDER BY 3 DESC

--20. Show the purchases of customers in March of 1996, 1997, and 1998.

END
