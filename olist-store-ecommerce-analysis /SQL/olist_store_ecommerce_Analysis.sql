-- Olist Store E-Commerce Analysis Project

-- Calculates the total number of unique physical customers in the platform.
SELECT COUNT( DISTINCT customer_unique_id) AS unique_customers
FROM Customers;


-- Identifies the top 5 cities with the highest concentration of customers.
SELECT TOP 5 customer_city, COUNT(*) AS total_customers
FROM Customers
GROUP BY customer_city
ORDER BY total_customers DESC;


-- Computes total revenue by summing product prices and freight shipping values.
SELECT SUM(price + freight_value) AS total_revenue
FROM OrderItems;


-- Breaks down order volumes across different operational statuses.
SELECT order_status, COUNT(order_id) AS total_orders
FROM Orders
GROUP BY order_status;


-- Retrieves the top 10 highest-priced individual item line sales.
SELECT TOP 10 product_id, order_id, price
FROM OrderItems
ORDER BY price DESC;


-- Evaluates total financial volume processed across various payment methods.
SELECT payment_type, SUM(payment_value) AS total_payment
FROM OrderPayments
GROUP BY payment_type;


-- Analyzes shipping costs grouped by the origin state of the sellers.
SELECT s.seller_state, AVG(oi.freight_value) AS avg_freight_value
FROM Sellers s
JOIN OrderItems oi
ON s.seller_id = oi.seller_id
GROUP BY s.seller_state;


-- Filters orders where actual delivery exceeded the estimated delivery date.
SELECT *
FROM Orders
WHERE order_delivered_customer_date > order_estimated_delivery_date;


-- Identifies the top 3 best-performing product categories based on total sales revenue.
SELECT  TOP 3 p.product_category_name, SUM(oi.price) AS total_sales
FROM Products p
JOIN OrderItems oi
ON p.product_id = oi.product_id
GROUP BY p.product_category_name
ORDER BY total_sales DESC;


-- Uses a HAVING clause to find customers who have placed more than 5 orders.
SELECT customer_id, COUNT(order_id) AS order_count
FROM Orders
GROUP BY customer_id
HAVING COUNT(order_id) >5;


-- Aggregates product revenue chronologically by extracting year and month.
SELECT YEAR(o.order_purchase_timestamp) AS year,
MONTH(o.order_purchase_timestamp) AS month,
SUM(oi.price) AS revenue
FROM Orders o
JOIN OrderItems oi
ON  o.order_id = oi.order_id
GROUP BY YEAR(o.order_purchase_timestamp),MONTH(o.order_purchase_timestamp);


-- Ranks customers based on total spending using the RANK() window function.
WITH CustomerSpending AS (
SELECT o.customer_id, SUM(oi.price) AS total_spending
FROM Orders o
JOIN OrderItems oi
ON o.order_id = oi.order_id
GROUP BY o.customer_id )

SELECT customer_id, total_spending,
RANK() OVER( Order BY total_spending DESC) AS spending_rank
FROM CustomerSpending;


-- Calculates cumulative daily revenue using window functions over a CTE.
WITH x AS (SELECT 
CAST(o.order_purchase_timestamp AS DATE) AS order_date,
SUM(oi.price) AS daily_revenue
FROM Orders o
JOIN OrderItems oi ON o.order_id = oi.order_id
GROUP BY CAST(o.order_purchase_timestamp AS DATE)
)

SELECT order_date, daily_revenue,
SUM(daily_revenue) OVER( ORDER BY order_date) AS running_total
FROM x;


-- Uses ROW_NUMBER() and PARTITION BY to find the top-selling product in each category.
WITH ProductSales AS (
SELECT p.product_id, p.product_category_name, COUNT(*) AS total_quantity_sold
FROM OrderItems oi
JOIN Products p
ON p.product_id = oi.product_id
GROUP BY p.product_id,p.product_category_name
),
RankedProducts AS (
SELECT product_id, product_category_name,total_quantity_sold,
ROW_NUMBER() OVER( PARTITION BY product_category_name ORDER BY total_quantity_sold DESC) AS rn
FROM ProductSales
)

SELECT product_id, product_category_name,total_quantity_sold,rn
FROM RANKEDProducts
WHERE rn =1;


-- Encapsulates business logic into a reusable, parameterized stored procedure.
GO
CREATE PROCEDURE GetCustomerOrdersAndPayments
@customer_id VARCHAR(255)
AS
BEGIN
SELECT o.order_id, o.order_status, o.order_purchase_timestamp,
SUM(p.payment_value) AS total_payment
FROM Orders o
LEFT JOIN OrderPayments p ON o.order_id = p.order_id
WHERE o.customer_id = @customer_id
GROUP BY o.order_id, o.order_status, o.order_purchase_timestamp;
END;
GO

EXEC GetCustomerOrdersAndPayments @customer_id = '9ef43ebed62efa12948e8229a195c46b';