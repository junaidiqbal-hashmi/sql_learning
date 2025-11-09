SELECT 
	c.customer_id,
    c.name,
    COALESCE(SUM(o.total_amount), 0) AS total_spent
FROM customers AS c
LEFT JOIN orders AS o
	ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
