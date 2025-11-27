SELECT order_id
FROM orders AS o
WHERE o.total_amount = (
			SELECT MAX(total_amount)
			FROM orders
			WHERE customer_id = o.customer_id
)