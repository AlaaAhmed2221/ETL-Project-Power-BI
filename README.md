# ETL-Project-Power-BI
# 🚀 AdventureWorks Sales Data Warehouse

## 📌 Project Overview
An end-to-end modern **Data Warehouse (DWH)** built on the **Medallion Architecture (Bronze, Silver, Gold)** using **SQL Server**. This project focuses on the **Sales Domain** of the AdventureWorks database, transforming raw operational data into a clean, optimized **Star Schema** ready for Business Intelligence and Power BI reporting.

---

## 🏗️ Architecture & Pipeline Flow
---

## 🗄️ Database Layers Structure

### 1. Bronze Layer
* Ingests raw tables directly from the source OLTP database with zero transformations to preserve raw data history.

### 2. Silver Layer
* **Data Cleaning:** Standardized text fields, handled `NULL` values, and cleaned naming conventions.
* **Date Dimension Table (`silver.Dim_Date`):** Generated using a high-performance **Recursive CTE** covering the entire date range of the dataset, providing robust time-series attributes (Day Name, Month Name, Calendar Quarter, Year).
* **ETL Pipeline:** Encapsulated inside a robust stored procedure (`silver.load_silver`) featuring duration logging per table and `TRY...CATCH` error handling.

### 3. Gold Layer (Star Schema)
Designed for high-performance analytical queries and BI consumption:
* **`gold.dim_product`:** Denormalized view linking Products, Subcategories, and Categories.
* **`gold.dim_customer`:** Clean customer dimension containing customer accounts and details.
* **`gold.dim_territory`:** Regional sales territories and performance metrics.
* **`gold.dim_store`:** Store and sales representative mapping.
* **`gold.Dim_Date`:** Calendar dimension linked via integer `DateKey` (`YYYYMMDD`).
* **`gold.fact_sales`:** Core fact table containing sales orders, line items, quantities, unit prices, discounts, line totals, and surrogate foreign keys to all dimensions.

---

## 🔗 Star Schema Relationships

| Fact Table Foreign Key | Dimension Table Primary Key | Relationship |
| :--- | :--- | :--- |
| `fact_sales.Customer_key` | `dim_customer.Customer_key` | Many-to-One |
| `fact_sales.product_key` | `dim_product.product_key` | Many-to-One |
| `fact_sales.Territory_key` | `dim_territory.Territory_key` | Many-to-One |
| `fact_sales.store_key` | `dim_store.store_key` | Many-to-One |
| `fact_sales.OrderDateKey` | `Dim_Date.DateKey` | Many-to-One |

---

## 🛠️ Technologies & Tools
* **Database Management System:** Microsoft SQL Server (T-SQL)
* **Design Pattern:** Medallion Architecture & Dimensional Modeling (Star Schema)
* **Version Control:** Git & GitHub

---
