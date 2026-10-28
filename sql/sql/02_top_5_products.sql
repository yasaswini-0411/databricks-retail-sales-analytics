SELECT
    Product_ID,
    SUM(Sales_Amount) AS total_sales,
    SUM(Quantity_Sold) AS total_quantity_sold
FROM innomatics.retail_sales.sales_data
GROUP BY Product_ID
ORDER BY total_sales DESC
LIMIT 5;
