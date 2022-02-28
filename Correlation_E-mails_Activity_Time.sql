-- https://platform.stratascratch.com/coding/10069-correlation-between-e-mails-and-activity-time?python=
-- Correlation Between E-mails And Activity Time
-- There are two tables with user activities. The 'google_gmail_emails` table contains information about emails being sent to users. Each row in that table represents a message with an unique identifier in the `id` field. The `google_fit_location` table contains user activity logs from the Google Fit app. 
-- Find the correlation between the number of emails received and the total exercise per day. The total exercise per day is calculated by counting the number of user sessions per day.

-- Aproach
-- - Use two inner queries to find the number of emails and the total exercise per day.
-- - Use the COUNT() function in both queries to find the desired values.
-- - Group records by the user and day.
-- - Use an INNER JOIN to combine both results on the user and date.
-- - Use the CORR() function in an outer query to find the correlation between two values.
-- - Cast values using :: NUMERIC if needed.

WITH mail_base AS 
(
SELECT to_user,
          DAY,
          COUNT(*) AS n_emails
FROM google_gmail_emails
GROUP BY to_user,
            DAY
),
loc_base AS (SELECT user_id,
          DAY,
          COUNT(DISTINCT session_id) AS total_exercise
FROM google_fit_location
GROUP BY user_id,
            DAY
)

SELECT corr(n_emails :: NUMERIC, total_exercise :: NUMERIC)
FROM mail_base m
JOIN loc_base l
ON m.to_user = l.user_id
AND m.DAY = l.DAY


