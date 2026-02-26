/*SQL SERVER EXERCISE DEVELOPMENT*/
------------------------------------

--10. Show the 5 products with the lowest unit price.
-- solved using "TOP"
SELECT TOP 5
	ProductID,
	ProductName,
	UnitPrice
FROM Products
ORDER BY 3 ASC

-- solved using "RANK"
SELECT * FROM
(
	SELECT
		RANK() OVER( ORDER BY P.UnitPrice ASC) AS Ranking,
		P.ProductID, P.ProductName, P.UnitPrice
	FROM Products P
) AS RankingTable
WHERE RankingTable.Ranking <= 5

--11. Show the count of employees grouped by job title.
SELECT
	Title,
	COUNT(1) AS [Many Employees]
FROM Employees
GROUP BY Title

--12. Show the customers, number of orders, and the total purchases made.
SELECT
	C.CustomerID,
	C.CompanyName,
	COUNT(O.OrderID) AS [Many Orders],
	SUM(OD.Quantity * OD.UnitPrice) AS [Total]
FROM Customers C
INNER JOIN Orders O ON O.CustomerID = C.CustomerID
INNER JOIN [Order Details] OD ON OD.OrderID = O.OrderID
GROUP BY C.CustomerID, C.CompanyName

-- solved with 13% discount
SELECT
    C.CustomerID,
    C.CompanyName,
    COUNT(O.OrderID) AS [Many Orders],
    SUM(OD.Quantity * OD.UnitPrice) AS [Total],
    SUM(OD.Quantity * OD.UnitPrice) * 0.87 AS [TotalWithDiscount]
FROM Customers C
INNER JOIN Orders O ON O.CustomerID = C.CustomerID
INNER JOIN [Order Details] OD ON OD.OrderID = O.OrderID
GROUP BY C.CustomerID, C.CompanyName;

--13. Regarding question 12, show the 5 customers who purchased the most.
-- solved using "TOP"
SELECT TOP 5 * FROM
(
    SELECT
    C.CustomerID,
    C.CompanyName,
    COUNT(O.OrderID) AS [Many Orders],
    SUM(OD.Quantity * OD.UnitPrice) AS [Total]
FROM Customers C
INNER JOIN Orders O ON O.CustomerID = C.CustomerID
INNER JOIN [Order Details] OD ON OD.OrderID = O.OrderID
GROUP BY C.CustomerID, C.CompanyName
) AS T
ORDER BY 4 DESC

-- more examples of SubQueries
SELECT 
    o1.OrderID, 
    o1.CustomerID, 
    o1.OrderDate
FROM Orders AS o1
WHERE o1.OrderID = (
    SELECT MAX(o2.OrderID)
    FROM Orders AS o2
    WHERE o2.CustomerID = o1.CustomerID
)
ORDER BY o1.CustomerID, o1.OrderDate;

-- SubQueries examples
SELECT 
    c.CustomerID, 
    c.CompanyName, 
    c.ContactName, 
    c.ContactTitle
FROM Customers AS c
WHERE (
    SELECT COUNT(*) 
    FROM Orders AS o
    WHERE o.CustomerID = c.CustomerID
) > 0;

-- SubQueries examples
SELECT 
    c.CustomerID, 
    c.CompanyName, 
    c.ContactName, 
    c.ContactTitle
FROM Customers AS c
WHERE EXISTS (
    SELECT * 
    FROM Orders AS o
    WHERE o.CustomerID = c.CustomerID
);


-- End
