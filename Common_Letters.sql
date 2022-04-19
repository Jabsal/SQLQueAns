-- https://platform.stratascratch.com/coding/9823-common-letters?python=
-- Common Letters
-- Find the top 3 most common letters across all the words from both the tables. Output the letter along with the number of occurrences and order records in descending order based on the number of occurrences.

-- Approach
-- - Use UNION ALL to get all words from all different stores.
-- - Use UNNEST(REGEXP_SPLIT_TO_ARRAY()) function to extract letters in words.
-- - Count the number of occurrences of each letter and LIMIT to top 3 words.

-- SOlution
WITH t_char AS
(    
  SELECT UNNEST(regexp_split_to_array(lower(contents), '')) AS chars 
  FROM google_file_store

  UNION ALL

  SELECT UNNEST(regexp_split_to_array(lower(words1||words2), '')) AS chars 
  FROM google_word_lists
)

SELECT chars, 
        count(*)
FROM t_char
WHERE  chars similar to '\w'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 3;