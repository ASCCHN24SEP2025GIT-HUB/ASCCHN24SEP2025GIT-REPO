-- ============================================
-- SQL MASTER
-- ============================================

-- ============================================
-- 1. DATA DEFINITION LANGUAGE (DDL)
-- ============================================
-- DDL stands for Data Definition Language. It includes commands like CREATE, ALTER, and DROP that define and modify database structures such as tables and schemas.
-- CREATE CAN BE USED TO CREATE DATABASES, TABLES, INDEXES, VIEWS, AND OTHER DATABASE OBJECTS.
-- THE OBJECTS IN MSSQL ARE DATABASES, TABLES, VIEWS, STORED PROCEDURES, FUNCTIONS, TRIGGERS, SCHEMAS, INDEXES, AND USERS.
-- ALTER CAN BE USED TO MODIFY THE STRUCTURE OF EXISTING DATABASE OBJECTS.

CREATE DATABASE SQLWORKS;
USE SQLWORKS;
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
    Location VARCHAR(100)
);

-- Altering Table Structure
-- Add a new column
ALTER TABLE Employees ADD PhoneNumber VARCHAR(15);

-- Modify column data type
ALTER TABLE Employees ALTER COLUMN Email VARCHAR(150);

-- Drop a column
ALTER TABLE Employees DROP COLUMN PhoneNumber;

-- Removing a Table
DROP TABLE IF EXISTS TempTable;

-- ============================================
-- 2. DATA MANIPULATION LANGUAGE (DML)
-- ============================================
-- DML stands for Data Manipulation Language. It includes commands like INSERT, UPDATE, DELETE, and SELECT that are used to manipulate data within database tables.
-- Truncate is also a DML command used to remove all rows from a table without logging individual row deletions.

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

SELECT * FROM Employees;
SELECT * FROM Departments;
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
-- Transaction Processing
-- Transactions are used to ensure data integrity and consistency. They allow you to group multiple DML operations into a single unit of work that can be committed or rolled back as a whole.
-- ACID PROPERTIES
-- Atomicity: Ensures that all operations within a transaction are completed successfully. If any operation fails, the entire transaction is rolled back.
-- Consistency: Ensures that a transaction brings the database from one valid state to another, maintaining all predefined rules and constraints.
-- Isolation: Ensures that concurrent transactions do not interfere with each other. Changes made by one transaction are not visible to other transactions until the first transaction is committed.
-- Durability: Ensures that once a transaction is committed, the changes are permanent and will survive system failures.
BEGIN TRANSACTION;
    INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, HireDate, Salary, DepartmentID)
    VALUES (6, 'Anna', 'Davis', 'anna.d@company.com', '2023-01-10', 72000.00, 3);
    UPDATE Employees SET Salary = Salary * 10000000000000000000000000000 WHERE DepartmentID = 2;
COMMIT;
GO; -- Save changes

-- Rollback example
BEGIN TRANSACTION;
    DELETE FROM Employees WHERE DepartmentID = 3;
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
SELECT CONCAT(FirstName, ' ', LastName) AS FullName 
FROM Employees;

-- LTRIM, RTRIM, TRIM
SELECT TRIM('  Hello World  ') AS TrimmedText;

-- REPLACE
SELECT Email, REPLACE(Email, 'company.com', 'newdomain.com') AS NewEmail 
FROM Employees;

-- Number Functions
-- ROUND
SELECT Salary, ROUND(Salary, 0) AS RoundedSalary 
FROM Employees;

-- CEILING, FLOOR
SELECT Salary, CEILING(Salary/1000) * 1000 AS CeilingSalary,
       FLOOR(Salary/1000) * 1000 AS FloorSalary
FROM Employees;

-- ABS (absolute value)
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
SELECT FirstName, HireDate, 
       DATEDIFF(DAY, HireDate, GETDATE()) AS DaysEmployed 
FROM Employees;

-- YEAR, MONTH, DAY
SELECT HireDate, YEAR(HireDate) AS HireYear, 
       MONTH(HireDate) AS HireMonth, 
       DAY(HireDate) AS HireDay 
FROM Employees;

-- FORMAT (date formatting)
SELECT HireDate, FORMAT(HireDate, 'MM/dd/yyyy') AS FormattedDate 
FROM Employees;

-- Conversion Functions
-- CAST
SELECT Salary, CAST(Salary AS INT) AS IntSalary 
FROM Employees;

-- CONVERT
SELECT HireDate, CONVERT(VARCHAR, HireDate, 101) AS USDate 
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

-- ============================================
-- 5. JOINS
-- ============================================

-- Equi Join (using WHERE - older syntax)
SELECT e.FirstName, e.LastName, d.DepartmentName
FROM Employees e, Departments d
WHERE e.DepartmentID = d.DepartmentID;

-- Inner Join (modern syntax)
SELECT e.FirstName, e.LastName, e.Salary, d.DepartmentName
FROM Employees e
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID;

-- Left Outer Join
SELECT e.FirstName, e.LastName, d.DepartmentName
FROM Employees e
LEFT OUTER JOIN Departments d ON e.DepartmentID = d.DepartmentID;

-- Right Outer Join
SELECT e.FirstName, e.LastName, d.DepartmentName
FROM Employees e
RIGHT OUTER JOIN Departments d ON e.DepartmentID = d.DepartmentID;

-- Full Outer Join
SELECT e.FirstName, e.LastName, d.DepartmentName
FROM Employees e
FULL OUTER JOIN Departments d ON e.DepartmentID = d.DepartmentID;

-- Nonequi Join (join on condition other than equality)
CREATE TABLE SalaryGrades (
    GradeLevel VARCHAR(10),
    MinSalary DECIMAL(10, 2),
    MaxSalary DECIMAL(10, 2)
);

INSERT INTO SalaryGrades VALUES 
    ('Junior', 50000, 70000),
    ('Mid', 70001, 85000),
    ('Senior', 85001, 120000);

SELECT e.FirstName, e.LastName, e.Salary, s.GradeLevel
FROM Employees e
JOIN SalaryGrades s ON e.Salary BETWEEN s.MinSalary AND s.MaxSalary;

-- Self Join (joining table to itself)
CREATE TABLE EmployeeHierarchy (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    ManagerID INT
);

INSERT INTO EmployeeHierarchy VALUES
    (1, 'Alice', NULL),
    (2, 'Bob', 1),
    (3, 'Charlie', 1),
    (4, 'David', 2);

SELECT e.EmployeeName AS Employee, m.EmployeeName AS Manager
FROM EmployeeHierarchy e
LEFT JOIN EmployeeHierarchy m ON e.ManagerID = m.EmployeeID;

-- ============================================
-- 6. SUBQUERIES
-- ============================================

-- Simple Subquery in WHERE clause
SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

-- Subquery with IN
SELECT FirstName, LastName
FROM Employees
WHERE DepartmentID IN (SELECT DepartmentID FROM Departments WHERE Location = 'New York');

-- Subquery in FROM clause (Derived Table)
SELECT DeptSalaries.DepartmentID, DeptSalaries.AvgSalary
FROM (
    SELECT DepartmentID, AVG(Salary) AS AvgSalary
    FROM Employees
    GROUP BY DepartmentID
) AS DeptSalaries
WHERE DeptSalaries.AvgSalary > 75000;

-- Nested Subqueries
SELECT FirstName, LastName
FROM Employees
WHERE Salary = (
    SELECT MAX(Salary) 
    FROM Employees 
    WHERE DepartmentID = (
        SELECT DepartmentID 
        FROM Departments 
        WHERE DepartmentName = 'IT'
    )
);

-- Correlated Subquery
SELECT e1.FirstName, e1.LastName, e1.Salary, e1.DepartmentID
FROM Employees e1
WHERE e1.Salary > (
    SELECT AVG(e2.Salary)
    FROM Employees e2
    WHERE e2.DepartmentID = e1.DepartmentID
);

-- EXISTS operator
SELECT d.DepartmentName
FROM Departments d
WHERE EXISTS (
    SELECT 1 
    FROM Employees e 
    WHERE e.DepartmentID = d.DepartmentID
);

-- ============================================
-- 7. CONSTRAINTS
-- ============================================

-- Column Level Constraints
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) CHECK (Price > 0),
    Stock INT DEFAULT 0,
    Email VARCHAR(100) UNIQUE
);

-- Table Level Constraints
CREATE TABLE Orders (
    OrderID INT,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    CONSTRAINT PK_Orders PRIMARY KEY (OrderID),
    CONSTRAINT CHK_Amount CHECK (TotalAmount >= 0)
);

-- Foreign Key Constraint
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    CONSTRAINT FK_OrderDetails_Orders 
        FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    CONSTRAINT FK_OrderDetails_Products 
        FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Adding Constraints to Existing Tables
ALTER TABLE Employees
ADD CONSTRAINT FK_Employees_Departments
FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID);

ALTER TABLE Employees
ADD CONSTRAINT CHK_Salary CHECK (Salary > 0);

-- Removing Constraints
ALTER TABLE Employees
DROP CONSTRAINT CHK_Salary;

-- Disabling Constraints (SQL Server)
ALTER TABLE Employees
NOCHECK CONSTRAINT FK_Employees_Departments;

-- Enabling Constraints
ALTER TABLE Employees
CHECK CONSTRAINT FK_Employees_Departments;

-- ============================================
-- 8. STORED PROCEDURES
-- ============================================

-- Creating a Simple Stored Procedure
CREATE PROCEDURE GetAllEmployees
AS
BEGIN
    SELECT * FROM Employees;
END;

-- Executing a Stored Procedure
EXEC GetAllEmployees;
-- or
EXECUTE GetAllEmployees;

-- Procedure with Input Parameters
CREATE PROCEDURE GetEmployeesByDepartment
    @DepartmentID INT
AS
BEGIN
    SELECT FirstName, LastName, Salary
    FROM Employees
    WHERE DepartmentID = @DepartmentID;
END;

-- Execute with parameter
EXEC GetEmployeesByDepartment @DepartmentID = 1;

-- Procedure with Multiple Input Parameters
CREATE PROCEDURE GetEmployeesBySalaryRange
    @MinSalary DECIMAL(10, 2),
    @MaxSalary DECIMAL(10, 2)
AS
BEGIN
    SELECT FirstName, LastName, Salary
    FROM Employees
    WHERE Salary BETWEEN @MinSalary AND @MaxSalary
    ORDER BY Salary DESC;
END;

EXEC GetEmployeesBySalaryRange @MinSalary = 70000, @MaxSalary = 90000;

-- Procedure with Output Parameters
CREATE PROCEDURE GetEmployeeCount
    @DepartmentID INT,
    @EmployeeCount INT OUTPUT
AS
BEGIN
    SELECT @EmployeeCount = COUNT(*)
    FROM Employees
    WHERE DepartmentID = @DepartmentID;
END;

-- Execute with output parameter
DECLARE @Count INT;
EXEC GetEmployeeCount @DepartmentID = 1, @EmployeeCount = @Count OUTPUT;
SELECT @Count AS EmployeeCount;
GO;
-- Procedure with both Input and Output Parameters
CREATE PROCEDURE CalculateDepartmentStats
    @DepartmentID INT,
    @AvgSalary DECIMAL(10, 2) OUTPUT,
    @TotalEmployees INT OUTPUT
AS
BEGIN
    SELECT 
        @AvgSalary = AVG(Salary),
        @TotalEmployees = COUNT(*)
    FROM Employees
    WHERE DepartmentID = @DepartmentID;
END;

DECLARE @Avg DECIMAL(10, 2), @Total INT;
EXEC CalculateDepartmentStats 
    @DepartmentID = 1, 
    @AvgSalary = @Avg OUTPUT, 
    @TotalEmployees = @Total OUTPUT;
SELECT @Avg AS AverageSalary, @Total AS TotalEmployees;
GO;
-- Modifying a Stored Procedure
ALTER PROCEDURE GetAllEmployees
AS
BEGIN
    SELECT EmployeeID, FirstName, LastName, Salary
    FROM Employees
    ORDER BY LastName;
END;

-- Error Handling with TRY...CATCH
CREATE PROCEDURE InsertEmployee
    @EmployeeID INT,
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @Email VARCHAR(100),
    @Salary DECIMAL(10, 2)
AS
BEGIN
    BEGIN TRY
        INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, Salary)
        VALUES (@EmployeeID, @FirstName, @LastName, @Email, @Salary);
        
        PRINT 'Employee inserted successfully';
    END TRY
    BEGIN CATCH
        PRINT 'Error occurred: ' + ERROR_MESSAGE();
        PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS VARCHAR);
    END CATCH
END;

-- Test error handling
EXEC InsertEmployee 
    @EmployeeID = 1, 
    @FirstName = 'Test', 
    @LastName = 'User', 
    @Email = 'test@test.com', 
    @Salary = 50000;

-- Dropping a Stored Procedure
DROP PROCEDURE IF EXISTS GetEmployeesBySalaryRange;

-- ============================================
-- 9. TRIGGERS
-- ============================================

-- Create audit table
CREATE TABLE EmployeeAudit (
    AuditID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeID INT,
    Action VARCHAR(50),
    OldSalary DECIMAL(10, 2),
    NewSalary DECIMAL(10, 2),
    ChangeDate DATETIME DEFAULT GETDATE(),
    ChangedBy VARCHAR(100)
);

-- AFTER INSERT Trigger
CREATE TRIGGER trg_AfterInsert_Employee
ON Employees
AFTER INSERT
AS
BEGIN
    INSERT INTO EmployeeAudit (EmployeeID, Action, NewSalary, ChangedBy)
    SELECT EmployeeID, 'INSERT', Salary, SYSTEM_USER
    FROM inserted;
    
    PRINT 'New employee record inserted and logged';
END;

-- AFTER UPDATE Trigger
CREATE TRIGGER trg_AfterUpdate_Employee
ON Employees
AFTER UPDATE
AS
BEGIN
    IF UPDATE(Salary)
    BEGIN
        INSERT INTO EmployeeAudit (EmployeeID, Action, OldSalary, NewSalary, ChangedBy)
        SELECT 
            i.EmployeeID, 
            'UPDATE', 
            d.Salary, 
            i.Salary, 
            SYSTEM_USER
        FROM inserted i
        INNER JOIN deleted d ON i.EmployeeID = d.EmployeeID;
        
        PRINT 'Salary update logged';
    END
END;

-- AFTER DELETE Trigger
CREATE TRIGGER trg_AfterDelete_Employee
ON Employees
AFTER DELETE
AS
BEGIN
    INSERT INTO EmployeeAudit (EmployeeID, Action, OldSalary, ChangedBy)
    SELECT EmployeeID, 'DELETE', Salary, SYSTEM_USER
    FROM deleted;
    
    PRINT 'Employee deletion logged';
END;

-- INSTEAD OF Trigger (intercepts the operation)
CREATE TRIGGER trg_InsteadOfDelete_Employee
ON Employees
INSTEAD OF DELETE
AS
BEGIN
    -- Soft delete: instead of deleting, mark as inactive
    UPDATE Employees
    SET Salary = -1  -- Using -1 to indicate "deleted" (in real scenario, add IsActive column)
    WHERE EmployeeID IN (SELECT EmployeeID FROM deleted);
    
    PRINT 'Employee marked as inactive instead of deletion';
END;

-- Multiple DML operations in one trigger
CREATE TRIGGER trg_AllOperations_Employee
ON Employees
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @Action VARCHAR(50);
    
    IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
        SET @Action = 'UPDATE';
    ELSE IF EXISTS (SELECT * FROM inserted)
        SET @Action = 'INSERT';
    ELSE IF EXISTS (SELECT * FROM deleted)
        SET @Action = 'DELETE';
    
    PRINT 'Action performed: ' + @Action;
END;

-- Trigger for Data Integrity (prevent salary decrease)
CREATE TRIGGER trg_PreventSalaryDecrease
ON Employees
AFTER UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        INNER JOIN deleted d ON i.EmployeeID = d.EmployeeID
        WHERE i.Salary < d.Salary
    )
    BEGIN
        RAISERROR('Salary cannot be decreased', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

-- View existing triggers
SELECT 
    t.name AS TriggerName,
    OBJECT_NAME(t.parent_id) AS TableName,
    t.is_disabled,
    t.create_date
FROM sys.triggers t
WHERE t.parent_class = 1;  -- Object triggers

-- Disable a trigger
DISABLE TRIGGER trg_AfterInsert_Employee ON Employees;

-- Enable a trigger
ENABLE TRIGGER trg_AfterInsert_Employee ON Employees;

-- Modifying a trigger
ALTER TRIGGER trg_AfterInsert_Employee
ON Employees
AFTER INSERT
AS
BEGIN
    INSERT INTO EmployeeAudit (EmployeeID, Action, NewSalary, ChangedBy)
    SELECT EmployeeID, 'NEW EMPLOYEE', Salary, SYSTEM_USER
    FROM inserted;
    
    PRINT 'Modified trigger: New employee logged';
END;

-- Dropping a trigger
DROP TRIGGER IF EXISTS trg_AllOperations_Employee;

-- ============================================
-- TEST QUERIES TO VERIFY EVERYTHING
-- ============================================

-- Test the triggers
INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, HireDate, Salary, DepartmentID)
VALUES (10, 'Test', 'Trigger', 'test.trigger@company.com', GETDATE(), 60000, 1);

UPDATE Employees SET Salary = 65000 WHERE EmployeeID = 10;

-- View audit log
SELECT * FROM EmployeeAudit;

