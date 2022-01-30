https://platform.stratascratch.com/coding/514-marketing-campaign-success-advanced

-- Marketing Campaign Success [Advanced]
-- You have a table of in-app purchases by user. Users that make their first in-app purchase are placed in a marketing campaign where they see call-to-actions for more in-app purchases. Find the number of users that made additional in-app purchases due to the success of the marketing campaign.

--Their first purchase date
-- Product needs to be purchased on a different day
-- Product needs to be different

WITH ranked_purchases as 
(
SELECT user_id, 
       product_id, 
       created_at,
        dense_rank() over (partition by user_id order by created_at) as rank_1,
        dense_rank() over (partition by user_id , product_id order by created_at) as rank_2
FROM marketing_campaign
)

SELECT COUNT(distinct user_id)
FROM ranked_purchases 
WHERE rank_1 > 1 
      AND rank_2 = 1