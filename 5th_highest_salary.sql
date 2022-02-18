-- https://platform.stratascratch.com/coding/9855-find-the-5th-highest-salary-without-using-top-or-limit?python=
-- Find the 5th highest salary without using TOP or LIMIT
-- Find the 5th highest salary without using TOP or LIMIT.

WITH ranked_salary AS
(
SELECT salary,
        rank() OVER (ORDER BY salary DESC) as rank 
FROM worker
)

SELECT salary
FROM ranked_salary
WHERE rank = 5