/*SQL SERVER EXERCISE DEVELOPMENT*/
------------------------------------

--10. Show the 5 products with the lowest unit price.
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



--12. Show the customers, number of orders, and the total purchases made.



--13. Regarding question 12, show the 5 customers who purchased the most.
