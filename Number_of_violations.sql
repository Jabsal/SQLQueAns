https://platform.stratascratch.com/coding/9728-inspections-that-resulted-in-violations?python=

-- You're given a dataset of health inspections. 
-- Count the number of violation in an inspection in 'Roxanne Cafe' for each year. 
-- If an inspection resulted in a violation, there will be a value in the 'violation_id' column. 
-- Output the number of violations by year in ascending order.

--Solution
-- Column needed: business_name, violation_id, inspection_date
-- year from business_name, count() violation_id for n_inspections
-- filter for roxanne cafe and inspections where violation_id is not null

SELECT EXTRACT(year from inspection_date::date) as year,
        COUNT(violation_id) as n_inspections
FROM sf_restaurant_health_violations
WHERE business_name = 'Roxanne Cafe'
AND   violation_id IS NOT NULL
GROUP BY year
ORDER BY year asc