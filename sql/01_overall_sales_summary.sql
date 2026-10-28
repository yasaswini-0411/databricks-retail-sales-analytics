SELECT
    SUM(Sales_Amount) AS total_sales,
    SUM(Quantity_Sold) AS total_quantity_sold,
    COUNT(*) AS total_records,
    COUNT(DISTINCT Product_ID) AS distinct_products
FROM innomatics.retail_sales.sales_data;
