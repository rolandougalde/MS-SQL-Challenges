/*SQL Server Exercise Development*/
------------------------------------

USE Northwind;

-- 1. Retrieve all columns from the Region table.

SELECT * FROM "Region";

-- 2. Retrieve the FirstName and LastName from the Employees table.

SELECT Employees.FirstName,Employees.LastName 
FROM Employees;

-- 3. Obtener las columnas FirstName y LastName de la tabla Employees. Ordenados por la columna LastName.

SELECT FirstName, LastName
FROM Employees
ORDER BY LastName;

-- 4. Retrieve the FirstName and LastName columns from the Employees table, ordered by the LastName column.

-- EmployeeID
-- LastName y FirstName (Concatenadas)
-- Country, Region y City (Concatenada)

SELECT EmployeeID, 
LastName + ' ' + FirstName AS [Employee Name],
Country + ' ' + Region + ' ' + City AS [Country-Region-city]
FROM Employees;

-- 5. Retrieve the rows from the Orders table ordered by the Freight column in descending order;
-- the columns to be displayed are: OrderID, OrderDate, ShippedDate, CustomerID, and Freight

SELECT OrderID, OrderDate, ShippedDate, CustomerID, Freight
FROM Orders
ORDER BY Freight DESC;

-- END
