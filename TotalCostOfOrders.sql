--https://platform.stratascratch.com/coding/10183-total-cost-of-orders?python=
-- Total Cost Of Orders
-- Find the total cost of each customer's orders. Output customer's id, first name, and the total order cost. Order records by customer's first name alphabetically.

SELECT c.id, c.first_name, sum(o.total_order_cost) as total
FROM customers c
JOIN orders o 
ON c.id = o.cust_id
GROUP BY c.id, c.first_name
ORDER BY c.first_name;