-- Constraint 

SELECT CONSTRAINT_NAME,
     TABLE_SCHEMA ,
     TABLE_NAME,
     CONSTRAINT_TYPE
     FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
   WHERE TABLE_NAME='address'

-- add / drop Constraint
alter table TableName
drop constraint CONSTRAINT_NAME   

--check Constraint

alter table Country
add constraint  CHK_CON check(LEN(UniqueCode)  >= 2)