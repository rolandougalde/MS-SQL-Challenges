/*SQL SERVER EXERCISES*/
------------------------------------

--14. Show the suppliers and the number of products they have sold.
SELECT
	S.SupplierID,
	S.Companyname,
	COUNT(P.ProductID) AS [Product Quantity]
FROM Suppliers S
INNER JOIN Products P ON P.SupplierID = S.SupplierID
GROUP BY S.SupplierID, S.CompanyName

--15. Show the number of orders and their valuation (price times quantity),
--grouped by year. Order by year.
SELECT
	YEAR(O.OrderDate) AS [Year],
	COUNT(O.OrderID) AS [Order Quantity],
	SUM(OD.Quantity * OD.UnitPrice) AS [Total]
FROM Orders O
INNER JOIN [Order Details] OD ON OD.OrderID = O.OrderID
GROUP BY YEAR(O.OrderDate)
ORDER BY 1

--16. Show the number of unique customers who bought each product category.
--The example uses a Pivot Table added to the model.

--17. Show the total number of orders and the total amount for each of them.

-- END
