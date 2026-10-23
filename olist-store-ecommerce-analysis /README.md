<div align="center">

# 📦 Olist E-Commerce Analytics & T-SQL Pipeline
*Transforming raw Brazilian marketplace logs into actionable business intelligence using MS SQL Server.*

<img src="https://miro.medium.com/0*A4BVgM4TzQPa0nHe" alt="Olist Logo" width="250"/>

<p>
  <img src="https://img.shields.io/badge/Platform-MS%20SQL%20Server-red?style=for-the-badge&logo=microsoft-sql-server" />
  <img src="https://img.shields.io/badge/Language-T--SQL-blue?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Status-Completed-success?style=for-the-badge" />
</p>

</div>

---

## 🎯 Executive Summary
Olist connects small-to-medium-sized merchants across Brazil to major e-commerce marketplaces. Managing thousands of distributed rows across customers, orders, payments, and shipping logs requires robust data handling. This project implements a **15-query production-grade analytical pipeline** in T-SQL to solve core business problems ranging from customer behavior patterns and logistics delays to advanced revenue window functions and database automation.

---

## 📊 Dataset Information
This project utilizes the official **Brazilian E-Commerce Public Dataset by Olist**, hosted on Kaggle. The dataset contains information on 100,000 orders from 2016 to 2018 made at multiple marketplaces in Brazil. It allows orders to be viewed across multiple dimensions including order status, pricing, payment, freight performance, customer locations, and product attributes.

* **Source / Official Link:** [Kaggle - Brazilian E-Commerce Dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
* **Core Tables Used in Schema:**
  * `olist_customers_dataset.csv` (Customer geographic data and unique IDs)
  * `olist_orders_dataset.csv` (Order lifecycle, statuses, and timestamps)
  * `olist_order_items_dataset.csv` (Individual product line items, prices, and freight shipping values)
  * `olist_order_payments_dataset.csv` (Payment methods and transaction values)
  * `olist_products_dataset.csv` (Product catalog details and categories)
  * `olist_sellers_dataset.csv` (Merchant origin locations)
  * `product_category_name_translation.csv` (English translations for product categories)

---

## 🛠️ Tech Stack & Architecture
* **Database Management System:** MS SQL Server (T-SQL)
* **Environment:** SQL Server Management Studio (SSMS)
* **Core Concepts:** Multi-table Joins, Aggregations, Common Table Expressions (CTEs), Window Functions (`RANK`, `ROW_NUMBER`, Running Totals), and Stored Procedures.

---

## 💡 Key Business Questions & Analytical Insights

> **1. Customer & Geographic Spread**
> * **Unique Customer Reach:** Counted unique physical customers (`COUNT DISTINCT`) to track the true user base size rather than individual order IDs.
> * **City Concentration:** Pinpointed the top 5 city hubs with the highest customer density to guide regional logistics planning and targeted marketing.

> **2. Financial & Payment Behavior**
> * **Gross Revenue:** Computed total revenue combining product prices and freight shipping values to gauge overall marketplace economic scale.
> * **Payment Preferences:** Grouped financial transaction volumes across payment methods (credit cards, boletos, vouchers) to understand customer checkout habits.

> **3. Supply Chain & Logistics Efficiency**
> * **Freight Cost Analysis:** Calculated average freight shipping costs grouped by seller state to uncover distance barriers and geographical disparities.
> * **Delivery Performance:** Filtered orders where actual delivery dates exceeded estimated dates to spot supply chain bottlenecks and protect customer trust.

> **4. Product Category Performance & VIP Segmentation**
> * **Top Revenue Categories:** Identified the top-performing product categories driving the highest total sales.
> * **Repeat Buyer Identification:** Used `HAVING` clauses to isolate high-frequency repeat buyers (>5 orders) for VIP loyalty retention programs.
> * **Monthly Revenue Trends:** Extracted year and month timestamps to map chronological revenue growth and seasonal purchasing spikes.

> **5. Advanced Window Functions & Database Programmability**
> * **Customer Spending Rank:** Combined Common Table Expressions (CTEs) with the `RANK()` window function to tier high-value customers.
> * **Cumulative Revenue:** Built running daily totals using window frames over chronological revenue data.
> * **Best-Selling Products:** Solved the "top item per category" problem using `ROW_NUMBER() OVER (PARTITION BY ...)` to highlight inventory star products.
> * **Stored Procedure Automation:** Engineered a parameterized **Stored Procedure** (`GetCustomerOrdersAndPayments`) to instantly retrieve complete order histories and payment sums for any customer ID using a single command.

---

## 🚀 Quick Start Guide
1. Download the raw CSV files from the [Kaggle Dataset Link](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce).
2. Import the tables into your local **MS SQL Server** database.
3. Open the script located in `sql/olist_complete_queries.sql` using SSMS.
4. Execute queries sequentially or run the stored procedure test block at the bottom.

---
<div align="center">
  <sub>Built with precision and SQL. Feel free to explore the queries!</sub>
</div>
