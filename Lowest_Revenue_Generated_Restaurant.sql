-- Lowest Revenue Generated Restaurants Question
-- Write a query that returns a list of the bottom 2% revenue generating restaurants. Return a list of restaurant IDs and their total revenue from when customers placed orders in May 2020.
-- You can calculate the total revenue by summing the order_total column. And you should calculate the bottom 2% by partitioning the total revenue into evenly distributed buckets.


-- Solution
-- Filter data to use only May 2020 using customer_placed_order_datetimme column
-- Calculate revenue by sum(order_total) and grouping by restaurant_id column
-- Find percentiles by splitting total order into even buckets using NTILE(50) to get 2% buckets
-- Isolate the 50th NTILE using an outer query