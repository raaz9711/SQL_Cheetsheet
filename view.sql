-- View

-- A view is basically stored select Query.
-- Pro of View
-- -- Simplify/replace complex queries
-- -- Make data user for end-users
-- -- Avoid breakage with schema changes
-- -- Restrict the data access

--Create a View

USE AdventureWorks2022;
GO

CREATE VIEW HumanResources.EmployeeHireDate
AS
SELECT p.FirstName,
    p.LastName,
    e.HireDate
FROM HumanResources.Employee AS e
INNER JOIN Person.Person AS p
    ON e.BusinessEntityID = p.BusinessEntityID;
GO

-- Query the view
SELECT FirstName,
    LastName,
    HireDate
FROM HumanResources.EmployeeHireDate
ORDER BY LastName;
GO


-- Modify View

USE AdventureWorks2022;
GO

-- Create a view

CREATE VIEW HumanResources.EmployeeHireDate
AS
SELECT p.FirstName,
     p.LastName,
     e.HireDate
FROM HumanResources.Employee AS e
INNER JOIN Person.Person AS p
     ON e.BusinessEntityID = p.BusinessEntityID;

-- Modify the view by adding a WHERE clause to limit the rows returned
ALTER VIEW HumanResources.EmployeeHireDate
AS
SELECT p.FirstName,
     p.LastName,
     e.HireDate
FROM HumanResources.Employee AS e
INNER JOIN Person.Person AS p
     ON e.BusinessEntityID = p.BusinessEntityID
WHERE HireDate < CONVERT(DATETIME, '20020101', 101);
GO

-- Update View Data

USE AdventureWorks2022;   
GO  
UPDATE HumanResources.vEmployeeDepartmentHistory  
SET StartDate = '20110203', EndDate = GETDATE()   
WHERE LastName = N'Smith' AND FirstName = 'Samantha';   
GO

-- delete View

USE AdventureWorks2022;
GO

IF OBJECT_ID('HumanResources.EmployeeHireDate', 'V') IS NOT NULL
    DROP VIEW HumanResources.EmployeeHireDate;
GO

--or 

USE AdventureWorks2022;
GO

DROP VIEW IF EXISTS HumanResources.EmployeeHireDate;
GO



--Materialized View


--Recursive View same recursive cte

WITH cte_numbers(n, weekday) 
AS (
    SELECT 
        0, 
        DATENAME(DW, 0)
    UNION ALL
    SELECT    
        n + 1, 
        DATENAME(DW, n + 1)
    FROM    
        cte_numbers
    WHERE n < 6
)
SELECT 
    weekday
FROM 
    cte_numbers;
