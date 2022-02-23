-- https://platform.stratascratch.com/coding/10084-cum-sum-energy-consumption?python=

-- Cum Sum Energy Consumption
-- Calculate the running total (i.e., cumulative sum) energy consumption of the Meta/Facebook data centers in all 3 continents by the date. Output the date, running total energy consumption, and running total percentage rounded to the nearest whole number.

-- - union all the energy data into one.
-- - Use the function SUM() to find the cumulative total consumption.
-- - Get percentage calculation of each

WITH total_energy AS (
   SELECT *
   FROM fb_eu_energy eu
   UNION ALL 
   SELECT *
   FROM fb_asia_energy asia
   UNION ALL 
   SELECT *
   FROM fb_na_energy na),
 total_energy_by_date AS 
 (
    SELECT date, 
     sum(consumption) AS total_energy
   FROM total_energy
   GROUP BY date
   ORDER BY date ASC
 )
 SELECT date,
        SUM(total_energy) OVER (ORDER BY DATE) AS cumm_total_energy,
        ROUND(SUM(total_energy) OVER (ORDER BY date) * 100 / (SELECT sum(total_energy) 
        FROM total_energy_by_date), 0) AS percentage_total_energy
FROM total_energy_by_date