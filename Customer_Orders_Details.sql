-- Customer Orders and Details
-- Find the number of orders, the number of customers, and the total cost of orders for each city. Only include cities that have made at least 5 orders and count all customers in each city even if they did not place an order.

-- Output each calculation along with the corresponding city name.

-- Analyze Solution
-- - Use the COUNT() function to find the number of orders and customers.
-- - Use the SUM() function to find the total cost of orders.
-- - Use LEFT JOIN on customer id to combine records of both tables.
-- - Group records by the city.
-- - Use the HAVING clause to set conditions to find desired records.

-- Implementation
SELECT city, 
        COUNT(o.id) AS order_count, 
        COUNT(DISTINCT c.id) AS customers, 
        SUM(total_order_cost) AS total_cost
FROM customers c
LEFT JOIN orders o
ON c.id = o.cust_id
GROUP BY 1
HAVING COUNT(o.id) >= 5