-- Salaries Differences
-- Write a query that calculates the difference between the highest salaries found in the marketing and engineering departments. 
-- Output just the absolute difference in salaries.

-- Solution
-- Join the Employee and Department table
-- Get highest salaries in both departments (using case when)
-- Calculate the difference (using abs)

SELECT abs(MAX(CASE WHEN department = 'marketing' THEN salary END)  
       -
       MAX(CASE WHEN department = 'engineering' THEN salary END)
       ) AS salary_difference 
FROM db_employee AS emp
INNER JOIN db_dept AS dept
ON emp.department_id = dept.id

--Optimize/Alternatively
-- abs(max(salary) filter (where department = 'marketing') - max(salary) filter (where department = 'engineering'))