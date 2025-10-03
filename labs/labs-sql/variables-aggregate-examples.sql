-- Real-world Scenarios: Variables with Aggregate Functions in SQL Server

-- Scenario 1: Sales Performance Analysis
-- Calculate various sales metrics using variables and aggregates
DECLARE @TotalSales MONEY;
DECLARE @AverageSaleAmount MONEY;
DECLARE @MaxSingleSale MONEY;
DECLARE @TotalOrders INT;
DECLARE @Year INT = 2014;

-- Populate variables with aggregate results
SELECT 
    @TotalSales = SUM(TotalDue),
    @AverageSaleAmount = AVG(TotalDue),
    @MaxSingleSale = MAX(TotalDue),
    @TotalOrders = COUNT(*)
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = @Year;

-- Display the results with meaningful labels
SELECT 
    'Year' = @Year,
    'Total Sales' = FORMAT(@TotalSales, 'C'),
    'Average Sale' = FORMAT(@AverageSaleAmount, 'C'),
    'Largest Sale' = FORMAT(@MaxSingleSale, 'C'),
    'Number of Orders' = @TotalOrders;

-- Scenario 2: Product Performance Metrics
-- Calculate product performance statistics using variables
DECLARE @TopProductThreshold MONEY = 1000000; -- Products with sales over 1M
DECLARE @ProductCount INT;
DECLARE @HighPerformingProducts INT;
DECLARE @AverageUnitPrice MONEY;

SELECT 
    @ProductCount = COUNT(DISTINCT p.ProductID),
    @HighPerformingProducts = COUNT(DISTINCT CASE 
        WHEN SUM(sod.LineTotal) > @TopProductThreshold 
        THEN p.ProductID END),
    @AverageUnitPrice = AVG(p.ListPrice)
FROM Production.Product p
LEFT JOIN Sales.SalesOrderDetail sod ON p.ProductID = sod.ProductID
GROUP BY p.ProductID;

SELECT
    'Total Products' = @ProductCount,
    'High Performing Products' = @HighPerformingProducts,
    'Average Unit Price' = FORMAT(@AverageUnitPrice, 'C'),
    'Performance Ratio' = FORMAT(CAST(@HighPerformingProducts AS FLOAT) / 
                               CAST(@ProductCount AS FLOAT) * 100, 'N2') + '%';

-- Scenario 3: Customer Analysis with Rolling Averages
-- Calculate customer spending patterns using variables and aggregates
DECLARE @CustomerID INT = 29825;  -- Example customer
DECLARE @TotalLifetimeValue MONEY;
DECLARE @AverageOrderValue MONEY;
DECLARE @OrderFrequency DECIMAL(10,2);
DECLARE @LastOrderDate DATE;

SELECT 
    @TotalLifetimeValue = SUM(TotalDue),
    @AverageOrderValue = AVG(TotalDue),
    @OrderFrequency = COUNT(*) / 
        CAST(DATEDIFF(MONTH, MIN(OrderDate), MAX(OrderDate)) AS DECIMAL(10,2)),
    @LastOrderDate = MAX(OrderDate)
FROM Sales.SalesOrderHeader
WHERE CustomerID = @CustomerID;

SELECT
    'Customer ID' = @CustomerID,
    'Lifetime Value' = FORMAT(@TotalLifetimeValue, 'C'),
    'Average Order Value' = FORMAT(@AverageOrderValue, 'C'),
    'Orders per Month' = FORMAT(@OrderFrequency, 'N2'),
    'Last Order Date' = FORMAT(@LastOrderDate, 'MMM dd, yyyy');

-- Scenario 4: Inventory Analysis
-- Calculate inventory metrics using variables and aggregates
DECLARE @TotalInventoryValue MONEY;
DECLARE @AverageItemValue MONEY;
DECLARE @LowStockItems INT;
DECLARE @StockThreshold INT = 50;  -- Define low stock threshold

SELECT 
    @TotalInventoryValue = SUM(p.StandardCost * i.Quantity),
    @AverageItemValue = AVG(p.StandardCost),
    @LowStockItems = COUNT(DISTINCT CASE 
        WHEN i.Quantity <= @StockThreshold THEN p.ProductID 
        END)
FROM Production.Product p
JOIN Production.ProductInventory i ON p.ProductID = i.ProductID;

SELECT
    'Total Inventory Value' = FORMAT(@TotalInventoryValue, 'C'),
    'Average Item Value' = FORMAT(@AverageItemValue, 'C'),
    'Low Stock Items' = @LowStockItems,
    'Low Stock Threshold' = @StockThreshold;

-- Scenario 5: Employee Performance Metrics
-- Calculate sales team performance using variables and aggregates
DECLARE @TopSalesThreshold MONEY = 2000000;  -- Top performer threshold
DECLARE @TotalSalesPeople INT;
DECLARE @TopPerformers INT;
DECLARE @AverageSalesPerPerson MONEY;

SELECT 
    @TotalSalesPeople = COUNT(DISTINCT sp.BusinessEntityID),
    @TopPerformers = COUNT(DISTINCT CASE 
        WHEN SUM(soh.TotalDue) > @TopSalesThreshold 
        THEN sp.BusinessEntityID END),
    @AverageSalesPerPerson = AVG(SalesYTD)
FROM Sales.SalesPerson sp
LEFT JOIN Sales.SalesOrderHeader soh 
    ON sp.BusinessEntityID = soh.SalesPersonID
GROUP BY sp.BusinessEntityID;

SELECT
    'Total Sales People' = @TotalSalesPeople,
    'Top Performers' = @TopPerformers,
    'Average Sales per Person' = FORMAT(@AverageSalesPerPerson, 'C'),
    'Top Performer Ratio' = FORMAT(CAST(@TopPerformers AS FLOAT) / 
                                 CAST(@TotalSalesPeople AS FLOAT) * 100, 'N2') + '%';