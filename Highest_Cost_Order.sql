-- https://platform.stratascratch.com/coding/9915-highest-cost-orders
-- Highest Cost Orders
-- Find the customer with the highest daily total order cost between 2019-02-01 to 2019-05-01. 
-- If customer had more than one order on a certain day, sum the order costs on daily basis. 
-- Output their first name, total cost of their items, and the date.
 
--  For simplicity, you can assume that every first name in the dataset is unique.

-- Solution
-- Join customer and order tables
-- Filter for order dates between '2019-02-01' AND '2019-05-01'
-- Group first_name, cust_id, order_date
-- Order by desc limit 1

SELECT
    c.first_name,
    sum(o.total_order_cost) AS total_order_cost,
    o.order_date
FROM customers c
INNER JOIN orders o
ON c.id = o.cust_id
WHERE o.order_date between '2019-02-01' AND '2019-05-01'
GROUP BY first_name, cust_id, order_date
ORDER BY total_order_cost DESC
LIMIT 1