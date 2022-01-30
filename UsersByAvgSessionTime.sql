-- Users By Avg Session time
-- Calculate each user's average session time. A session is defined as the time difference between a page_load and page_exit. For simplicity, assume an user has only 1 session per day and if there are multiple of the same events in that day, consider only the latest page_load and earliest page_exit. Output the user_id and their average session time.

-- Solution
-- Get the latest page load per user
-- Get the earliest page exit per user
-- Get the average

WITH user_activities AS
(
SELECT user_id, 
        timestamp::date, 
        MAX(case when action = 'page_load' then timestamp else null end) AS latest_page_load, 
        MIN(case when action = 'page_exit' then timestamp else null end) AS earliest_page_exit 
FROM facebook_web_log
GROUP BY user_id, 
        timestamp::date
)

SELECT user_id, 
        AVG(earliest_page_exit - latest_page_load) AS avg_session_time
FROM user_activities
GROUP BY user_id
HAVING AVG(earliest_page_exit - latest_page_load) is not null;