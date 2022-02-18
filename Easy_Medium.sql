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


-- https://platform.stratascratch.com/coding/9858-find-employees-in-the-hr-department-and-output-the-result-with-one-duplicate?python=
-- Find employees in the HR department and output the result with one duplicate
-- Find employees in the HR department and output the result with one duplicate.
-- Output the first name and the department of employees.

-- Approach
-- - The HR department has 'HR' as the department column value.
-- - Use UNION ALL to the same table to get duplicate records.

-- Solution
SELECT 
    first_name, 
    department
FROM worker 
WHERE 
    department like 'HR' 
UNION ALL
SELECT 
    first_name,
    department
FROM worker  
WHERE 
    department like 'HR';


-- https://platform.stratascratch.com/coding/9857-find-the-second-highest-salary-without-using-order-by?python=
-- Find the second highest salary without using ORDER BY
-- Find the second highest salary without using ORDER BY.

SELECT max(salary) 
FROM worker
WHERE 
    salary NOT IN 
        (SELECT 
            max(salary) 
         FROM worker)



-- https://platform.stratascratch.com/coding/9856-find-employees-with-the-same-salary?python=
-- Find employees with the same salary
-- Find employees with the same salary.
-- Output the worker id along with the first name and the salary.

-- - Self join on salary and the worker id.
-- - Use DISTINCT to find unique records.

SELECT 
    distinct 
    W.worker_id, 
    W.first_name, 
    W.salary 
FROM
    -- self join 
    worker W
   INNER JOIN worker W1 
ON 
    W.salary = W1.salary 
and
    W.worker_id != W1.worker_id


-- Find the duplicate records in the dataset
-- Find the duplicate records in the dataset.
-- Output the worker title, affected_from date, and the number of times the records were duplicated

SELECT 
    worker_title, 
    affected_from, 
    count(*) AS n_affected
FROM title
GROUP BY 
    worker_title,
    affected_from
HAVING 
    count(*) > 1


-- Find all workers who are also managers
-- Find all workers who are also managers.    
-- Output the first name along with the corresponding title.

SELECT 
    distinct W.first_name, 
    T.worker_title
FROM 
    worker W
INNER JOIN 
    title T
ON 
    W.worker_id = T.worker_ref_id AND 
    T.worker_title IN ('Manager')


-- Find all workers whose first name contains 6 letters and also ends with the letter 'h'
-- Find all workers whose first name contains 6 letters and also ends with the letter 'h'.

SELECT * 
FROM worker 
WHERE LENGTH(first_name) = 6 
AND LOWER(first_name) LIKE '%h'


-- Combine the first and last names of workers
-- Combine the first and last names of workers with a space inbetween.

SELECT CONCAT(first_name,' ',last_name) AS full_name 
FROM worker;



-- Replace the letter 'a' with 'A' in the first name

SELECT
    REPLACE(first_name, 'a' , 'A') 
FROM worker


-- Formatting Names
-- Print the first name after removing white spaces from the left side.

SELECT
    LTRIM(first_name) 
FROM worker


--Positions Of Letter 'a'
--Find the position of the letter 'a' in the first name of the worker 'Amitah'.

SELECT
    STRPOS(FIRST_NAME, 'a') AS position_of_letter_a
FROM worker
WHERE 
  first_name = 'Amitah'


--Print the first three characters of the first name.

SELECT 
    SUBSTRING(first_name, 1, 3) 
FROM worker