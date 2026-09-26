CREATE DATABASE novamart_sales;
USE novamart_sales;
USE novamart_sales;

CREATE TABLE dim_region (
    Region_ID VARCHAR(10) PRIMARY KEY,
    Region_Name VARCHAR(50)
);

CREATE TABLE dim_customer (
    Customer_ID VARCHAR(10) PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Segment VARCHAR(30),
    City VARCHAR(50),
    Region_ID VARCHAR(10),
    Join_Date DATE
);

CREATE TABLE dim_product (
    Product_ID VARCHAR(10) PRIMARY KEY,
    Product_Name VARCHAR(100),
    Category VARCHAR(50),
    Subcategory VARCHAR(50),
    Unit_Cost DECIMAL(12,2),
    List_Price DECIMAL(12,2)
);

CREATE TABLE dim_sales_rep (
    SalesRep_ID VARCHAR(10) PRIMARY KEY,
    SalesRep_Name VARCHAR(100),
    Manager VARCHAR(100),
    Region_ID VARCHAR(10)
);

CREATE TABLE dim_date (
    `Date` DATE PRIMARY KEY,
    `Year` INT,
    `Month` INT,
    `Month_Name` VARCHAR(20),
    `Quarter` VARCHAR(5),
    `Year_Month` VARCHAR(7)
);
USE novamart_sales;
SHOW TABLES;
CREATE TABLE fact_targets (
month DATE,
Region_ID VARCHAR(10),
SalesRep_ID VARCHAR(10),
Target_Revenue DECIMAL(15,2)
);
CREATE TABLE fact_sales (
    Order_ID VARCHAR(20) PRIMARY KEY,
    Order_Date DATE,
    Customer_ID VARCHAR(10),
    Product_ID VARCHAR(10),
    SalesRep_ID VARCHAR(10),
    Unit_Cost DECIMAL(15,2),
    List_Price DECIMAL(15,2),
    Region_ID VARCHAR(10),
    Quantity INT,
    Discount_Pct DECIMAL(10,6),
    Revenue DECIMAL(15,2),
    Total_Cost DECIMAL(15,2),
    Profit DECIMAL(15,2)
);
SELECT COUNT(*) FROM fact_sales;
SELECT COUNT(*) FROM dim_customer;
SELECT COUNT(*) FROM dim_product;
SELECT COUNT(*) FROM dim_sales_rep;
USE novamart_sales;

DESCRIBE dim_region;
SELECT COUNT(*) FROM dim_region;
INSERT INTO dim_region (Region_ID, Region_Name)
VALUES
('R01', 'North'),
('R02', 'South'),
('R03', 'East'),
('R04', 'West');
SELECT * FROM dim_region;
SELECT COUNT(*) FROM dim_sales_rep;
SELECT COUNT(*) FROM dim_date;
SELECT COUNT(*) FROM fact_targets;
SELECT COUNT(*) FROM fact_sales;
SHOW TABLES;
SELECT
SUM(revenue) AS total_revenue
FROM fact_sales;
SELECT
    SUM(Profit) AS Total_Profit
FROM fact_sales;
SELECT
    (SUM(Profit) / SUM(Revenue)) * 100 AS Profit_Margin_Pct
FROM fact_sales;
SELECT
    (SUM(CASE WHEN YEAR(Order_Date) = 2026 THEN Revenue ELSE 0 END)
    -
    SUM(CASE WHEN YEAR(Order_Date) = 2025 THEN Revenue ELSE 0 END))
    /
    SUM(CASE WHEN YEAR(Order_Date) = 2025 THEN Revenue ELSE 0 END) * 100
    AS Revenue_Growth_Pct
FROM fact_sales;
SELECT
    (SUM(s.Monthly_Revenue) / SUM(t.Target_Revenue)) * 100
        AS Target_Achievement_Pct
FROM
(
    SELECT
        DATE_FORMAT(Order_Date, '%Y-%m') AS Sales_Month,
        Region_ID,
        SalesRep_ID,
        SUM(Revenue) AS Monthly_Revenue
    FROM fact_sales
    GROUP BY
        DATE_FORMAT(Order_Date, '%Y-%m'),
        Region_ID,
        SalesRep_ID
) s
JOIN fact_targets t
    ON s.Sales_Month = DATE_FORMAT(t.Month, '%Y-%m')
    AND s.Region_ID = t.Region_ID
    AND s.SalesRep_ID = t.SalesRep_ID;
    SELECT
    r.Region_Name,
    SUM(f.Revenue) AS Total_Revenue,
    SUM(f.Profit) AS Total_Profit,
    (SUM(f.Profit) / SUM(f.Revenue)) * 100 AS Profit_Margin_Pct
FROM fact_sales f
JOIN dim_region r
    ON f.Region_ID = r.Region_ID
GROUP BY r.Region_Name
ORDER BY Total_Revenue DESC;
SELECT
    p.Category,
    SUM(f.Revenue) AS Total_Revenue,
    SUM(f.Profit) AS Total_Profit,
    (SUM(f.Profit) / SUM(f.Revenue)) * 100 AS Profit_Margin_Pct
FROM fact_sales f
JOIN dim_product p
    ON f.Product_ID = p.Product_ID
GROUP BY p.Category
ORDER BY Total_Revenue DESC;
SELECT
    p.Product_Name,
    p.Category,
    SUM(f.Revenue) AS Total_Revenue,
    SUM(f.Profit) AS Total_Profit,
    (SUM(f.Profit) / SUM(f.Revenue)) * 100 AS Profit_Margin_Pct
FROM fact_sales f
JOIN dim_product p
    ON f.Product_ID = p.Product_ID
GROUP BY
    p.Product_Name,
    p.Category
ORDER BY Total_Revenue DESC
LIMIT 10;
SELECT
    c.Segment,
    COUNT(DISTINCT c.Customer_ID) AS Customer_Count,
    SUM(f.Revenue) AS Total_Revenue,
    SUM(f.Profit) AS Total_Profit,
    (SUM(f.Profit) / SUM(f.Revenue)) * 100 AS Profit_Margin_Pct
FROM fact_sales f
JOIN dim_customer c
    ON f.Customer_ID = c.Customer_ID
GROUP BY c.Segment
ORDER BY Total_Revenue DESC;
SELECT
    DATE_FORMAT(Order_Date, '%Y-%m') AS Sales_Month,
    SUM(Revenue) AS Total_Revenue,
    SUM(Profit) AS Total_Profit
FROM fact_sales
GROUP BY DATE_FORMAT(Order_Date, '%Y-%m')
ORDER BY Sales_Month;