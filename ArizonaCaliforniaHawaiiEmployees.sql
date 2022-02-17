WITH city_first_names AS (
    SELECT city,first_name,row_number() OVER (partition by city ORDER BY first_name) rn
    FROM employee
    WHERE city IN ('Arizona','California','Hawaii')
)

SELECT 
    az.first_name arizona_first_name,
    ca.first_name california_first_name,
    hw.first_name hawaii_first_name
FROM city_first_names az
JOIN city_first_names ca
    ON az.rn = ca.rn
JOIN city_first_names hw
    ON hw.rn = ca.rn
WHERE az.city = 'Arizona'
    AND ca.city = 'California'
    AND hw.city = 'Hawaii'