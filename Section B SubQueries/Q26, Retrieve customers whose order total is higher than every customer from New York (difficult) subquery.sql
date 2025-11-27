SELECT  c.customer_id,
		name,		
		SUM(total_amount) AS total
FROM customers AS c
JOIN orders AS o
		USING(customer_id)
GROUP BY c.customer_id
HAVING SUM(total_amount) > (
		SELECT MAX(total) 
		FROM (
			SELECT SUM(total_amount) AS total 
            FROM customers AS c
            JOIN orders AS o
            USING (customer_id)
			WHERE c.city = 'New York'
            GROUP BY c.customer_id) AS Sub
)