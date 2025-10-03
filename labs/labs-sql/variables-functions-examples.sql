-- Real-world Scenarios for Variables and Functions in SQL Server

-- Scenario 1: Calculating Total Order Value with Tax
-- This scenario demonstrates using variables to store tax rates and calculate order totals
DECLARE @TaxRate DECIMAL(4,2) = 0.18;  -- 18% tax rate
DECLARE @OrderSubTotal MONEY;
DECLARE @TotalWithTax MONEY;

-- Let's say we want to calculate the total for order 43659 from AdventureWorks
SELECT @OrderSubTotal = SUM(OrderQty * UnitPrice)
FROM Sales.SalesOrderDetail
WHERE SalesOrderID = 43659;

SET @TotalWithTax = @OrderSubTotal * (1 + @TaxRate);

SELECT 
    'Order Subtotal' = @OrderSubTotal,
    'Tax Amount' = @OrderSubTotal * @TaxRate,
    'Total with Tax' = @TotalWithTax;

-- Scenario 2: Date Handling for Report Generation
-- This scenario shows how to use date functions for reporting periods
DECLARE @StartDate DATE = DATEADD(MONTH, -1, GETDATE());  -- First day of previous month
DECLARE @EndDate DATE = DATEADD(DAY, -1, DATEADD(MONTH, 0, GETDATE()));  -- Last day of previous month

SELECT 
    'Report Period' = CONCAT(DATENAME(MONTH, @StartDate), ' ', YEAR(@StartDate)),
    'Total Orders' = COUNT(*),
    'Total Value' = SUM(TotalDue)
FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN @StartDate AND @EndDate;

-- Scenario 3: Customer Categorization Function
-- This scenario creates a function to categorize customers based on their purchase history
GO
CREATE OR ALTER FUNCTION dbo.GetCustomerCategory
(
    @TotalPurchases MONEY
)
RETURNS VARCHAR(20)
AS
BEGIN
    DECLARE @Category VARCHAR(20)
    
    SET @Category = 
        CASE
            WHEN @TotalPurchases >= 50000 THEN 'Platinum'
            WHEN @TotalPurchases >= 25000 THEN 'Gold'
            WHEN @TotalPurchases >= 10000 THEN 'Silver'
            ELSE 'Bronze'
        END
    
    RETURN @Category
END;
GO

-- Using the function to categorize customers
SELECT 
    c.CustomerID,
    c.FirstName + ' ' + c.LastName AS CustomerName,
    SUM(soh.TotalDue) AS TotalPurchases,
    dbo.GetCustomerCategory(SUM(soh.TotalDue)) AS CustomerCategory
FROM Sales.Customer c
JOIN Person.Person p ON c.PersonID = p.BusinessEntityID
JOIN Sales.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID
GROUP BY c.CustomerID, c.FirstName + ' ' + c.LastName
ORDER BY TotalPurchases DESC;

-- Scenario 4: Dynamic Price Adjustment
-- This scenario uses variables to implement a dynamic discount system
DECLARE @SeasonalDiscount DECIMAL(4,2) = 0.15;  -- 15% seasonal discount
DECLARE @BulkDiscount DECIMAL(4,2) = 0.10;      -- 10% bulk purchase discount
DECLARE @MinBulkQuantity INT = 10;              -- Minimum quantity for bulk discount

SELECT 
    p.ProductID,
    p.Name,
    p.ListPrice AS OriginalPrice,
    CASE 
        WHEN sod.OrderQty >= @MinBulkQuantity 
        THEN p.ListPrice * (1 - @BulkDiscount - @SeasonalDiscount)
        ELSE p.ListPrice * (1 - @SeasonalDiscount)
    END AS DiscountedPrice,
    sod.OrderQty
FROM Production.Product p
JOIN Sales.SalesOrderDetail sod ON p.ProductID = sod.ProductID
WHERE sod.SalesOrderID = 43659;

-- Scenario 5: Inventory Management Function
-- This function helps determine reorder status based on inventory levels
GO
CREATE OR ALTER FUNCTION dbo.GetInventoryStatus
(
    @CurrentStock INT,
    @SafetyStock INT,
    @ReorderPoint INT
)
RETURNS VARCHAR(20)
AS
BEGIN
    RETURN
        CASE
            WHEN @CurrentStock <= @SafetyStock THEN 'Critical'
            WHEN @CurrentStock <= @ReorderPoint THEN 'Reorder'
            WHEN @CurrentStock <= @ReorderPoint * 1.5 THEN 'Warning'
            ELSE 'Adequate'
        END
END;
GO

-- Using the inventory status function
SELECT 
    ProductID,
    Name,
    SafetyStockLevel,
    ReorderPoint,
    Quantity = (SELECT SUM(Quantity) 
                FROM Production.ProductInventory 
                WHERE ProductID = p.ProductID),
    dbo.GetInventoryStatus(
        (SELECT SUM(Quantity) 
         FROM Production.ProductInventory 
         WHERE ProductID = p.ProductID),
        SafetyStockLevel,
        ReorderPoint
    ) AS InventoryStatus
FROM Production.Product p
WHERE FinishedGoodsFlag = 1
ORDER BY InventoryStatus;