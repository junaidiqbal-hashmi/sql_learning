SELECT c.customer_id,
c.name
FROM customers AS c
JOIN orders AS o
ON c.customer_id = o.customer_id
LEFT JOIN payments AS p
ON o.order_id = p.order_id
WHERE p.payment_id IS NULL