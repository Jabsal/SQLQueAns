
--https://platform.stratascratch.com/coding/9899-percentage-of-total-spend?python= 
-- Percentage Of Total Spend
-- Calculate the percentage of the total spend a customer spent on each order. Output the customer’s first name, order details, and percentage of the order cost to their total spend across all orders. 

-- Assume each customer has a unique first name (i.e., there is only 1 customer named Karen in the dataset) and that customers place at most only 1 order a day.

-- Percentages should be represented as fractions

-- Analyze solution
-- - First join the `customer` table with the `orders` table using an inner join.
-- - You’ll want to find the customer’s total amount of purchases and then divide the cost of each individual order.
    -- - To calculate the total amount across all orders for each customer, use a window function and partition the window by the cust_id of the customer.
-- - For each transaction, take the cost of the order and divide it by the total amount for each customer. 


-- Implementation 
SELECT c.first_name,
       o.order_details,
       o.total_order_cost / sum(o.total_order_cost) OVER (PARTITION BY c.id)::float AS percentage_total_cost
FROM orders o
JOIN customers c ON c.id = o.cust_id