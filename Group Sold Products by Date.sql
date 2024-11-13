-- Group Sold Products by Date: Problem Statement


CREATE DATABASE sold_products;
USE sold_products;

-- Creating table and inserting data:

CREATE TABLE activities(
    sell_date DATE,
    product VARCHAR(20)
);

INSERT INTO activities(sell_date, product) 
VALUES('2020-05-30', 'Apples'),
    ('2020-06-01', 'Milk'),
    ('2020-06-02', 'Bread'),
    ('2020-05-30', 'Bananas'),
    ('2020-06-01', 'Cereal'),
    ('2020-06-02', 'Bread'),
    ('2020-05-30', 'Oranges');

-- to group sold products by date using SQL

    SELECT
    sell_date,
    COUNT(*) AS total_objects,
    GROUP_CONCAT(DISTINCT product ORDER BY product ASC) AS products
    FROM 
    activities
    GROUP BY
    sell_date
    ORDER BY
    sell_date