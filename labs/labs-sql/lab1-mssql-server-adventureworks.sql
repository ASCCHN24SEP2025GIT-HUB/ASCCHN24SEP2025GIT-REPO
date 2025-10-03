-- Active: 1753159798022@@127.0.0.1@1433@AdventureWorksLT2022
-- ============================================
-- 100 Practical AdventureWorksLT2022 SQL Questions
-- ============================================

-- BASIC SELECT QUERIES (1-10)
-- ============================================

-- 1. List all customers in the database.
-- Problem: Retrieve every customer record from the SalesLT.Customer table. 
-- This should include all columns and all rows, giving you a complete view of every customer in the system.
-- Hint: Use SELECT * to get all columns.
-- SalesLT is the schema name and Customer is the table name.
-- Schemas are optional, if not specified, the default schema (usually dbo) is used.
-- They help organize database objects into logical groups.

-- 2. Display all products offered by the company.
-- Problem: Show a complete list of products available in the SalesLT.Product table. 
-- Include every detail for each product, such as name, price, and product number.
-- Hint: SELECT * will return all product details.

-- 3. Show the first name, last name, and email address of every customer.
-- Problem: Extract only the FirstName, LastName, and EmailAddress columns from the customer table. 
-- This is useful for creating a contact list or sending emails to customers.
-- Hint: Specify the columns you want in the SELECT clause.

-- 4. List the name and price of each product.
-- Problem: For each product, display its name and the price at which it is listed (ListPrice). 
-- This helps in understanding the product catalog and pricing.
-- Hint: Only select the Name and ListPrice columns.

-- 5. Count the total number of customers.
-- Problem: Find out how many customers are currently in the database. 
-- This is a simple count of all rows in the SalesLT.Customer table.
-- Hint: Use COUNT(*) to count all rows.

-- 6. Count the total number of products in the catalog.
-- Problem: Determine how many products are available for sale by counting all entries in the Product table.
-- Hint: Use COUNT(*) on the Product table.

-- 7. List all unique product colors that are not null.
-- Problem: Identify all distinct colors that products come in, ignoring any products where the color is not specified (NULL).
-- Hint: Use DISTINCT and filter out NULLs with WHERE.

-- 8. Show the 10 most expensive products.
-- Problem: Find the top 10 products with the highest ListPrice. 
-- Display their names and prices, sorted from most to least expensive.
-- Hint: Use TOP 10 and ORDER BY ListPrice DESC.

-- 9. Retrieve all sales orders placed so far.
-- Problem: Display every sales order in the system, including all details for each order.
-- Hint: SELECT * from SalesOrderHeader.

-- 10. List products that are currently in stock (not discontinued).
-- Problem: Show all products that are still available for sale, i.e., those that do not have a SellEndDate (SellEndDate IS NULL).
-- Include their name, product number, and standard cost.
-- Hint: Filter with WHERE SellEndDate IS NULL.


-- FILTERING WITH WHERE CLAUSE (11-20)
-- ============================================

-- 11. Find products with a price greater than $1000.
-- Problem: List all products where the ListPrice is more than 1000. 
-- Show their names and prices to identify high-value items.
-- Hint: Use WHERE ListPrice > 1000.

-- 12. List customers who are based in Seattle.
-- Problem: Identify all customers whose address is in the city of Seattle. 
-- You will need to join the Customer, CustomerAddress, and Address tables to get the city information.
-- Hint: Use JOINs to connect customer to address, and filter WHERE City = 'Seattle'.

-- 13. Show all products available in red color.
-- Problem: Find products where the Color is 'Red'. 
-- Display their name, color, and price.
-- Hint: Use WHERE Color = 'Red'.

-- 14. List orders placed in the year 2008.
-- Problem: Retrieve all sales orders where the order date falls in 2008. 
-- Show the order ID, date, and total due.
-- Hint: Use YEAR(OrderDate) = 2008 in WHERE.

-- 15. Find products priced between $100 and $500.
-- Problem: List all products whose ListPrice is between 100 and 500, inclusive. 
-- This helps in identifying mid-range products.
-- Hint: Use WHERE ListPrice BETWEEN 100 AND 500.

-- 16. List customers with an adventure-works.com email address.
-- Problem: Find all customers whose email address ends with 'adventure-works.com'. 
-- This is useful for identifying company employees or partners.
-- Hint: Use LIKE '%adventure-works.com' in WHERE.

-- 17. Show products whose names start with "Mountain".
-- Problem: List all products where the name begins with the word "Mountain". 
-- Useful for finding a specific product line.
-- Hint: Use WHERE Name LIKE 'Mountain%'.

-- 18. List products without a specified color.
-- Problem: Find all products where the Color field is NULL, indicating no color has been set.
-- Hint: Use WHERE Color IS NULL.

-- 19. Find customers who have provided their phone numbers.
-- Problem: List all customers who have a non-null value in the Phone column.
-- Hint: Use WHERE Phone IS NOT NULL.

-- 20. List products in the 'Helmets' or 'Gloves' categories.
-- Problem: Show all products that belong to either the 'Helmets' or 'Gloves' categories. 
-- Join Product and ProductCategory tables to get the category name.
-- Hint: Use JOIN and WHERE pc.Name IN ('Helmets', 'Gloves').


-- AGGREGATE FUNCTIONS (21-30)
-- ============================================

-- 21. Calculate the average price of all products.
-- Problem: Find the mean ListPrice for all products in the catalog. This helps understand overall pricing.
-- Hint: Use AVG(ListPrice).

-- 22. Compute the total sales revenue so far.
-- Problem: Add up the TotalDue for all sales orders to see the company's total revenue to date.
-- Hint: Use SUM(TotalDue).

-- 23. Find the highest product price in the catalog.
-- Problem: Identify the maximum ListPrice among all products.
-- Hint: Use MAX(ListPrice).

-- 24. Find the lowest non-zero product price.
-- Problem: Get the minimum ListPrice, but ignore products with a price of zero.
-- Hint: Use WHERE ListPrice > 0 with MIN(ListPrice).

-- 25. Count how many products exist for each color.
-- Problem: For each color, count the number of products available. Ignore products with NULL color.
-- Hint: GROUP BY Color, filter out NULLs.

-- 26. Calculate the average order total for each year.
-- Problem: For every year, compute the average TotalDue for orders placed in that year.
-- Hint: GROUP BY YEAR(OrderDate), use AVG(TotalDue).

-- 27. Count how many units have been sold for each product.
-- Problem: For each product, sum the OrderQty from all sales order details to get total units sold.
-- Hint: JOIN Product and SalesOrderDetail, GROUP BY product name.

-- 28. Count how many orders each customer has placed.
-- Problem: For each customer, count the number of sales orders they've made.
-- Hint: GROUP BY CustomerID .

-- 29. Calculate the average product price in each category.
-- Problem: For every product category, compute the average ListPrice of products in that category.
-- Hint: JOIN Product and ProductCategory, GROUP BY category name.

-- 30. Show total sales for each month.
-- Problem: For every year and month, sum the TotalDue for all orders placed in that period.
-- Hint: GROUP BY YEAR(OrderDate), MONTH(OrderDate).


-- JOINS (31-40)
-- ============================================

-- 31. Show the category for each product.
-- Problem: For every product, display its name and the name of its category.
-- Hint: Use INNER JOIN between Product and ProductCategory.

-- 32. Show sales order details along with customer info.
-- Problem: For each sales order, display the order ID, customer first and last name, order date, and total due.
-- Hint: INNER JOIN SalesOrderHeader and Customer.

-- 33. List products included in each order.
-- Problem: For every sales order, show the products included, their quantities, unit prices, and line totals.
-- Hint: INNER JOIN SalesOrderDetail and Product.

-- 34. Show addresses for each customer.
-- Problem: For every customer, list their address details including street, city, state, and postal code.
-- Hint: INNER JOIN Customer, CustomerAddress, and Address.

-- 35. Show the parent category for each product.
-- Problem: For every product, display its category and the parent category (if any).
-- Hint: INNER JOIN Product and ProductCategory, LEFT JOIN for parent.

-- 36. Show complete order details including customer and product info.
-- Problem: For each order, display the order ID, customer name, product name, quantity, unit price, and line total.
-- Hint: Multiple INNER JOINs between SalesOrderHeader, Customer, SalesOrderDetail, and Product.

-- 37. List products that have never been ordered.
-- Problem: Find all products that do not appear in any sales order detail.
-- Hint: LEFT JOIN Product and SalesOrderDetail, filter for NULLs.

-- 38. Show total spending for each customer.
-- Problem: For every customer, sum up the TotalDue for all their orders.
-- Hint: INNER JOIN Customer and SalesOrderHeader, GROUP BY customer.

-- 39. Show descriptions for each product model.
-- Problem: For every product model, display its name and the English description.
-- Hint: INNER JOIN ProductModel, ProductModelProductDescription, and ProductDescription, filter for Culture = 'en'.

-- 40. Show shipping addresses for each sales order.
-- Problem: For every sales order, display the shipping address details.
-- Hint: INNER JOIN SalesOrderHeader and Address using ShipToAddressID.


-- GROUP BY & HAVING (41-50)
-- ============================================

-- 41. List categories with more than 10 products.
-- Problem: For each product category, count the number of products and show only those with more than 10.
-- Hint: GROUP BY category, HAVING COUNT(*) > 10.

-- 42. List customers who have spent more than $10,000.
-- Problem: For each customer, sum their total purchases and show only those who spent over $10,000.
-- Hint: GROUP BY customer, HAVING SUM(TotalDue) > 10000.

-- 43. List products sold more than 100 times.
-- Problem: For each product, sum the quantity sold and show only those with more than 100 units sold.
-- Hint: GROUP BY product, HAVING SUM(OrderQty) > 100.

-- 44. List colors with an average product price over $500.
-- Problem: For each color, calculate the average ListPrice and show only those with an average above $500.
-- Hint: GROUP BY Color, HAVING AVG(ListPrice) > 500, filter out NULLs.

-- 45. List years where sales exceeded $1 million.
-- Problem: For each year, sum the TotalDue and show only years with sales over $1,000,000.
-- Hint: GROUP BY YEAR(OrderDate), HAVING SUM(TotalDue) > 1000000.

-- 46. List customers who placed more than 3 orders.
-- Problem: For each customer, count their orders and show only those with more than 3.
-- Hint: GROUP BY CustomerID, HAVING COUNT(*) > 3.

-- 47. List products with an average order quantity greater than 5.
-- Problem: For each product, calculate the average quantity per order and show only those with an average above 5.
-- Hint: GROUP BY product, HAVING AVG(OrderQty) > 5.

-- 48. List cities with more than 5 customers.
-- Problem: For each city, count the number of unique customers and show only those with more than 5.
-- Hint: GROUP BY city, HAVING COUNT(DISTINCT CustomerID) > 5.

-- 49. List product categories with over $50,000 in sales.
-- Problem: For each product category, sum the sales (LineTotal) and show only those with totals above $50,000.
-- Hint: GROUP BY category, HAVING SUM(LineTotal) > 50000.

-- 50. List months with more than 50 orders placed.
-- Problem: For each year and month, count the number of orders and show only those with more than 50.
-- Hint: GROUP BY year and month, HAVING COUNT(*) > 50.


-- SUBQUERIES (51-60)
-- ============================================

-- 51. Which products are priced above the average?
-- Problem: List all products whose ListPrice is greater than the average ListPrice of all products.
-- Hint: Use a subquery to get the average price and compare.

-- 52. Which customers placed orders in 2008?
-- Problem: Find all customers who have placed at least one order in the year 2008.
-- Hint: Use a subquery with SalesOrderHeader and filter by YEAR(OrderDate) = 2008.

-- 53. What is the most expensive product in each category?
-- Problem: For each product category, show the product(s) with the highest ListPrice.
-- Hint: Use a correlated subquery to get the MAX(ListPrice) per category.

-- 54. Which customers have spent more than the average customer?
-- Problem: List customers whose total purchases exceed the average total purchases of all customers.
-- Hint: Use HAVING with a subquery that calculates the average total per customer.

-- 55. Which products have never been ordered?
-- Problem: Find all products that do not appear in any sales order detail.
-- Hint: Use NOT IN with a subquery on SalesOrderDetail.

-- 56. Which orders are larger than the average order value?
-- Problem: List all sales orders where TotalDue is greater than the average TotalDue of all orders.
-- Hint: Use a subquery to get the average TotalDue.

-- 57. Who are our top 5 customers by total purchases?
-- Problem: Show the top 5 customers who have spent the most in total purchases.
-- Hint: Use TOP 5 and ORDER BY total purchases (use a subquery for SUM).

-- 58. Which products are in the most expensive category?
-- Problem: List all products that belong to the category with the highest average ListPrice.
-- Hint: Use a subquery to find the ProductCategoryID with the highest average ListPrice.

-- 59. Which customers live in the top 3 cities by customer count?
-- Problem: Find customers who live in the three cities with the most customers.
-- Hint: Use a subquery to get the top 3 cities by customer count, then filter customers by those cities.

-- 60. Which products are priced higher than their category's average?
-- Problem: List products whose ListPrice is greater than the average ListPrice for their category.
-- Hint: Use a correlated subquery to get the average price per category.


-- DATE & TIME FUNCTIONS (61-70)
-- ============================================

-- 61. On which days of the week do we get the most orders?
-- Problem: For each day of the week, count the number of orders placed.
-- Hint: Use DATENAME(WEEKDAY, OrderDate) and GROUP BY.

-- 62. What orders were placed in the last 30 days?
-- Problem: List all sales orders placed in the last 30 days from the most recent order date.
-- Hint: Use DATEADD and MAX(OrderDate) in WHERE.

-- 63. How old are our products (in days since they were first sold)?
-- Problem: For each product, show how many days have passed since SellStartDate.
-- Hint: Use DATEDIFF(DAY, SellStartDate, GETDATE()).

-- 64. How many orders were placed in each quarter?
-- Problem: For each year and quarter, count the number of orders.
-- Hint: Use YEAR(OrderDate), DATEPART(QUARTER, OrderDate), GROUP BY.

-- 65. Which products were introduced in 2005?
-- Problem: List all products whose SellStartDate is in 2005.
-- Hint: Use YEAR(SellStartDate) = 2005.

-- 66. How long does it take to ship an order?
-- Problem: For each shipped order, show the number of days between OrderDate and ShipDate.
-- Hint: Use DATEDIFF(DAY, OrderDate, ShipDate) and filter ShipDate IS NOT NULL.

-- 67. What are the monthly sales and order counts?
-- Problem: For each month, show the number of orders and total sales.
-- Hint: Use FORMAT(OrderDate, 'yyyy-MM'), GROUP BY, and aggregate functions.

-- 68. Which products are currently active (available for sale)?
-- Problem: List products where SellStartDate is in the past and SellEndDate is null or in the future.
-- Hint: Use SellStartDate <= GETDATE() and (SellEndDate IS NULL OR SellEndDate >= GETDATE()).

-- 69. When did each customer place their first and last order?
-- Problem: For each customer, show the earliest and latest order dates.
-- Hint: Use MIN(OrderDate) and MAX(OrderDate), GROUP BY CustomerID.

-- 70. Which products were discontinued in 2006?
-- Problem: List all products whose SellEndDate is in 2006.
-- Hint: Use YEAR(SellEndDate) = 2006.


-- STRING FUNCTIONS (71-80)
-- ============================================

-- 71. What is the full name of each customer?
-- Problem: For each customer, display their full name by combining FirstName and LastName.
-- Hint: Use string concatenation.

-- 72. What is the email domain for each customer?
-- Problem: Extract the domain part of each customer's email address.
-- Hint: Use SUBSTRING and CHARINDEX to get the part after '@'.

-- 73. What are the product names in uppercase?
-- Problem: Show all product names in uppercase letters.
-- Hint: Use UPPER(Name).

-- 74. Which products have names longer than 20 characters?
-- Problem: List products whose name length is greater than 20 characters.
-- Hint: Use LEN(Name) > 20.

-- 75. What do product numbers look like without spaces?
-- Problem: Show product numbers with all spaces removed.
-- Hint: Use REPLACE(ProductNumber, ' ', '').

-- 76. What are the first 3 letters of each product name?
-- Problem: For each product, show the first three letters of its name.
-- Hint: Use LEFT(Name, 3).

-- 77. What do customer phone numbers look like without formatting?
-- Problem: Remove formatting characters from customer phone numbers.
-- Hint: Use nested REPLACE to remove '(', ')', and '-'.

-- 78. What are the initials of each customer?
-- Problem: Show the initials (first letter of first and last name) for each customer.
-- Hint: Use LEFT(FirstName, 1) + LEFT(LastName, 1).

-- 79. What do product names look like when reversed?
-- Problem: Show each product name reversed.
-- Hint: Use REVERSE(Name).

-- 80. Which products have "Bike" in their name?
-- Problem: List all products whose name contains the word "Bike".
-- Hint: Use CHARINDEX('Bike', Name) > 0.


-- RANKING & WINDOW FUNCTIONS (81-90)
-- ============================================

-- 81. How do products rank by price?
-- Problem: Assign a rank to each product based on its ListPrice, highest first.
-- Hint: Use RANK() OVER (ORDER BY ListPrice DESC).

-- 82. What is the row number for each customer (alphabetically)?
-- Problem: Assign a sequential row number to each customer, ordered by last and first name.
-- Hint: Use ROW_NUMBER() OVER (ORDER BY LastName, FirstName).

-- 83. How do products rank by price within their category?
-- Problem: For each product, show its rank by price within its category.
-- Hint: Use DENSE_RANK() OVER (PARTITION BY ProductCategoryID ORDER BY ListPrice DESC).

-- 84. What is the running total of sales over time?
-- Problem: Show the cumulative sum of TotalDue for all orders, ordered by date.
-- Hint: Use SUM(TotalDue) OVER (ORDER BY OrderDate).

-- 85. What were the previous and next order dates for each customer?
-- Problem: For each order, show the previous and next order dates for the same customer.
-- Hint: Use LAG and LEAD window functions partitioned by CustomerID.

-- 86. What is the percentile rank of each product by price?
-- Problem: Show the percentile rank of each product based on ListPrice.
-- Hint: Use PERCENT_RANK() OVER (ORDER BY ListPrice).

-- 87. What are the top 3 most expensive products in each category?
-- Problem: For each category, list the three products with the highest ListPrice.
-- Hint: Use ROW_NUMBER() OVER (PARTITION BY ProductCategoryID ORDER BY ListPrice DESC) and filter RowNum <= 3.

-- 88. How much does each product's price differ from the average?
-- Problem: For each product, show the difference between its ListPrice and the average ListPrice.
-- Hint: Use AVG(ListPrice) OVER () and subtract from ListPrice.

-- 89. What is the moving average of sales over the last 3 orders?
-- Problem: For each order, show the average TotalDue for that order and the two preceding orders.
-- Hint: Use AVG(TotalDue) OVER (ORDER BY OrderDate ROWS BETWEEN 2 PRECEDING AND CURRENT ROW).

-- 90. What is the cumulative distribution of product prices?
-- Problem: Show the cumulative distribution value for each product's ListPrice.
-- Hint: Use CUME_DIST() OVER (ORDER BY ListPrice).


-- ADVANCED & COMPLEX QUERIES (91-100)
-- ============================================

-- 91. What is the RFM (Recency, Frequency, Monetary) summary for each customer?
-- Problem: For each customer, show the number of orders (Frequency), date of last order (Recency), and total spent (Monetary).
-- Hint: Use COUNT, MAX, and SUM grouped by customer.

-- 92. How profitable is each product (revenue, cost, profit)?
-- Problem: For each product, show total quantity sold, revenue, cost, and profit.
-- Hint: Use SUM on OrderQty, LineTotal, and calculate profit as Revenue - Cost.

-- 93. How do customer cohorts (by registration month) behave in terms of orders and revenue?
-- Problem: For each registration month, show number of customers, total orders, and total revenue.
-- Hint: Use FORMAT(ModifiedDate, 'yyyy-MM') for cohort, GROUP BY, and aggregate.

-- 94. What is the sales breakdown by product category hierarchy?
-- Problem: For each parent and child product category, show product count and total sales.
-- Hint: Use LEFT JOINs on ProductCategory and aggregate by parent/child.

-- 95. What is the projected lifetime value for each customer?
-- Problem: For each customer with more than one order, show order count, average order value, total spent, tenure, and average monthly value.
-- Hint: Use COUNT, AVG, SUM, DATEDIFF, and CASE for monthly value.

-- 96. What are the complete details and calculated costs for each sales order?
-- Problem: For each sales order, show customer name, order/ship dates, line item count, total items, subtotal, tax, freight, total due, and additional cost percent.
-- Hint: Use COUNT, SUM, and calculate additional cost percent.

-- 97. Which products are most frequently bought together (cross-sell analysis)?
-- Problem: For each pair of products, count how many times they were bought together in the same order.
-- Hint: Self-join SalesOrderDetail on SalesOrderID, filter ProductID < ProductID, group by product names.

-- 98. How are customers segmented by their total spending?
-- Problem: Segment customers into 'High Value', 'Medium Value', and 'Low Value' based on total spending, and show count and average spending per segment.
-- Hint: Use CASE in a subquery, then GROUP BY segment.

-- 99. What is the inventory turnover ratio for each product?
-- Problem: For each product, show total sold, total revenue, and turnover ratio (revenue divided by standard cost).
-- Hint: Use COALESCE for nulls, calculate ratio, and order by ratio descending.

-- 100. Can I get a comprehensive sales dashboard with key metrics?
-- Problem: Show a dashboard with total customers, active products, total orders, total revenue, average order value, top product by revenue, orders and revenue for the current month.
-- Hint: Use scalar subqueries for each metric.

