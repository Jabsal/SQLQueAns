-- Customer Details
-- Find the details of each customer regardless of whether the customer made an order. Output the customer's first name, last name, and the city along with the order details.
-- You may have duplicate rows in your results due to a customer ordering several of the same items. Sort records based on the customer's first name and the order details in ascending order.

-- Solution
-- Left join the customer and order table

SELECT c.first_name,
        c.last_name,
        c.city,
        o.order_details
FROM customers c
LEFT JOIN orders o
ON c.id = o.cust_id
ORDER BY c.first_name ASC,
        order_details ASC