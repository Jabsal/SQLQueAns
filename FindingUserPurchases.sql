--https://platform.stratascratch.com/coding/10322-finding-user-purchases
-- Finding User Purchases
-- Write a query that'll identify returning active users. A returning active user is a user that has made a second purchase within 7 days of any other of their purchases. Output a list of user_ids of these returning active users.

--Solution
-- Cross join table and 
-- select only data within 7 days date range
-- Make sure the transaction id is not the same because we are interested in second purchases

SELECT
     DISTINCT(a.user_id) 
FROM amazon_transactions a
JOIN amazon_transactions b
    ON a.user_id = b.user_id
WHERE a.created_at - b.created_at BETWEEN 0 AND 7
    AND a.id != b.id