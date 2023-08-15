-- Create a Procedure
USE AdventureWorks2022;  
GO  
CREATE PROCEDURE HumanResources.uspGetEmployeesTest2   
    @LastName nvarchar(50),   
    @FirstName nvarchar(50)   
AS   

    SET NOCOUNT ON;  
    SELECT FirstName, LastName, Department  
    FROM HumanResources.vEmployeeDepartmentHistory  
    WHERE FirstName = @FirstName AND LastName = @LastName  
    AND EndDate IS NULL;  
GO

-- custom create procedure
-- Create a Procedure
USE ecommerce;  
GO  
Create/ALTER PROCEDURE dbo.getsiteuserbyname   
    @FirstName nvarchar(50)  = null 
AS   

    SET NOCOUNT ON;  
	
	select * from dbo.site_user
	where fname = @FirstName 
GO

--Delete Procedure

DROP PROCEDURE [<stored procedure name>];
GO