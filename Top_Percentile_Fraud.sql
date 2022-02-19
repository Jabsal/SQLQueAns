-- https://platform.stratascratch.com/coding/10303-top-percentile-fraud?python=
-- Top Percentile Fraud
-- ABC Corp is a mid-sized insurer in the US and in the recent past their fraudulent claims have increased significantly for their personal auto insurance portfolio. They have developed a ML based predictive model to identify propensity of fraudulent claims. Now, they assign highly experienced claim adjusters for top 5 percentile of claims identified by the model.
-- Your objective is to identify the top 5 percentile of claims from each state. Your output should be policy number, state, claim cost, and fraud score.

-- Approach
-- - Use a window function that will rank the records by percentile to 100.
-- - Partition by the state
-- - Limit to only the top 5 percent of top fraud scores

SELECT policy_num, 
        state, 
        claim_cost, 
        fraud_score
FROM (
    SELECT *,  NTILE(100) OVER (PARTITION BY state ORDER BY fraud_score DESC) AS percentile
    FROM fraud_score) AS result
WHERE percentile <= 5