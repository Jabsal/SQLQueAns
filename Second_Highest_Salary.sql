-- https://platform.stratascratch.com/coding/9892-second-highest-salary?python=
-- Second Highest Salary
-- Find the second highest salary of employees.

WITH rank_salary AS 
(
SELECT salary,
        dense_rank() OVER (ORDER BY salary DESC) as rank
FROM employee
)
SELECT salary
FROM rank_salary
WHERE rank = 2;