-- https://platform.stratascratch.com/coding/10062-fans-vs-opposition?python=
-- Fans vs Opposition
-- Meta/Facebook is quite keen on pushing their new programming language Hack to all their offices. They ran a survey to quantify the popularity of the language and send it to their employees. To promote Hack they have decided to pair developers which love Hack with the ones who hate it so the fans can convert the opposition. Their pair criteria is to match the biggest fan with biggest opposition, second biggest fan with second biggest opposition, and so on. Write a query which returns this pairing. Output employee ids of paired employees. Sort users with the same popularity value by id in ascending order.

-- Duplicates in pairings can be left in the solution. For example, (2, 3) and (3, 2) should both be in the solution.

-- Approach
-- - Rank the fans by ROW_NUMBER()
-- - Rank the oppositions by ROW_NUMBER()
-- - Combine the results of both queries using another INNER JOIN on the assigned rank.
-- - Output the paired employee ids using an outer query.

WITH fans AS 
(
SELECT employee_id AS employee_fan_id,
          ROW_NUMBER() OVER (
                             ORDER BY s.popularity DESC, employee_id asc) AS position
  FROM  facebook_hack_survey s
),
opposition AS (SELECT employee_id AS employee_opposition_id,
          ROW_NUMBER() OVER (
                             ORDER BY s.popularity ASC, employee_id asc) AS position
  FROM  facebook_hack_survey s )
SELECT f.employee_fan_id,
      o.employee_opposition_id
FROM
fans f
INNER JOIN
opposition o
  ON f.position = o.position