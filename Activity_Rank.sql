-- https://platform.stratascratch.com/coding/10351-activity-rank?python=
-- Find the email activity rank for each user. Email activity rank is defined by the total number of emails sent. The user with the highest number of emails sent will have a rank of 1, and so on. Output the user, total emails, and their activity rank. Order records by the total emails in descending order. Sort users with the same number of emails in alphabetical order.
-- In your rankings, return a unique value (i.e., a unique rank) even if multiple users have the same number of emails.

-- -Find the total email sent by each user using the COUNT() function.
-- - Group records by from_user.
-- - Use the formula ROW_NUMBER to order records by total emails in descending order.
-- - Order user with the same number of emails alphabetically

SELECT  from_user, 
        COUNT(*) as total_emails, 
        row_number() OVER (ORDER BY COUNT(*) DESC, from_user)
FROM google_gmail_emails 
GROUP BY from_user