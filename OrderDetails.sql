--https://platform.stratascratch.com/coding/9913-order-details?python=
-- Order Details
-- Find order details made by Jill and Eva.
-- Consider the Jill and Eva as first names of customers.
-- Output the order date, details and cost along with the first name.
-- Order records based on the customer id in ascending order.

-- Solution
-- Inner join the 2 tables

SELECT a.first_name, 
        b.order_date, 
        b.order_details, 
        b.total_order_cost
FROM customers a
INNER JOIN orders b on a.id = b.cust_id
WHERE a.first_name IN ('Jill','Eva')
ORDER BY a.id ASC