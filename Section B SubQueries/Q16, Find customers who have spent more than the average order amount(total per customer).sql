SELECT
	c.customer_id,
    c.name,
    SUM(total_amount) AS total_spent
FROM customers AS c
JOIN orders AS o
	USING(customer_id)
GROUP BY c.customer_id
HAVING SUM(total_amount) > (
	SELECT AVG(total_spent)
    FROM (
        SELECT SUM(total_amount) AS total_spent
        FROM orders
        GROUP BY customer_id
    ) AS sub
)