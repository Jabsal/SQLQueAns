-- https://platform.stratascratch.com/coding/9844-find-all-workers-who-joined-on-february-2014?python=
-- Find all workers who joined on February 2014.

SELECT worker_id, 
        first_name, 
        last_name, 
        salary, 
        joining_date, 
        department
FROM worker
WHERE to_char(joining_date, 'YYYY-MM') = '2014-02'