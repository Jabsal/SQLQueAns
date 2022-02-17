-- https://platform.stratascratch.com/coding/10089-find-the-number-of-customers-without-an-order?python=

-- Find the number of customers without an order
-- Find the number of customers without an order.

SELECT COUNT(*) AS n_customers_without_orders 
FROM customers c
LEFT JOIN orders o
ON c.id = o.cust_id
WHERE o.id is null
;

