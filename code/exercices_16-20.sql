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



-- 18. Show the employees who have placed the most orders for the countries.
-- Germany and Brazil.



-- 19. Obtain a report that shows the number of orders for each Sales Representative.



-- 20. Obtain a report by Salesperson that shows the number of orders and the 
-- sales amount for each year of operations.

