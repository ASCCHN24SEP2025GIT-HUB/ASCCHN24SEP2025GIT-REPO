-- Active: 1753159798022@@127.0.0.1@1433@AdventureWorks2022
-- Statistical Variance Defintion : Variance is a statistical measurement that describes the spread or dispersion of a set of data points around their mean (average) value. It quantifies how much the individual data points differ from the mean, providing insight into the variability within the dataset. A higher variance indicates that the data points are more spread out from the mean, while a lower variance suggests that they are closer to the mean. Variance is commonly used in various fields such as finance, economics, and quality control to assess risk, volatility, and consistency.

-- Statistical Variance Functions in SQL Server with Real-World Examples
-- VAR/VARIANCE returns the statistical variance of values in a population sample
-- VARP returns the statistical variance for the population

-- Scenario 1: Product Price Variation Analysis
-- Analyzing price variation across different product categories

SELECT NAME AS CATEGORYNAME FROM Production.ProductCategory;
SELECT  COUNT(ProductID) AS ProductCount FROM "Production"."Product";
SELECT LISTPRICE FROM Production."Product";
SELECT  FORMAT(MIN(ListPrice), 'C') AS MinPrice FROM Production."Product";
SELECT   VAR(ListPrice) AS PriceVariance FROM Production."Product";
SELECT   SIZE FROM Production."Product";
SELECT * FROM Production."Product"; 

SELECT PRODUCTION.PRODUCTREVIEW.RATING FROM PRODUCTION.PRODUCTREVIEW;
UPDATE PRODUCTION.PRODUCTREVIEW SET RATING = 5 WHERE RATING =2;
SELECT VAR(PRODUCTION.PRODUCTREVIEW.RATING) FROM PRODUCTION.PRODUCTREVIEW;
SELECT 
    pc.Name AS CategoryName,
    COUNT(p.ProductID) AS ProductCount,
    AVG(ListPrice) AS AveragePrice,
    VAR(ListPrice) AS PriceVariance,        -- Sample variance
    FORMAT(MIN(ListPrice), 'C') AS MinPrice,
    FORMAT(MAX(ListPrice), 'C') AS MaxPrice
FROM Production.Product p
JOIN Production.ProductSubcategory ps ON p.ProductSubcategoryID = ps.ProductSubcategoryID
JOIN Production.ProductCategory pc ON ps.ProductCategoryID = pc.ProductCategoryID
WHERE ListPrice > 0
GROUP BY pc.Name
ORDER BY PriceVariance DESC;

-- Scenario 2: Sales Order Value Variation by Territory
-- Analyzing the consistency of order values across different sales territories
SELECT 
    st.Name AS TerritoryName,
    COUNT(soh.SalesOrderID) AS NumberOfOrders,
    FORMAT(AVG(TotalDue), 'C') AS AverageOrderValue,
    FORMAT(SQRT(VAR(TotalDue)), 'C') AS OrderValueStdDev,
    FORMAT(VAR(TotalDue), 'C') AS OrderValueVariance,
    FORMAT(MIN(TotalDue), 'C') AS MinOrderValue,
    FORMAT(MAX(TotalDue), 'C') AS MaxOrderValue
FROM Sales.SalesOrderHeader soh
JOIN Sales.SalesTerritory st ON soh.TerritoryID = st.TerritoryID
GROUP BY st.Name
ORDER BY VAR(TotalDue) DESC;

-- Scenario 3: Employee Vacation Hours Analysis
-- Analyzing the variation in vacation hours across departments
SELECT 
    d.Name AS Department,
    COUNT(*) AS EmployeeCount,
    AVG(VacationHours) AS AvgVacationHours,
    VAR(VacationHours) AS VacationHoursVariance,
    SQRT(VAR(VacationHours)) AS VacationHoursStdDev,
    MIN(VacationHours) AS MinVacationHours,
    MAX(VacationHours) AS MaxVacationHours
FROM HumanResources.Employee e
JOIN HumanResources.EmployeeDepartmentHistory edh 
    ON e.BusinessEntityID = edh.BusinessEntityID
JOIN HumanResources.Department d 
    ON edh.DepartmentID = d.DepartmentID
WHERE edh.EndDate IS NULL  -- Current department only
GROUP BY d.Name
ORDER BY VacationHoursVariance DESC;

-- Scenario 4: Product Inventory Variation Analysis
-- Analyzing stock level consistency across locations
SELECT 
    p.Name AS ProductName,
    COUNT(DISTINCT i.LocationID) AS NumberOfLocations,
    SUM(i.Quantity) AS TotalQuantity,
    AVG(i.Quantity) AS AvgQuantityPerLocation,
    VAR(i.Quantity) AS QuantityVariance,
    SQRT(VAR(i.Quantity)) AS QuantityStdDev,
    MIN(i.Quantity) AS MinQuantity,
    MAX(i.Quantity) AS MaxQuantity
FROM Production.Product p
JOIN Production.ProductInventory i ON p.ProductID = i.ProductID
GROUP BY p.Name
HAVING COUNT(DISTINCT i.LocationID) > 1  -- Only products in multiple locations
ORDER BY QuantityVariance DESC;

-- Scenario 5: Monthly Sales Variation Analysis
-- Analyzing sales value consistency across months
WITH MonthlySales AS (
    SELECT 
        YEAR(OrderDate) AS OrderYear,
        MONTH(OrderDate) AS OrderMonth,
        SUM(TotalDue) AS MonthlyTotal
    FROM Sales.SalesOrderHeader
    GROUP BY YEAR(OrderDate), MONTH(OrderDate)
)
SELECT 
    OrderYear,
    FORMAT(AVG(MonthlyTotal), 'C') AS AvgMonthlySales,
    FORMAT(VAR(MonthlyTotal), 'C') AS SalesVariance,
    FORMAT(SQRT(VAR(MonthlyTotal)), 'C') AS SalesStdDev,
    FORMAT(MIN(MonthlyTotal), 'C') AS MinMonthlySales,
    FORMAT(MAX(MonthlyTotal), 'C') AS MaxMonthlySales,
    FORMAT(MAX(MonthlyTotal) - MIN(MonthlyTotal), 'C') AS SalesRange
FROM MonthlySales
GROUP BY OrderYear
ORDER BY OrderYear;

-- Scenario 6: Customer Purchase Pattern Variation
-- Analyzing consistency in customer spending
WITH CustomerPurchases AS (
    SELECT 
        CustomerID,
        MONTH(OrderDate) AS OrderMonth,
        YEAR(OrderDate) AS OrderYear,
        SUM(TotalDue) AS MonthlySpend
    FROM Sales.SalesOrderHeader
    GROUP BY CustomerID, MONTH(OrderDate), YEAR(OrderDate)
)
SELECT TOP 20
    cp.CustomerID,
    COUNT(*) AS NumberOfMonths,
    FORMAT(AVG(MonthlySpend), 'C') AS AvgMonthlySpend,
    FORMAT(VAR(MonthlySpend), 'C') AS SpendVariance,
    FORMAT(SQRT(VAR(MonthlySpend)), 'C') AS SpendStdDev,
    FORMAT(MIN(MonthlySpend), 'C') AS MinMonthlySpend,
    FORMAT(MAX(MonthlySpend), 'C') AS MaxMonthlySpend
FROM CustomerPurchases cp
GROUP BY cp.CustomerID
HAVING COUNT(*) > 6  -- Customers with more than 6 months of purchases
ORDER BY VAR(MonthlySpend) DESC;