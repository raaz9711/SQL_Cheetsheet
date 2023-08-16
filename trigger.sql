--- Trigger

-- pro for Trigger

    -- Data Cleaning e.g Insert and update
    -- Audit logging
    -- Storing Bussiness rules in database instead of application
    -- Automating database operations

-- Custom Trigger
    CREATE TRIGGER TRG_Notify  
    ON dbo.Country  
    AFTER INSERT, UPDATE   
    AS RAISERROR ('Notify Customer Relations', 16, 10);  
    GO

-- INSTEAD OF TRIGGER{this does not delete from main table but delete from audit table}
    Create TRIGGER TRG_Notify_ON_DELETE_WITH_INSTEAD  
    ON dbo.Country  
    INSTEAD OF DELETE  
    AS
    MERGE dbo.CountryAudit as CAudit
    USING(Select * from DELETED) AS C
    ON CAudit.Id = C.id
    When MATCHED THEN DELETE;

    print'fired delete on Country table'

    GO


-- Drop a TRigger
    DROP TRIGGER TRG_Notify_ON_DELETE    

-- Enable Disable trigger on table
    alter table Country
    Disable TRIGGER TRG_Notify

-- SQL Server Syntax  
-- Trigger on an INSERT, UPDATE, or DELETE statement to a table or view (DML Trigger)  


  
CREATE [ OR ALTER ] TRIGGER [ schema_name . ]trigger_name   
ON { table | view }   
[ WITH <dml_trigger_option> [ ,...n ] ]  
{ FOR | AFTER | INSTEAD OF }   
{ [ INSERT ] [ , ] [ UPDATE ] [ , ] [ DELETE ] }   
[ WITH APPEND ]  
[ NOT FOR REPLICATION ]   
AS { sql_statement  [ ; ] [ ,...n ] | EXTERNAL NAME <method specifier [ ; ] > }  
  
<dml_trigger_option> ::=  
    [ ENCRYPTION ]  
    [ EXECUTE AS Clause ]  
  
<method_specifier> ::=  
    assembly_name.class_name.method_name