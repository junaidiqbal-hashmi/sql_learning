SELECT c.customer_id,
	name,
	MAX(order_date) AS most_recent_order_date
FROM customers AS c
LEFT JOIN orders AS o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, name