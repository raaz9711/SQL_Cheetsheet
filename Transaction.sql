-- Transaction with Rollback

BEGIN TRANSACTION T1
        BEGIN TRY

        --add your code here
        
        Commit TRANSACTION T1
        END TRY
        BEGIN CATCH	
            ROLLBACK TRANSACTION T1
        END CATCH

--Save Point 

BEGIN TRANSACTION

INSERT INTO country(country_name,UniqueCode)
VALUES('INDIA','IND')

SAVE TRANSACTION FirstInsert

INSERT INTO country(country_name,UniqueCode)
VALUES('United State of AMERICA','USA')

Rollback Transaction FirstInsert

COMMIT

Select * from country

--this will add India only 


--Save Point with same name

BEGIN TRANSACTION

INSERT INTO country(country_name,UniqueCode)
VALUES('INDIA','IND')

SAVE TRANSACTION DataInsert

INSERT INTO country(country_name,UniqueCode)
VALUES('United State of AMERICA','USA')

SAVE TRANSACTION DataInsert

INSERT INTO country(country_name,UniqueCode)
VALUES('United Kingdom','UK')



Rollback Transaction DataInsert

COMMIT

--OUTPUT
-- id	country_name	UniqueCode
-- 1	INDIA	IND
-- 2	United State of AMERICA	USA
        
-- Multiple Transaction

TRUNCATE TABLE TestTable

-- nothing has happened yet, so value will be 0 
SELECT @@TRANCOUNT AS '1. - @@TRANCOUNT before starting the first transaction (its value is 0)'
 
BEGIN TRANSACTION -- trans 1
   SELECT @@TRANCOUNT AS '2. - @@TRANCOUNT after starting the first transaction (its value is incremented by 1)'
  
   INSERT INTO TestTable(ID, Value) 
   VALUES(1,'10')
   SAVE TRANSACTION FirstInsert
   
   BEGIN TRANSACTION -- trans 2
      SELECT @@TRANCOUNT AS '3. - @@TRANCOUNT after starting the second transaction (its value again is incremented by 1)'

      INSERT INTO TestTable(ID, Value) 
      VALUES(2,'20')
      
      ROLLBACK TRANSACTION FirstInsert
      SELECT @@TRANCOUNT AS '4. - @@TRANCOUNT after rolling back to the savepoint (its value is not changed)'
  
      BEGIN TRANSACTION -- trans 3 
         SELECT @@TRANCOUNT AS '5. - @@TRANCOUNT after starting the third transaction (its value is incremented by 1)'
 
         INSERT INTO TestTable(ID, Value) 
         VALUES(3,'30')
 
      COMMIT -- trans 3
      SELECT @@TRANCOUNT AS '6. - @@TRANCOUNT after committing the third transaction (its value is decremented by 1)'
  
      -- only id 1 and 3 remain
      SELECT * FROM TestTable
 
   COMMIT -- trans 2
   SELECT @@TRANCOUNT AS '7. - @@TRANCOUNT after committing second transaction (its value is set to 1)'

ROLLBACK -- trans 1
SELECT @@TRANCOUNT AS '8. - @@TRANCOUNT after rolling back first transaction (its value is set to 0)'

-- no data remains after rollback
SELECT * FROM TestTable