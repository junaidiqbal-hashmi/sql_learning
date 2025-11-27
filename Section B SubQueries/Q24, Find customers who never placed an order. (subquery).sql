SELECT name
FROM customers
WHERE customer_id NOT IN (
	SELECT customer_id
	FROM orders
)

SELECT name
FROM customers s
WHERE NOT EXISTS (
	SELECT customer_id
	FROM orders o
    WHERE o.customer_id = s.customer_id
)

