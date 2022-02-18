--https://platform.stratascratch.com/coding/9865-highest-salaried-employees?python=
-- Highest Salaried Employees
-- Find the employee with the highest salary in each department.
-- Output the department name, employee's first name, and the salary.

WITH ranked_salary AS
(
SELECT department, 
        first_name, 
        salary,
        rank() OVER (PARTITION BY department ORDER BY salary DESC) AS rank
FROM worker
)

SELECT * 
FROM ranked_salary
WHERE rank = 1;