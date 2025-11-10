SELECT c.customer_id,
	c.name,
	COUNT(o.order_id)
FROM orders AS o
JOIN customers AS c
USING(customer_id)
GROUP BY c.customer_id
HAVING COUNT(o.order_id) >= 5

SELECT 
    c.customer_id,
    c.name
FROM customers AS c
WHERE c.customer_id IN (
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING COUNT(order_id) >= 5
);