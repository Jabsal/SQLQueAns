WITH total_invoice AS
(
SELECT extract(month from invoicedate) as month, 
        stockcode, description, sum(unitprice*quantity) as totalinvoice, 
        rank() over (partition by extract(month from invoicedate) order by sum(unitprice*quantity) desc) as rank
FROM online_retail
GROUP BY 1,2,3
)

SELECT month, 
        description, 
        totalinvoice
FROM total_invoice
WHERE rank = 1
ORDER BY 1