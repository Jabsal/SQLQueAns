-- https://platform.stratascratch.com/coding/10284-popularity-percentage?python=

-- Popularity Percentage
-- Find the popularity percentage for each user on Meta/Facebook. The popularity percentage is defined as the total number of friends the user has divided by the total number of users on the platform, then converted into a percentage by multiplying by 100.
-- Output each user along with their popularity percentage. Order records in ascending order by user id.
-- The 'user1' and 'user2' column are pairs of friends.

WITH users_union AS
(
SELECT user1,
          user2
FROM facebook_friends
UNION
SELECT user2 AS user1,
        user1 AS user2
FROM facebook_friends
)

SELECT 
user1,
COUNT(DISTINCT user2)::float / (SELECT COUNT(DISTINCT user1) FROM users_union) * 100 
AS percentage
FROM users_union
GROUP BY user1
ORDER BY user1