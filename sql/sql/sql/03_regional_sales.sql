SELECT
    Region,
    SUM(Sales_Amount) AS total_sales,
    SUM(Quantity_Sold) AS total_quantity_sold
FROM innomatics.retail_sales.sales_data
GROUP BY Region
ORDER BY total_sales DESC;
