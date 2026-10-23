<div align="center">

  <img src="https://miro.medium.com/0*A4BVgM4TzQPa0nHe" alt="Olist Logo" width="320" style="border-radius: 12px; box-shadow: 0px 4px 20px rgba(0,0,0,0.3);"/>

  <h1>📦 Olist E-Commerce Analytics & T-SQL Pipeline</h1>
  <p><em>Transforming 100,000+ raw Brazilian marketplace logs into production-grade business intelligence using MS SQL Server.</em></p>

  <p>
    <img src="https://img.shields.io/badge/Platform-MS%20SQL%20Server-red?style=for-the-badge&logo=microsoft-sql-server&logoColor=white" />
    <img src="https://img.shields.io/badge/Language-T--SQL-blue?style=for-the-badge&logo=databricks&logoColor=white" />
    <img src="https://img.shields.io/badge/Dataset-Kaggle-orange?style=for-the-badge&logo=kaggle&logoColor=white" />
    <img src="https://img.shields.io/badge/Status-Production%20Ready-success?style=for-the-badge" />
  </p>

</div>

---

## 🎯 1. Business Context & Executive Summary
Olist connects small-to-medium-sized merchants across Brazil to major e-commerce storefronts under a single contract. Managing thousands of transactions, shipping logs, customer profiles, and product details across multiple relational tables can get overwhelming very quickly. 

For this project, I built a complete **15-query T-SQL analytical workflow** in MS SQL Server to turn raw transactional logs into clear, actionable business insights. Think of it like a data factory assembly line: we start by looking at basic customer counts and revenue, move into handling logistics and shipping delays, apply advanced window math, and finish by building an automated tool for customer support.

---

## 📊 2. Dataset Architecture & Source Details
This project utilizes the official **Brazilian E-Commerce Public Dataset by Olist**, hosted on Kaggle[cite: 1]. It features information on **100,000 orders from 2016 to 2018** made at multiple marketplaces in Brazil[cite: 1]. 

* **🔗 Official Source:** [Kaggle - Brazilian E-Commerce Dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)[cite: 1]
* **🕵️‍♂️ Fun Fact:** The data is real commercial data that has been anonymized, and references to companies and partners in the review texts were replaced with the names of *Game of Thrones* great houses[cite: 1]!

<details>
<summary><b>📂 Click to view the Core Relational Tables Schema</b></summary>

| File Name | Description & Primary Dimensions |
| : করুণ | :--- |
| `olist_customers_dataset.csv` | Customer geographic data and unique identifiers[cite: 1]. |
| `olist_orders_dataset.csv` | Order lifecycles, operational statuses, and timestamps[cite: 1]. |
| `olist_order_items_dataset.csv` | Individual item line prices and freight shipping costs[cite: 1]. |
| `olist_order_payments_dataset.csv` | Payment methods (credit cards, boletos, vouchers) and amounts[cite: 1]. |
| `olist_products_dataset.csv` | Product catalog metadata, categories, and attributes[cite: 1]. |
| `olist_sellers_dataset.csv` | Merchant origin city and state locations[cite: 1]. |
| `product_category_name_translation.csv` | Portuguese-to-English translations for product categories[cite: 1]. |

</details>

---

## 🛠️ 3. How the T-SQL Analytical Pipeline Flows

Here is a breakdown of how the 15 queries progress from raw database setup to advanced automation:

```text
[Raw Tables] ──> [Phase 1: Exploration] ──> [Phase 2: Logistics & Filter] ──> [Phase 3: Window Math & CTEs] ──> [Phase 4: Automation]
