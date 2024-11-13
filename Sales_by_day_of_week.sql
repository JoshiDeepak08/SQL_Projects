-- Sales by Day of the Week using SQL:

-- Our task is to create a report that provides information about the total sales for each day of the week based on the sales data.

CREATE DATABASE sales_problem;
USE sales_problem;

-- Making tables and inserting Data:

CREATE TABLE sales_data(
    transaction_id INT PRIMARY KEY,
    purchase_date DATE,
    amount DECIMAL (10,2)
);

INSERT INTO sales_data(transaction_id, purchase_date,amount)
VALUES(1, '2023-08-14', 50.00),
    (2, '2023-08-15', 75.00),
    (3, '2023-08-15', 60.00),
    (4, '2023-08-16', 45.00),
    (5, '2023-08-16', 55.00),
    (6, '2023-08-17', 90.00),
    (7, '2023-08-17', 70.00),
    (8, '2023-08-17', 120.00),
    (9, '2023-08-18', 65.00),
    (10, '2023-08-18', 85.00);


-- printing the data of table:
    SELECT * FROM sales_data;


-- to create a report of the sales by day of the week using SQL
SELECT 
DAYNAME(purchase_date) AS day_of_week,
SUM(amount) AS total_sales
FROM sales_data
GROUP BY 
DAYOFWEEK(purchase_date), DAYNAME(purchase_date)
ORDER BY
DAYOFWEEK(purchase_date);