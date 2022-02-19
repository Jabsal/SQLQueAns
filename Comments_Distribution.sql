-- https://platform.stratascratch.com/coding/10297-comments-distribution?python=

-- Comments Distribution
-- Write a query to calculate the distribution of comments by the count of users that joined Meta/Facebook between 2018 and 2020, for the month of January 2020. 

-- The output should contain a count of comments and the corresponding number of users that made that number of comments in Jan-2020. For example, you'll be counting how many users made 1 comment, 2 comments, 3 comments, 4 comments, etc in Jan-2020. Your left column in the output will be the number of comments while your right column in the output will be the number of users. Sort the output from the least number of comments to highest.

-- To add some complexity, there might be a bug where an user post is dated before the user join date. You'll want to remove these posts from the result.

WITH total_comment_users AS 
(
SELECT u.id,
        COUNT(*) AS total_comment
FROM fb_users u
JOIN fb_comments c
ON u.id = c.user_id
WHERE to_char(c.created_at, 'YYYY-MM') = '2020-01'
AND u.joined_at BETWEEN '01-01-2018'::date AND '12-31-2020'::date
AND c.created_at - u.joined_at >= 0
GROUP BY u.id
)