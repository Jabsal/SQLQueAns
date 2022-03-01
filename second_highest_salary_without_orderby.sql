-- https://platform.stratascratch.com/coding/9857-find-the-second-highest-salary-without-using-order-by?python=

-- Find the second highest salary without using ORDER BY.

SELECT max(salary) 
FROM worker
WHERE 
    salary NOT IN 
        (SELECT 
            max(salary) 
         FROM worker)