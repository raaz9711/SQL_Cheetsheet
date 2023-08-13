-- -- Partitioning is the database process where very large tables are divided 
-- -- into multiple smaller parts. By splitting a large table into smaller, individual tables, 
-- -- queries that access only a fraction of the data can run faster because there is less data to scan. 
-- -- The main of goal of partitioning is to aid in maintenance of large tables and to reduce the
-- --  overall response time to read and load data for particular SQL operations.


-- Vertical Partition

-- Vertical table partitioning is mostly used to increase SQL Server performance especially
--  in cases where a query retrieves all columns from a table that contains a number of very wide
--   text or BLOB columns. In this case to reduce access times the BLOB columns can be split to 
--   its own table. Another example is to restrict access to sensitive data e.g. passwords, salary 
--   information etc. 
-- Vertical partitioning splits a table into two or more tables containing different columns:


-- Horizontal Partition

-- it is about partitin data by range like year/month or other ways in the other database like list,hash

--Inheritance table


-- create table People(PersonID int primary key, Name varchar ... etc ...)

-- create table Students(PersonID int primary key references People(PersonID), ...)

-- create table Teachers(PersonID int primary key references People(PersonID), ...)

-- create table Parents(PersonID int primary key references People(PersonID), ...)

-- Horizontal partitioning divides a table into multiple tables that contain the same number of columns,
--  but fewer rows. For example, if a table contains a large number of rows that represent monthly reports 
--  it could be partitioned horizontally into tables by years, with each table representing all monthly 
--  reports for a specific year. This way queries requiring data for a specific year will only reference 
--  the appropriate table.
--  Tables should be partitioned in a way that queries reference as few tables as possible.



