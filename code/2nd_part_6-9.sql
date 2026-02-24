/*DEVELOPMENT SQL SERVER EXCERCISES*/
------------------------------------

-- 6. Show the customers: list the company name of all customers who live in the cities London, Brücke, and Cowes.

SELECT CompanyName, City
FROM customers
WHERE City IN ('London', 'Bräcke', 'Cowes')
