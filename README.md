# Databricks Retail Sales Analytics

### From Unity Catalog to Business Insights with SQL, Genie & AI/BI Dashboards

## Project Overview

This project focuses on analyzing retail sales data using Databricks. The goal is to transform a retail dataset into meaningful business insights through SQL analysis, natural-language querying, and interactive dashboard visualizations.

The project demonstrates how data organization, SQL-based analytics, Databricks Genie, and AI/BI Dashboards can be combined in a practical retail analytics workflow.

## Objectives

- Organize and access retail data using Unity Catalog.
- Analyze sales performance using Databricks SQL.
- Identify top-performing products and regions.
- Explore monthly sales trends.
- Calculate product category contributions to total sales.
- Ask business questions using Databricks Genie and validate its answers against SQL.
- Build an interactive AI/BI Dashboard with KPIs, charts, and filters.

## Tools and Technologies

- **Databricks:** Data analysis and dashboard development
- **Unity Catalog:** Data organization and governance
- **Databricks SQL:** Data aggregation and business analysis
- **Databricks Genie:** Natural-language data exploration
- **AI/BI Dashboards:** KPI visualization and interactive reporting
- **GitHub:** Project documentation and version control

## Dataset Description

The project uses a retail sales dataset containing **1,000 records and 13 columns**.

The table contains information about products, sales dates, sales representatives, regions, sales amounts, quantities, costs, prices, customer types, discounts, payment methods, and sales channels.

### Dataset Columns

| Column | Description |
|---|---|
| `Product_ID` | Identifier for a product |
| `Sale_Date` | Date of the sale |
| `Sales_Rep` | Sales representative associated with the record |
| `Region` | Geographical sales region |
| `Sales_Amount` | Sales amount recorded |
| `Quantity_Sold` | Quantity sold |
| `Product_Category` | Product category |
| `Unit_Cost` | Cost per unit |
| `Unit_Price` | Selling price per unit |
| `Customer_Type` | Type of customer |
| `Discount` | Discount information |
| `Payment_Method` | Method of payment |
| `Sales_Channel` | Channel through which the sale occurred |

## Unity Catalog Setup

The dataset was organized using the following Unity Catalog structure:

- **Catalog:** `innomatics`
- **Schema:** `retail_sales`
- **Table:** `sales_data`

**Fully qualified table name:**

```sql
innomatics.retail_sales.sales_data
```

This structure provides a consistent way to reference the dataset across SQL queries and analytics workflows.

## SQL Analysis

Five SQL analyses were performed to understand different aspects of retail sales.

### 1. Overall Sales Performance

This query calculates total sales, total quantity sold, total records, and the number of distinct products.

```sql
SELECT
    SUM(Sales_Amount) AS total_sales,
    SUM(Quantity_Sold) AS total_quantity_sold,
    COUNT(*) AS total_records,
    COUNT(DISTINCT Product_ID) AS distinct_products
FROM innomatics.retail_sales.sales_data;
```

**Verified results:**

| Metric | Result |
|---|---:|
| Total Sales | 5,019,265.23 |
| Total Quantity Sold | 25,355 |
| Total Records | 1,000 |
| Distinct Products | 100 |

### 2. Top 5 Products by Sales

This query identifies the five products with the highest total sales.

```sql
SELECT
    Product_ID,
    SUM(Sales_Amount) AS total_sales,
    SUM(Quantity_Sold) AS total_quantity_sold
FROM innomatics.retail_sales.sales_data
GROUP BY Product_ID
ORDER BY total_sales DESC
LIMIT 5;
```

**Verified finding:** Product ID **1099** ranked first, generating total sales of **101,773.87**.

### 3. Sales by Region

This query compares total sales and quantity sold across regions.

```sql
SELECT
    Region,
    SUM(Sales_Amount) AS total_sales,
    SUM(Quantity_Sold) AS total_quantity_sold
FROM innomatics.retail_sales.sales_data
GROUP BY Region
ORDER BY total_sales DESC;
```

**Verified finding:** The **North** region recorded the highest total sales of **1,369,612.51**.

### 4. Monthly Sales Trend

This query groups sales by month to examine changes in sales performance over time.

```sql
SELECT
    DATE_FORMAT(Sale_Date, 'yyyy-MM') AS sales_month,
    SUM(Sales_Amount) AS total_sales,
    SUM(Quantity_Sold) AS total_quantity_sold
FROM innomatics.retail_sales.sales_data
GROUP BY DATE_FORMAT(Sale_Date, 'yyyy-MM')
ORDER BY sales_month ASC;
```

**Verified finding:** **January 2023** recorded the highest monthly sales, totaling **476,092.36**.

### 5. Sales Contribution by Product Category

This query calculates the total sales and percentage contribution of each product category.

```sql
SELECT
    Product_Category,
    SUM(Sales_Amount) AS total_sales,
    ROUND(
        SUM(Sales_Amount) * 100.0 /
        SUM(SUM(Sales_Amount)) OVER (),
        2
    ) AS sales_percentage
FROM innomatics.retail_sales.sales_data
GROUP BY Product_Category
ORDER BY total_sales DESC;
```

**Verified finding:** The **Clothing** category recorded the highest total sales of **1,313,474.36**.

The category's percentage contribution can be read from the `sales_percentage` column in the query output.

## Business Question Analysis with Databricks Genie

Databricks Genie was connected to the retail sales table to explore business questions using natural language.

The following questions were investigated:

1. Which are the top 5 products by total sales amount?
2. Which region has the highest total sales, and how much did it generate?
3. Which month had the highest total sales, and how did sales change month by month?

The answers were compared with the corresponding manually written SQL queries. The results were confirmed to match the SQL analyses.

This exercise demonstrated how natural-language querying can complement SQL-based analysis while allowing answers to be validated.

## AI/BI Dashboard

An interactive Databricks AI/BI Dashboard was created to present the analysis visually.

### Key Performance Indicators

- Total Sales
- Total Quantity Sold
- Distinct Products
- Total Records

### Visualizations

- Sales by Region
- Top 5 Products by Sales
- Monthly Sales Trend
- Sales by Product Category

### Interactive Filters

- Region
- Product Category

Both filters were tested and confirmed to work as expected.

The dashboard brings the key metrics and visual analyses together, making the results easier to explore and compare.

## Key Learnings

Through this project, I gained practical experience in:

- Organizing data with Unity Catalog.
- Writing SQL queries using aggregations, grouping, sorting, date formatting, and window functions.
- Identifying business patterns in product, regional, monthly, and category-level sales.
- Exploring data with Databricks Genie and validating its answers against SQL.
- Building KPI counters, charts, and interactive filters in AI/BI Dashboards.
- Presenting analytical results in a structured and understandable way.

## Conclusion

This project provided hands-on experience in building a retail sales analytics solution using Databricks. It connected data organization, SQL analysis, natural-language querying, and dashboard development into a single workflow.

The project helped strengthen my understanding of how data analytics tools can transform retail sales records into insights that support business exploration and decision-making.

## Project Evidence

Screenshots of the Unity Catalog table, SQL query outputs, Genie responses, and AI/BI Dashboard can be added to this repository to document the implementation and results.

## Acknowledgements

This project was completed as part of a hands-on learning assignment associated with **Innomatics Research Labs**.

## Topics

`Databricks` `Data Engineering` `Data Analytics` `SQL` `Unity Catalog` `Databricks Genie` `AI/BI Dashboard` `Retail Analytics`

