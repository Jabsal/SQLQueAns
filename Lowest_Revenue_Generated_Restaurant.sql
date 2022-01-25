https://platform.stratascratch.com/coding-question?id=2036

-- Lowest Revenue Generated Restaurants Question
-- Write a query that returns a list of the bottom 2% revenue generating restaurants. Return a list of restaurant IDs and their total revenue from when customers placed orders in May 2020.
-- You can calculate the total revenue by summing the order_total column. And you should calculate the bottom 2% by partitioning the total revenue into evenly distributed buckets.

-- Solution
-- Filter data to use only May 2020 using customer_placed_order_datetimme column
-- Calculate revenue by sum(order_total) and grouping by restaurant_id column
-- Find percentiles by splitting total order into even buckets using NTILE(50) to get 2% buckets
-- Isolate the 1st NTILE using an outer query

--NOTE: NTILE makes the first bucket bigger if you are diving into buckets when the total records is not evenly divisible by the ntile

SELECT restaurant_id, total_order
FROM
    (SELECT restaurant_id, 
            sum(order_total) as total_order,
            ntile(50) OVER (
                        ORDER BY sum(order_total))
    FROM doordash_delivery
    WHERE customer_placed_order_datetime BETWEEN '2020-05-01' AND '2020-05-31'
    GROUP BY restaurant_id) sq
WHERE ntile=1
ORDER BY 2 DESC

-- optimize the solution/ clean code ?
-- No idea on how to make it faster but it can be cleaner by making the sub query a CTE

with btm_rev as (
     (SELECT restaurant_id, 
            sum(order_total) as total_order,
            ntile(50) OVER (
                        ORDER BY sum(order_total))
    FROM doordash_delivery
    WHERE customer_placed_order_datetime BETWEEN '2020-05-01' AND '2020-05-31'
    GROUP BY restaurant_id)
)

SELECT restaurant_id, total_order
FROM btm_rev
WHERE ntile=1
ORDER BY 2 DESC

