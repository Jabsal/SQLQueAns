-- https://platform.stratascratch.com/coding/9859-find-the-first-50-records-of-the-dataset?python=
-- Find the first 50% records of the dataset
-- Find the first 50% records of the dataset.

-- Approach
-- - Get percentile rank based on worker_id ASC order
-- - Use an outer query to filter out records with a higher index than 50%.

-- Solution
WITH percent_rank_workers AS
(
SELECT *, 
        percent_rank() OVER (ORDER by worker_id) as percentile
FROM worker
)

SELECT *
FROM percent_rank_workers
WHERE percentile <= .50