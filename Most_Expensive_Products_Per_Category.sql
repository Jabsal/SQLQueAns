-- https://platform.stratascratch.com/coding/9607-the-most-expensive-products-per-category?python=

-- The Most Expensive Products Per Category
-- Find the most expensive products on Amazon for each product category. Output category and the price (as a number)

WITH ranked_product_category AS
(
SELECT product_category,
        product_name,
        REPLACE(price, '$', '')::float AS price,
        rank() OVER (PARTITION BY product_category ORDER BY REPLACE(price, '$', '')::float DESC) AS rank
FROM innerwear_amazon_com
)

SELECT product_category,
        product_name,
        price
FROM ranked_product_category
WHERE rank = 1