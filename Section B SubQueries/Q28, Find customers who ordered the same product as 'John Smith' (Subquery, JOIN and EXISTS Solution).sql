SELECT DISTINCT c.customer_id,
				name
FROM customers AS c
JOIN orders AS o
ON c.customer_id = o.customer_id
JOIN order_details AS od
ON o.order_id = od.order_id
WHERE od.product_id	IN (
			SELECT od.product_id
			FROM order_details AS od
			JOIN orders AS o
			USING(order_id)
			JOIN customers AS c
			USING(customer_id)
			WHERE name = 'John Smith'
)

-- JOIN Solution

SELECT DISTINCT c.customer_id, c.name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_details od ON o.order_id = od.order_id
JOIN order_details od2 ON od.product_id = od2.product_id
JOIN orders o2 ON od2.order_id = o2.order_id
JOIN customers c2 ON o2.customer_id = c2.customer_id
WHERE c2.name = 'John Smith';

-- Subquery Using EXISTS

SELECT DISTINCT c.customer_id, c.name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_details od ON o.order_id = od.order_id
WHERE EXISTS (
    SELECT 1
    FROM orders o2
    JOIN customers c2 ON o2.customer_id = c2.customer_id
    JOIN order_details od2 ON o2.order_id = od2.order_id
    WHERE c2.name = 'John Smith'
      AND od2.product_id = od.product_id
); 