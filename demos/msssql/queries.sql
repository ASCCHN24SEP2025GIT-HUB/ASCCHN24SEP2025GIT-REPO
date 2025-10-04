-- ============================================
-- 1. DATA DEFINITION LANGUAGE (DDL)
-- ============================================

CREATE DATABASE SQLWORKS2;
USE SQLWORKS2;
-- Creating Tables
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    HireDate DATE,
    Salary DECIMAL(10, 2),
    DepartmentID INT
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50),
    "Location" VARCHAR(100)
);

-- Altering Table Structure
-- Add a new column
ALTER TABLE Employees ADD PhoneNumber VARCHAR(15);

-- Modify column data type
ALTER TABLE Employees ALTER COLUMN Email VARCHAR(150);

-- Drop a column
ALTER TABLE Employees DROP COLUMN PhoneNumber;

-- Removing a Table
DROP TABLE IF EXISTS EMPLOYEES, DEPARTMENTS;

-- ============================================
-- 2. DATA MANIPULATION LANGUAGE (DML)
-- ============================================

-- Insert sample departments
INSERT INTO Departments (DepartmentID, DepartmentName, Location)
VALUES (1, 'IT', 'New York'),
       (2, 'HR', 'Chicago'),
       (3, 'Sales', 'Los Angeles');

-- Inserting Rows (Multiple Methods)
-- Single row insert
INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, HireDate, Salary, DepartmentID)
VALUES (1, 'John', 'Doe', 'john.doe@company.com', '2020-01-15', 75000.00, 1);

-- Multiple rows insert
INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, HireDate, Salary, DepartmentID)
VALUES 
    (2, 'Jane', 'Smith', 'jane.smith@company.com', '2019-03-20', 82000.00, 2),
    (3, 'Mike', 'Johnson', 'mike.j@company.com', '2021-06-10', 68000.00, 3),
    (4, 'Sarah', 'Williams', 'sarah.w@company.com', '2018-11-05', 95000.00, 1),
    (5, 'Tom', 'Brown', 'tom.brown@company.com', '2022-02-14', 71000.00, 2);
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;
-- Updating Rows
-- Update single row
UPDATE Employees 
SET Salary = 78000.00 
WHERE EmployeeID = 1;

-- Update multiple rows
UPDATE Employees 
SET Salary = Salary * 1.10 
WHERE DepartmentID = 1;

-- Deleting Rows
-- Delete specific row
DELETE FROM Employees WHERE EmployeeID = 5;

-- Delete with condition
DELETE FROM Employees WHERE Salary < 70000;
GO;

SET IMPLICIT_TRANSACTIONS ON;
-- Transaction Processing
BEGIN TRANSACTION;
    INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, HireDate, Salary, DepartmentID)
    VALUES (8, 'TRAN', 'Davis', 'anna.d@company.com', '2023-01-10', 72000.00, 3);
    UPDATE Employees SET Salary = Salary * 10000000000000000000 WHERE DepartmentID = 2;
ROLLBACK;


BEGIN TRANSACTION;
    INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, HireDate, Salary, DepartmentID)
    VALUES (8, 'TRAN', 'Davis', 'anna.d@company.com', '2023-01-10', 72000.00, 3);
    UPDATE Employees SET Salary = Salary * 10 WHERE DepartmentID = 2;
COMMIT;
GO; -- Save changes

SELECT * FROM EMPLOYEES;
-- Rollback example
BEGIN TRANSACTION;
    DELETE FROM Employees WHERE DepartmentID = 3;
    DELETE FROM Employees WHERE DepartmentID = 1;
ROLLBACK; -- Undo changes

-- ============================================
-- 3. DATA RETRIEVAL
-- ============================================

-- Basic SELECT statement
SELECT * FROM Employees;

-- Select specific columns
SELECT FirstName, LastName, Salary FROM Employees;

-- SELECT with DISTINCT
SELECT DISTINCT DepartmentID FROM Employees;

-- Queries Based on Conditions (WHERE clause)
SELECT * FROM Employees WHERE Salary > 75000;

SELECT FirstName, LastName FROM Employees WHERE DepartmentID = 1;

SELECT * FROM Employees WHERE HireDate >= '2020-01-01';

-- Queries Using Operators
-- Comparison operators
SELECT * FROM Employees WHERE Salary BETWEEN 70000 AND 85000;

-- IN operator
SELECT * FROM Employees WHERE DepartmentID IN (1, 2);

-- LIKE operator (pattern matching)
SELECT * FROM Employees WHERE FirstName LIKE 'J%';

SELECT * FROM Employees WHERE Email LIKE '%@company.com';

-- AND, OR, NOT operators
SELECT * FROM Employees 
WHERE Salary > 70000 AND DepartmentID = 1;

SELECT * FROM Employees 
WHERE DepartmentID = 1 OR DepartmentID = 3;

SELECT * FROM Employees 
WHERE NOT DepartmentID = 2;

-- IS NULL / IS NOT NULL
SELECT * FROM Employees WHERE Email IS NOT NULL;

-- Setting Query Results
-- ORDER BY
SELECT * FROM Employees ORDER BY Salary DESC;

SELECT FirstName, LastName, HireDate 
FROM Employees 
ORDER BY HireDate ASC;

-- TOP / LIMIT (SQL Server uses TOP)
SELECT TOP 3 * FROM Employees ORDER BY Salary DESC;

-- OFFSET FETCH (pagination)
SELECT * FROM Employees 
ORDER BY EmployeeID 
OFFSET 2 ROWS FETCH NEXT 3 ROWS ONLY;
-- The offset is used to skip rows. Here it skips the first 2 rows and fetches the next 3 rows.

-- ============================================
-- 4. SQL FUNCTIONS
-- ============================================

-- SINGLE ROW FUNCTIONS

-- Character Functions
-- UPPER, LOWER
SELECT FirstName, UPPER(FirstName) AS UpperName, LOWER(LastName) AS LowerName 
FROM Employees;

-- SUBSTRING
SELECT FirstName, SUBSTRING(FirstName, 1, 3) AS ShortName 
FROM Employees;

-- LEN / LENGTH
SELECT FirstName, LEN(FirstName) AS NameLength 
FROM Employees;

-- CONCAT
SELECT CONCAT(FirstName, '                       ', LastName) AS FullName 
FROM Employees;

-- LTRIM, RTRIM, TRIM
SELECT RTRIM('                       Hello World  ') AS TrimmedText;

-- REPLACE
SELECT Email, REPLACE(Email, 'company.com', 'newdomain.com') AS NewEmail 
FROM Employees;

-- Number Functions
-- ROUND
SELECT Salary, ROUND(Salary, 0) AS RoundedSalary 
FROM Employees;

SELECT ROUND(1234.567, 0);
SELECT ROUND(1234.467, 0);
SELECT ROUND(1234.567, -1);
SELECT ROUND(1234.567, 1);
SELECT ROUND(1256.567, -2) AS 'ROUNDED VALUE';  

SELECT ROUND(-1234.567, 0);
SELECT ROUND(-1234.467, 0);
SELECT ROUND(-1234.567, -1);
SELECT ROUND(-1254.567, -2);
SELECT ROUND(-1256.567, -3) AS 'ROUNDED VALUE';  
SELECT ROUND(-1256.567, -2) AS 'ROUNDED VALUE';

-- 5 EXAMPLES FOR CEILING AND FLOOR
SELECT FLOOR(1.2);  
SELECT CEILING (1.6);  
SELECT FLOOR(-1.2);  
SELECT CEILING (-1.6);  

SELECT CEILING (1.2);  
SELECT FLOOR(-1.8);                    

-- CEILING, FLOOR
SELECT Salary, CEILING(Salary/1000) * 1000 AS CeilingSalary,
       FLOOR(Salary/1000) * 1000 AS FloorSalary
FROM Employees;

-- ABS (absolute value)
-- Absolute value is the non-negative value of a number without regard to its sign.
SELECT ABS(-150) AS AbsoluteValue;

-- POWER, SQRT
SELECT POWER(2, 3) AS PowerResult, SQRT(16) AS SquareRoot;

-- Date Functions
-- GETDATE (current date/time)
SELECT GETDATE() AS CurrentDateTime;


-- DATEADD
SELECT HireDate, DATEADD(YEAR, 1, HireDate) AS OneYearLater 
FROM Employees;

-- DATEDIFF
-- The parameters to DATEDIFF are (datepart, startdate, enddate)
SELECT FirstName, HireDate, 
       DATEDIFF(DAY, HireDate, GETDATE()) AS DaysEmployed 
FROM Employees;

-- YEAR, MONTH, DAY
SELECT HireDate, YEAR(HireDate) AS HireYear, 
       MONTH(HireDate) AS HireMonth, 
       DAY(HireDate) AS HireDay 
FROM Employees;

-- FORMAT (date formatting)
SELECT HireDate, FORMAT(HireDate, 'MM-dd/yyyy') AS FormattedDate 
FROM Employees;
-- Tabulation of common date formats
-- 'd' - Short date pattern (e.g., 6/15/2009
SELECT FORMAT(HireDate, 'd') AS ShortDate FROM Employees;
-- 'D' - Long date pattern (e.g., Monday, June 15, 2009)
SELECT FORMAT(HireDate, 'D') AS LongDate FROM Employees;
-- 't' - Short time pattern (e.g., 6:30 PM)
SELECT FORMAT(HireDate, 't') AS ShortTime FROM Employees;
-- 'T' - Long time pattern (e.g., 6:30:00 PM)
SELECT FORMAT(HireDate, 'T') AS LongTime FROM Employees;
-- 'f' - Full date/time pattern (short time) (e.g., Monday, June 15, 2009 6:30 PM)
SELECT FORMAT(HireDate, 'f') AS FullDateShortTime FROM Employees;
-- 'F' - Full date/time pattern (long time) (e.g., Monday,  June 15, 2009 6:30:00 PM)
SELECT FORMAT(HireDate, 'F') AS FullDateLongTime FROM Employees;
-- Conversion Functions

-- CAST
SELECT Salary, CAST(Salary AS INT) AS IntSalary, CAST(Salary AS VARCHAR(20)) AS VarCharSalary
FROM Employees;
-- The CAST function is used to convert an expression of one data type to another. In this example, it converts the Salary from DECIMAL to INT, effectively removing the decimal portion.

-- CONVERT : This function is similar to CAST but provides more formatting options, especially for date/time types.
-- The syntax is CONVERT(data_type [(length)], expression [, style])
SELECT HireDate, CONVERT(VARCHAR, HireDate) AS Date 
FROM Employees;
-- 101 = mm/dd/yyyy
-- 102 = yyyy.mm.dd
-- 103 = dd/mm/yyyy
-- 104 = dd.mm.yyyy
SELECT HireDate, CONVERT(VARCHAR(50), HireDate, 101) AS USDate 
FROM Employees;

-- TRY_CAST (returns NULL if conversion fails)
SELECT TRY_CAST('123' AS INT) AS ValidNumber,
       TRY_CAST('ABC' AS INT) AS InvalidNumber;

-- GROUP FUNCTIONS (Aggregate Functions)
-- COUNT
SELECT COUNT(*) AS TotalEmployees FROM Employees;

SELECT DepartmentID, COUNT(*) AS EmployeeCount 
FROM Employees 
GROUP BY DepartmentID;

-- SUM
SELECT SUM(Salary) AS TotalSalary FROM Employees;

-- AVG
SELECT AVG(Salary) AS AverageSalary FROM Employees;

SELECT DepartmentID, AVG(Salary) AS AvgSalary 
FROM Employees 
GROUP BY DepartmentID;

-- MAX, MIN
SELECT MAX(Salary) AS HighestSalary, MIN(Salary) AS LowestSalary 
FROM Employees;

-- GROUP BY with HAVING
SELECT DepartmentID, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY DepartmentID
HAVING AVG(Salary) > 75000;