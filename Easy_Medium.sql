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


-- https://platform.stratascratch.com/coding/9870-highest-salary?python=
-- Highest Salary
SELECT first_name,
        salary
FROM worker
WHERE salary = (SELECT MAX(salary) 
                FROM worker)


-- https://platform.stratascratch.com/coding/9869-find-the-total-salary-of-each-department?python=
-- Total Salary of each department
SELECT department, 
        SUM(salary)
FROM worker
GROUP BY 1;

-- https://platform.stratascratch.com/coding/9868-find-the-five-highest-salaries?python=
-- 5 highest salaries
SELECT DISTINCT salary
FROM worker
ORDER BY salary DESC
LIMIT 5;


-- https://platform.stratascratch.com/coding/9867-find-the-three-lowest-salaries?python=
-- 3 Lowest Salaries
SELECT DISTINCT salary
FROM worker
ORDER BY salary
LIMIT 3;

-- https://platform.stratascratch.com/coding/9864-find-the-last-five-records-of-the-dataset?python=
--Find the last five records of the dataset
SELECT * 
FROM worker
ORDER BY worker_id DESC
LIMIT 5;


-- https://platform.stratascratch.com/coding/9863-find-the-first-record-of-the-dataset-without-using-limit-or-order-by?python=
-- Find the first record of the dataset without using LIMIT or ORDER BY.
SELECT * 
FROM worker
WHERE 
    worker_id =
         (SELECT 
            min(worker_id)
          FROM worker)



-- https://platform.stratascratch.com/coding/9861-find-the-number-of-employees-in-each-department?python=
-- Find the number of employees in each department
-- Find the number of employees in each department.
-- Output the department name along with the corresponding number of employees.
SELECT department, 
        COUNT(*)
FROM worker
GROUP BY department;


--https://platform.stratascratch.com/coding/9860-find-departments-with-less-than-5-employees?python=
--Find departments with less than 5 employees
SELECT department, 
        COUNT(worker_id) 
FROM worker
GROUP BY department
HAVING COUNT(worker_id) < 5;
