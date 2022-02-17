-- https://platform.stratascratch.com/coding/10137-find-workers-with-an-even-number-for-worker-id?python=
-- Find workers with an even number for worker id
-- Find workers and their corresponding information from the table with an even number for their worker id.

SELECT * 
FROM worker
WHERE worker_id % 2 = 0;