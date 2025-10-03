# :rocket: Working with SQL

---

### :triangular_ruler: 1. DATA DEFINITION LANGUAGE (DDL)

#### :gear: Creating Tables
```sql
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
```

#### :gear: Altering Table Structure
```sql
-- Add a new column
ALTER TABLE Employees ADD PhoneNumber VARCHAR(15);

-- Modify column data type
ALTER TABLE Employees ALTER COLUMN Email VARCHAR(150);

-- Drop a column
ALTER TABLE Employees DROP COLUMN PhoneNumber;
```

#### :warning: Removing a Table
```sql
DROP TABLE IF EXISTS TempTable;
```

---

### :dart: 2. DATA MANIPULATION LANGUAGE (DML)

#### :bulb: Insert sample departments
```sql
INSERT INTO Departments (DepartmentID, DepartmentName, Location)
VALUES (1, 'IT', 'New York'),
       (2, 'HR', 'Chicago'),
       (3, 'Sales', 'Los Angeles');
```

#### :gear: Inserting Rows (Multiple Methods)
```sql
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
```

#### :gear: Updating Rows
```sql
-- Update single row
UPDATE Employees 
SET Salary = 78000.00 
WHERE EmployeeID = 1;

-- Update multiple rows
UPDATE Employees 
SET Salary = Salary * 1.10 
WHERE DepartmentID = 1;
```

#### :gear: Deleting Rows
```sql
-- Delete specific row
DELETE FROM Employees WHERE EmployeeID = 5;

-- Delete with condition
DELETE FROM Employees WHERE Salary < 70000;
```

#### :shield: Transaction Processing
```sql
BEGIN TRANSACTION;
    INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, HireDate, Salary, DepartmentID)
    VALUES (6, 'Anna', 'Davis', 'anna.d@company.com', '2023-01-10', 72000.00, 3);
    
    UPDATE Employees SET Salary = Salary * 1.05 WHERE DepartmentID = 2;
COMMIT; -- Save changes

-- Rollback example
BEGIN TRANSACTION;
    DELETE FROM Employees WHERE DepartmentID = 3;
ROLLBACK; -- Undo changes
```

---

### :mag: 3. DATA RETRIEVAL

#### :bulb: Basic SELECT statement
```sql
SELECT * FROM Employees;
```

#### :bulb: Select specific columns
```sql
SELECT FirstName, LastName, Salary FROM Employees;
```

#### :bulb: SELECT with DISTINCT
```sql
SELECT DISTINCT DepartmentID FROM Employees;
```

#### :dart: Queries Based on Conditions (WHERE clause)
```sql
SELECT * FROM Employees WHERE Salary > 75000;

SELECT FirstName, LastName FROM Employees WHERE DepartmentID = 1;

SELECT * FROM Employees WHERE HireDate >= '2020-01-01';
```

#### :brain: Queries Using Operators
```sql
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
```

#### :dart: Setting Query Results
```sql
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
```

---

### :bulb: 4. SQL FUNCTIONS

#### :gear: SINGLE ROW FUNCTIONS

##### :bulb: Character Functions
```sql
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
```

##### :bulb: Number Functions
```sql
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
```

##### :bulb: Date Functions
```sql
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
```

##### :bulb: Conversion Functions
```sql
-- CAST
SELECT Salary, CAST(Salary AS INT) AS IntSalary 
FROM Employees;

-- CONVERT
SELECT HireDate, CONVERT(VARCHAR, HireDate, 101) AS USDate 
FROM Employees;

-- TRY_CAST (returns NULL if conversion fails)
SELECT TRY_CAST('123' AS INT) AS ValidNumber,
       TRY_CAST('ABC' AS INT) AS InvalidNumber;
```

#### :gear: GROUP FUNCTIONS (Aggregate Functions)
```sql
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
```

---

### :triangular_ruler: 5. JOINS

#### :gear: Equi Join (using WHERE - older syntax)
```sql
SELECT e.FirstName, e.LastName, d.DepartmentName
FROM Employees e, Departments d
WHERE e.DepartmentID = d.DepartmentID;
```

#### :gear: Inner Join (modern syntax)
```sql
SELECT e.FirstName, e.LastName, e.Salary, d.DepartmentName
FROM Employees e
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID;
```

#### :gear: Left Outer Join
```sql
SELECT e.FirstName, e.LastName, d.DepartmentName
FROM Employees e
LEFT OUTER JOIN Departments d ON e.DepartmentID = d.DepartmentID;
```

#### :gear: Right Outer Join
```sql
SELECT e.FirstName, e.LastName, d.DepartmentName
FROM Employees e
RIGHT OUTER JOIN Departments d ON e.DepartmentID = d.DepartmentID;
```

#### :gear: Full Outer Join
```sql
SELECT e.FirstName, e.LastName, d.DepartmentName
FROM Employees e
FULL OUTER JOIN Departments d ON e.DepartmentID = d.DepartmentID;
```

#### :gear: Nonequi Join (join on condition other than equality)
```sql
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
```

#### :gear: Self Join (joining table to itself)
```sql
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
```

---

### :brain: 6. SUBQUERIES

#### :bulb: Simple Subquery in WHERE clause
```sql
SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);
```

#### :bulb: Subquery with IN
```sql
SELECT FirstName, LastName
FROM Employees
WHERE DepartmentID IN (SELECT DepartmentID FROM Departments WHERE Location = 'New York');
```

#### :bulb: Subquery in FROM clause (Derived Table)
```sql
SELECT DeptSalaries.DepartmentID, DeptSalaries.AvgSalary
FROM (
    SELECT DepartmentID, AVG(Salary) AS AvgSalary
    FROM Employees
    GROUP BY DepartmentID
) AS DeptSalaries
WHERE DeptSalaries.AvgSalary > 75000;
```

#### :bulb: Nested Subqueries
```sql
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
```

#### :bulb: Correlated Subquery
```sql
SELECT e1.FirstName, e1.LastName, e1.Salary, e1.DepartmentID
FROM Employees e1
WHERE e1.Salary > (
    SELECT AVG(e2.Salary)
    FROM Employees e2
    WHERE e2.DepartmentID = e1.DepartmentID
);
```

#### :bulb: EXISTS operator
```sql
SELECT d.DepartmentName
FROM Departments d
WHERE EXISTS (
    SELECT 1 
    FROM Employees e 
    WHERE e.DepartmentID = d.DepartmentID
);
```

---

### :shield: 7. CONSTRAINTS

#### :gear: Column Level Constraints
```sql
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) CHECK (Price > 0),
    Stock INT DEFAULT 0,
    Email VARCHAR(100) UNIQUE
);
```

#### :gear: Table Level Constraints
```sql
CREATE TABLE Orders (
    OrderID INT,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    CONSTRAINT PK_Orders PRIMARY KEY (OrderID),
    CONSTRAINT CHK_Amount CHECK (TotalAmount >= 0)
);
```

#### :gear: Foreign Key Constraint
```sql
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
```

#### :gear: Adding Constraints to Existing Tables
```sql
ALTER TABLE Employees
ADD CONSTRAINT FK_Employees_Departments
FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID);

ALTER TABLE Employees
ADD CONSTRAINT CHK_Salary CHECK (Salary > 0);
```

#### :gear: Removing Constraints
```sql
ALTER TABLE Employees
DROP CONSTRAINT CHK_Salary;
```

#### :gear: Disabling Constraints (SQL Server)
```sql
ALTER TABLE Employees
NOCHECK CONSTRAINT FK_Employees_Departments;
```

#### :gear: Enabling Constraints
```sql
ALTER TABLE Employees
CHECK CONSTRAINT FK_Employees_Departments;
```

---

### :gear: 8. STORED PROCEDURES

#### :bulb: Creating a Simple Stored Procedure
```sql
CREATE PROCEDURE GetAllEmployees
AS
BEGIN
    SELECT * FROM Employees;
END;
```

#### :bulb: Executing a Stored Procedure
```sql
EXEC GetAllEmployees;
-- or
EXECUTE GetAllEmployees;
```

#### :bulb: Procedure with Input Parameters
```sql
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
```

#### :bulb: Procedure with Multiple Input Parameters
```sql
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
```

#### :bulb: Procedure with Output Parameters
```sql
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
```

#### :bulb: Procedure with both Input and Output Parameters
```sql
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
```

#### :gear: Modifying a Stored Procedure
```sql
ALTER PROCEDURE GetAllEmployees
AS
BEGIN
    SELECT EmployeeID, FirstName, LastName, Salary
    FROM Employees
    ORDER BY LastName;
END;
```

#### :shield: Error Handling with TRY...CATCH
```sql
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
```

#### :gear: Dropping a Stored Procedure
```sql
DROP PROCEDURE IF EXISTS GetEmployeesBySalaryRange;
```

---

### :test_tube: 9. TRIGGERS

#### :bulb: Create audit table
```sql
CREATE TABLE EmployeeAudit (
    AuditID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeID INT,
    Action VARCHAR(50),
    OldSalary DECIMAL(10, 2),
    NewSalary DECIMAL(10, 2),
    ChangeDate DATETIME DEFAULT GETDATE(),
    ChangedBy VARCHAR(100)
);
```

#### :gear: AFTER INSERT Trigger
```sql
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
```

#### :gear: AFTER UPDATE Trigger
```sql
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
```

#### :gear: AFTER DELETE Trigger
```sql
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
```

#### :gear: INSTEAD OF Trigger (intercepts the operation)
```sql
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
```

#### :gear: Multiple DML operations in one trigger
```sql
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
```

#### :shield: Trigger for Data Integrity (prevent salary decrease)
```sql
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
```

#### :bulb: View existing triggers
```sql
SELECT 
    t.name AS TriggerName,
    OBJECT_NAME(t.parent_id) AS TableName,
    t.is_disabled,
    t.create_date
FROM sys.triggers t
WHERE t.parent_class = 1;  -- Object triggers
```

#### :gear: Disable a trigger
```sql
DISABLE TRIGGER trg_AfterInsert_Employee ON Employees;
```

#### :gear: Enable a trigger
```sql
ENABLE TRIGGER trg_AfterInsert_Employee ON Employees;
```

#### :gear: Modifying a trigger
```sql
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
```

#### :gear: Dropping a trigger
```sql
DROP TRIGGER IF EXISTS trg_AllOperations_Employee;
```

---

### :test_tube: TEST QUERIES TO VERIFY EVERYTHING

#### :white_check_mark: Test the triggers
```sql
INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, HireDate, Salary, DepartmentID)
VALUES (10, 'Test', 'Trigger', 'test.trigger@company.com', GETDATE(), 60000, 1);

UPDATE Employees SET Salary = 65000 WHERE EmployeeID = 10;
```

#### :white_check_mark: View audit log
```sql
SELECT * FROM EmployeeAudit;
```

---

