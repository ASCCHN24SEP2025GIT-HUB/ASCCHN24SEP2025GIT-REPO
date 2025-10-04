
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

-- Rollback example
BEGIN TRANSACTION;
    DELETE FROM Employees WHERE DepartmentID = 3;
ROLLBACK; -- Undo changes


SELECT ROUND(1234.567, -1);
SELECT ROUND(1256.567, -2) AS 'ROUNDED VALUE';  
SELECT ROUND(1256.567, -2) AS 'ROUNDED VALUE';
SELECT AMOUNT FROM PAYMENT;


-- 5 EXAMPLES FOR CEILING AND FLOOR
SELECT FLOOR(-1.2);   
SELECT CEILING (-1.2);
SELECT FLOOR(1.8);   


SELECT CEILING (1.2);  
SELECT FLOOR(-1.8);                    
