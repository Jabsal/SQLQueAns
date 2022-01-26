https://platform.stratascratch.com/coding/10319-monthly-percentage-difference

-- Monthly Percentage Difference Question
-- Given a table of purchases by date, calculate the month-over-month percentage change in revenue. The output should include the year-month date (YYYY-MM) and percentage change, rounded to the 2nd decimal point, and sorted from the beginning of the year to the end of the year.
-- The percentage change column will be populated from the 2nd month forward and can be calculated as ((this month's revenue - last month's revenue) / last month's revenue)*100.

-- Solution
-- required columns: created_at, value

-- Format the date to YYYY-MM
-- Calculate month over month percentage change in revenue using lag
    -- formula (this month's revenue - last month's revenue) / last month's revenue

SELECT to_char(created_at::date, 'YYYY-MM') AS year_month,
        round((sum(value) - lag(sum(value), 1) OVER (w)) /
        lag(sum(value), 1) OVER (w) * 100, 2) as revenue_diff
FROM    sf_transactions
GROUP BY year_month
WINDOW w as (ORDER BY  to_char(created_at::date, 'YYYY-MM')) --windows aliasing
ORDER BY year_month ASC