<div align="center">

# 📦 Olist E-Commerce Analytics & T-SQL Pipeline
*Exploring 100,000+ real-world Brazilian marketplace orders using MS SQL Server.*

<img src="https://miro.medium.com/0*A4BVgM4TzQPa0nHe" alt="Olist Logo" width="280"/>

<p>
  <img src="https://img.shields.io/badge/Platform-MS%20SQL%20Server-red?style=for-the-badge&logo=microsoft-sql-server" />
  <img src="https://img.shields.io/badge/Language-T--SQL-blue?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Status-Completed-success?style=for-the-badge" />
</p>

</div>

---

## 🚀 About the Project
Olist is a major Brazilian e-commerce platform that connects small local merchants with online buyers under a single roof. Managing thousands of transactions, shipping logs, customer profiles, and product details across multiple tables can get messy very quickly. 

For this project, I built a complete **15-query T-SQL analytical workflow** in MS SQL Server to turn raw transactional logs into clear, actionable business insights. Think of it like an assembly line: we start by looking at basic customer counts and revenue, move into handling logistics and shipping delays, apply advanced window math, and finish by building an automated tool for customer support.

---

## 📊 Dataset Details
This project uses the official **Brazilian E-Commerce Public Dataset by Olist**, available on Kaggle. It covers roughly **100,000 orders placed between 2016 and 2018** across various marketplaces in Brazil. 

* **Source / Official Link:** [Kaggle - Brazilian E-Commerce Dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
* **Fun Fact:** The data is fully anonymized, and store partners in the review texts were replaced with *Game of Thrones* great house names!

### Core Tables Used in the Database:
* `olist_customers_dataset.csv` — Customer geographic info and unique IDs.
* `olist_orders_dataset.csv` — Order lifecycles, statuses, and purchase/delivery timestamps.
* `olist_order_items_dataset.csv` — Individual item line prices and freight shipping costs.
* `olist_order_payments_dataset.csv` — Payment methods (credit cards, boletos, vouchers) and transaction amounts.
* `olist_products_dataset.csv` — Product catalog data and categories.
* `olist_sellers_dataset.csv` — Merchant origin city and state locations.
* `product_category_name_translation.csv` — Portuguese-to-English translations for categories.

---

## 🛠️ How the SQL Script Flows (Step-by-Step)

Here is a quick look at what the 15 queries actually accomplish, broken down by how the analysis progresses:

1. **Foundational Exploration (Queries 1–6):** 
   * Counted unique physical customers (`COUNT DISTINCT`) to find our true user base size.
   * Mapped the top 5 customer cities to see where demand is highest.
   * Calculated total gross revenue (combining item prices and freight charges) and checked customer payment method preferences.

2. **Supply Chain & Behavior (Queries 7–10):**
   * Analyzed average freight shipping costs grouped by seller state to spot distance bottlenecks.
   * Filtered out orders where actual delivery dates missed the promised estimate to protect customer trust.
   * Isolated top product categories by sales and identified high-frequency repeat buyers using `HAVING` clauses.

3. **Advanced T-SQL & Window Functions (Queries 11–14):**
   * Tracked chronological monthly revenue trends to spot seasonal sales spikes.
   * Used Common Table Expressions (CTEs) paired with `RANK()` to build a customer spending leaderboard.
   * Calculated running daily revenue totals and used `ROW_NUMBER() OVER (PARTITION BY ...)` to solve the classic challenge of finding the best-selling item in every single product category.

4. **Database Automation (Query 15):**
   * Wrapped complex multi-table join logic into a reusable, parameterized **Stored Procedure** (`GetCustomerOrdersAndPayments`). Now, customer support teams can pull a specific customer's complete order and payment history instantly using a single command.

---

## 🚀 Quick Start Guide
1. Grab the raw CSV files from the [Kaggle Dataset Link](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce).
2. Import the tables into your local **MS SQL Server** database via SQL Server Management Studio (SSMS).
3. Open up `sql/olist_complete_queries.sql` and run the queries to explore the findings yourself!

---
<div align="center">
  <sub>Thanks for checking out the project! Feel free to explore the <code>sql/</code> folder for the complete source code.</sub>
</div>
