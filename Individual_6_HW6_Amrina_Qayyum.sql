-- Individual_6_HW6_Amrina_Qayyum.sql
-- HW 6 Set Operators
-- Group: PPG_6
-- Name: Amrina Qayyum

USE Northwinds2024Student;
GO

-- Problem Proposition:
-- In the Northwinds2024Student database, the problem is to compare business data
-- across time periods and tables in order to identify common records, different
-- records, and combined results by using SQL set operators.

---------------------------------------------------------------------
-- Exercise 1
-- Explanation only
-- UNION ALL keeps duplicate rows.
-- UNION removes duplicate rows.
-- They are equivalent when no duplicate rows exist between the two result sets.
-- When both return the same result, UNION ALL is preferred because it is faster.
---------------------------------------------------------------------

---------------------------------------------------------------------
-- Exercise 2
-- Generate a virtual table of numbers 1 through 10
---------------------------------------------------------------------
SELECT 1 AS n
UNION ALL SELECT 2
UNION ALL SELECT 3
UNION ALL SELECT 4
UNION ALL SELECT 5
UNION ALL SELECT 6
UNION ALL SELECT 7
UNION ALL SELECT 8
UNION ALL SELECT 9
UNION ALL SELECT 10;
GO

---------------------------------------------------------------------
-- Exercise 3
-- Customer and employee pairs that had order activity
-- in January 2021 but not in February 2021
---------------------------------------------------------------------
SELECT CustomerID, EmployeeID
FROM Orders
WHERE OrderDate >= '2021-01-01'
  AND OrderDate <  '2021-02-01'

EXCEPT

SELECT CustomerID, EmployeeID
FROM Orders
WHERE OrderDate >= '2021-02-01'
  AND OrderDate <  '2021-03-01';
GO

---------------------------------------------------------------------
-- Exercise 4
-- Customer and employee pairs that had order activity
-- in both January 2021 and February 2021
---------------------------------------------------------------------
SELECT CustomerID, EmployeeID
FROM Orders
WHERE OrderDate >= '2021-01-01'
  AND OrderDate <  '2021-02-01'

INTERSECT

SELECT CustomerID, EmployeeID
FROM Orders
WHERE OrderDate >= '2021-02-01'
  AND OrderDate <  '2021-03-01';
GO

---------------------------------------------------------------------
-- Exercise 5
-- Customer and employee pairs that had order activity
-- in both January 2021 and February 2021, but not in 2020
---------------------------------------------------------------------
SELECT CustomerID, EmployeeID
FROM Orders
WHERE OrderDate >= '2021-01-01'
  AND OrderDate <  '2021-02-01'

INTERSECT

SELECT CustomerID, EmployeeID
FROM Orders
WHERE OrderDate >= '2021-02-01'
  AND OrderDate <  '2021-03-01'

EXCEPT

SELECT CustomerID, EmployeeID
FROM Orders
WHERE OrderDate >= '2020-01-01'
  AND OrderDate <  '2021-01-01';
GO

---------------------------------------------------------------------
-- Exercise 6
-- Show Employees rows first, then Suppliers rows
-- Sort each section by Country, Region, City
---------------------------------------------------------------------
SELECT City, Region, Country
FROM
(
    SELECT 
        1 AS sortgroup,
        EmployeeCity AS City,
        EmployeeRegion AS Region,
        EmployeeCountry AS Country
    FROM Employees

    UNION ALL

    SELECT 
        2 AS sortgroup,
        SupplierCity AS City,
        SupplierRegion AS Region,
        SupplierCountry AS Country
    FROM Suppliers
) AS X
ORDER BY sortgroup, Country, Region, City;
GO