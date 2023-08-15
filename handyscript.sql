-- Using Having 

SELECT   id, count(oID) FROM     MyTable 
                GROUP BY oID 
                HAVING   count(oID) = 1

-- Get Sps

SELECT * 
        FROM DatabaseName.INFORMATION_SCHEMA.ROUTINES
       WHERE ROUTINE_TYPE = 'PROCEDURE'

-- Get Table Name

SELECT TABLE_NAME,CONCAT(TABLE_SCHEMA, '.', TABLE_NAME)
              FROM INFORMATION_SCHEMA.TABLES
                WHERE 
                TABLE_TYPE = 'BASE TABLE' AND
                TABLE_CATALOG='DbName' 
                and TABLE_SCHEMA = 'SchemaName' and TABLE_NAME like '%TableName%'

-- Create BackUp Sql

SELECT TABLE_NAME,CONCAT(TABLE_SCHEMA, '.', TABLE_NAME),
'Select * into '+CONCAT(TABLE_SCHEMA, '.', TABLE_NAME)+'_bak_'+cast(FORMAT(getdate(), 'ddMMyy') as  nvarchar)+'_rj from '+CONCAT(TABLE_SCHEMA, '.', TABLE_NAME)
        FROM INFORMATION_SCHEMA.TABLES
          WHERE 
          TABLE_TYPE = 'BASE TABLE' AND
          TABLE_CATALOG='DatabaseName' 
          and TABLE_SCHEMA = 'Schema name' 
		  and TABLE_NAME like '%TableNAme%'

-- get Table Name by Column Name

select * from INFORMATION_SCHEMA.COLUMNS where COLUMN_NAME like '%ColumnName%'

--update by Join

UPDATE A  
              SET foo = B.bar
              FROM TableA A JOIN TableB B
              ON A.col1 = B.colx
              WHERE ...

-- get stored Routine 
select * from INFORMATION_SCHEMA.ROUTINES
where ROUTINE_TYPE= 'Procedure'

--

IF OBJECT_ID ( 'dbo.getsiteuserbyname', 'P' ) IS NOT NULL   
    print 'test'
GO  

--
SELECT name AS procedure_name
    , SCHEMA_NAME(schema_id) AS schema_name
    , type_desc
    , create_date
    , modify_date
FROM sys.procedures;

