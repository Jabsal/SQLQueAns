-- https://platform.stratascratch.com/coding/10171-find-the-genre-of-the-person-with-the-most-number-of-oscar-winnings?python=
-- Find the genre of the person with the most number of oscar winnings
-- Find the genre of the person with the most number of oscar winnings.
-- If there are more than one person with the same number of oscar wins, return the first one in alphabetic order.

SELECT top_genre
FROM nominee_information ni
JOIN Oscar_nominees osc ON ni.id=osc.id
AND osc.winner=True
GROUP BY top_genre
ORDER BY COUNT(*) DESC
LIMIT 1