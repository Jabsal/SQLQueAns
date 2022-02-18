WITH rank_customer_orders AS 
(
SELECT cust_id, first_name, total_order_cost,
        rank() OVER (PARTITION BY cust_id ORDER BY total_order_cost ASC) AS rank
FROM customers c
JOIN orders o ON c.ID = o.cust_id
)

SELECT distinct cust_id, first_name, total_order_cost
FROM rank_customer_orders
WHERE rank = 1