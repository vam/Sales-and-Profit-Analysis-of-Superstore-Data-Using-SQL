-- 📦 PREPROCESSING SECTION -----------------------------------------

-- 1. Check for NULL values in each column
SELECT
    SUM(CASE WHEN RowID IS NULL THEN 1 ELSE 0 END) AS RowID_Null,
    SUM(CASE WHEN OrderID IS NULL THEN 1 ELSE 0 END) AS OrderID_Null,
    SUM(CASE WHEN OrderDate IS NULL THEN 1 ELSE 0 END) AS OrderDate_Null,
    SUM(CASE WHEN ShipDate IS NULL THEN 1 ELSE 0 END) AS ShipDate_Null,
    SUM(CASE WHEN ShipMode IS NULL THEN 1 ELSE 0 END) AS ShipMode_Null,
    SUM(CASE WHEN CustomerID IS NULL THEN 1 ELSE 0 END) AS CustomerID_Null,
    SUM(CASE WHEN CustomerName IS NULL THEN 1 ELSE 0 END) AS CustomerName_Null,
    SUM(CASE WHEN Segment IS NULL THEN 1 ELSE 0 END) AS Segment_Null,
    SUM(CASE WHEN City IS NULL THEN 1 ELSE 0 END) AS City_Null,
    SUM(CASE WHEN State IS NULL THEN 1 ELSE 0 END) AS State_Null,
    SUM(CASE WHEN Country IS NULL THEN 1 ELSE 0 END) AS Country_Null,
    SUM(CASE WHEN Region IS NULL THEN 1 ELSE 0 END) AS Region_Null,
    SUM(CASE WHEN ProductID IS NULL THEN 1 ELSE 0 END) AS ProductID_Null,
    SUM(CASE WHEN Category IS NULL THEN 1 ELSE 0 END) AS Category_Null,
    SUM(CASE WHEN SubCategory IS NULL THEN 1 ELSE 0 END) AS SubCategory_Null,
    SUM(CASE WHEN ProductName IS NULL THEN 1 ELSE 0 END) AS ProductName_Null,
    SUM(CASE WHEN Sales IS NULL THEN 1 ELSE 0 END) AS Sales_Null,
    SUM(CASE WHEN Quantity IS NULL THEN 1 ELSE 0 END) AS Quantity_Null,
    SUM(CASE WHEN Discount IS NULL THEN 1 ELSE 0 END) AS Discount_Null,
    SUM(CASE WHEN Profit IS NULL THEN 1 ELSE 0 END) AS Profit_Null
FROM Ordersupdated;

-- 2. Check for empty strings or invalid region values
SELECT 
  SUM(CASE WHEN TRIM(Region) = '' THEN 1 ELSE 0 END) AS Empty_Region,
  SUM(CASE WHEN Region = '0' THEN 1 ELSE 0 END) AS Invalid_Region,
  SUM(CASE WHEN TRIM(CustomerName) = '' THEN 1 ELSE 0 END) AS Empty_CustomerName
FROM Ordersupdated;

-- 3. View rows with bad region
SELECT RowID, Region
FROM Ordersupdated
WHERE Region IS NULL OR TRIM(Region) = '' OR Region = '0';

-- 4. Remove rows with bad region
DELETE FROM Ordersupdated
WHERE Region IS NULL OR TRIM(Region) = '' OR Region = '0';

-- 5. Remove duplicate rows based on OrderID and ProductID
DELETE FROM Ordersupdated
WHERE RowID NOT IN (
  SELECT MIN(RowID)
  FROM Ordersupdated
  GROUP BY OrderID, ProductID
);

-- 🧠 ANALYSIS SECTION -----------------------------------------

-- 6. Total sales by region
SELECT Region, ROUND(SUM(Sales), 2) AS TotalSales
FROM Ordersupdated
GROUP BY Region
ORDER BY TotalSales DESC;

-- 7. Top 10 customers by sales
SELECT CustomerName, ROUND(SUM(Sales), 2) AS TotalSales
FROM Ordersupdated
GROUP BY CustomerName
ORDER BY TotalSales DESC
LIMIT 10;

-- 8. Most profitable products
SELECT ProductName, ROUND(SUM(Profit), 2) AS TotalProfit
FROM Ordersupdated
GROUP BY ProductName
ORDER BY TotalProfit DESC
LIMIT 10;

-- 9. Top-selling products by quantity
SELECT ProductName, SUM(Quantity) AS TotalQuantity
FROM Ordersupdated
GROUP BY ProductName
ORDER BY TotalQuantity DESC
LIMIT 10;

-- 10. Orders with discount but negative profit
SELECT OrderID, ProductName, Sales, Discount, Profit
FROM Ordersupdated
WHERE Discount > 0 AND Profit < 0
ORDER BY Profit ASC limit 5;

-- 11. Average discount by category
SELECT Category, ROUND(AVG(Discount), 2) AS AvgDiscount
FROM Ordersupdated
GROUP BY Category
ORDER BY AvgDiscount DESC;

-- 12. Total profit by customer segment
SELECT Segment, ROUND(SUM(Profit), 2) AS TotalProfit
FROM Ordersupdated
GROUP BY Segment
ORDER BY TotalProfit DESC;

-- 13. Profitability by sub-category
SELECT SubCategory, ROUND(SUM(Profit), 2) AS TotalProfit
FROM Ordersupdated
GROUP BY SubCategory
ORDER BY TotalProfit DESC;

-- 14. Sales vs Profit by state
SELECT State, ROUND(SUM(Sales), 2) AS TotalSales, ROUND(SUM(Profit), 2) AS TotalProfit
FROM Ordersupdated
GROUP BY State
ORDER BY TotalSales DESC limit 5;