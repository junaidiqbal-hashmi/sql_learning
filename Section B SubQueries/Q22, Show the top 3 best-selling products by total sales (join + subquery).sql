SELECT p.product_id,
		p.product_name,
		SUM(od.price * od.quantity) AS total_sale
FROM order_details AS od
JOIN products AS p
USING(product_id)
GROUP BY p.product_id
ORDER BY total_sale DESC
LIMIT 3


SELECT 
    p.product_name,
    ps.total_sale
FROM products AS p
JOIN (
    SELECT 
        product_id,
        SUM(price * quantity) AS total_sale
    FROM order_details
    GROUP BY product_id
) AS ps
ON p.product_id = ps.product_id
ORDER BY ps.total_sale DESC
LIMIT 3;