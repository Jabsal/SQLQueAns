-- https://platform.stratascratch.com/coding/10089-find-the-number-of-customers-without-an-order?python=

-- Find the number of customers without an order
-- Find the number of customers without an order.

SELECT COUNT(*) AS n_customers_without_orders 
FROM customers c
LEFT JOIN orders o
ON c.id = o.cust_id
WHERE o.id is null
;

--https://platform.stratascratch.com/coding/9910-favorite-customer?python=
-- Favorite Customer
-- Find "favorite" customers based on the order count and the total cost of orders.
-- A customer is considered as a favorite if he or she has placed more than 3 orders and with the total cost of orders more than $100.

-- Output the customer's first name, city, number of orders, and total cost of orders.

SELECT first_name,
        city,
        COUNT(*) AS total_cust_order_count,
        SUM(total_order_cost) AS total_cust_order_cost
FROM customers c
JOIN orders o ON c.id = o.cust_id
GROUP BY 1,2
HAVING SUM(o.total_order_cost) > 100 AND  COUNT(*) > 3
;

-- https://platform.stratascratch.com/coding/10136-find-workers-with-an-odd-number-for-worker-id?python=
-- Find workers with an odd number for worker id
-- Find workers and their corresponding information from the table with an odd number for their worker id.

-- - Use the MOD() or %

SELECT * 
FROM worker 
WHERE worker_id % 2 = 1;