/*SQL Server Exercise Development*/
------------------------------------

USE Northwind;

-- 6. Retrieve the employees who have a null value in the Region column.

SELECT *
FROM Employees
WHERE Region IS NULL;

-- 7. Find all the last names (LastName) in the Employees table that begin with the letter D.

SELECT *
FROM Employees
WHERE LastName LIKE 'D%';

-- 8. To retrieve the last names of Employees whose first letter is D and that contain T.

SELECT *
FROM Employees
WHERE LastName LIKE 'D%t%';

-- 9. List the information of the orders that have not been shipped (ShippedDate).

SELECT *
FROM Orders
WHERE ShippedDate IS NULL;

-- 10. List all the fields from the Suppliers table where the Region column is NULL.

SELECT *
FROM Suppliers
WHERE Region IS NULL;

-- END
