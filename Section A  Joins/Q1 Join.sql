SELECT DISTINCT c.customer_id,
order_id,
name
FROM customers c 
JOIN orders o 
ON c.customer_id = o.customer_id