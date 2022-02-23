-- https://platform.stratascratch.com/coding/2054-consecutive-days?python=
-- Consecutive Days
-- Find all the users who were active for 3 consecutive days or more.

-- Approach
-- - Use Lead function to get the next three dates by user
-- - Get DISTINCT users where the difference between the consecutive dates is 1

-- Implementation
WITH consecutive_dates AS 
(
SELECT user_id, 
        date, 
        lead(date) over(partition by user_id order by date) as next_date,  
        lead(date,2) over(partition by user_id order by date) as next_two_date, 
        lead(date,3) over(partition by user_id order by date) as next_three_date
FROM sf_events
)

SELECT DISTINCT user_id
FROM consecutive_dates
WHERE next_date - date = 1 
    AND next_two_date - next_date = 1;