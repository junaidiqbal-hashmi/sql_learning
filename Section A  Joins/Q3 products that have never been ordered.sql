SELECT product_id, product_name 
FROM products
WHERE product_id NOT IN (
    SELECT product_id FROM order_details
);

SELECT p.product_id, p.product_name
FROM products p
WHERE NOT EXISTS (
    SELECT 1
    FROM order_details od
    WHERE od.product_id = p.product_id
);

SELECT p.product_id, p.product_name
FROM products p
LEFT JOIN order_details od 
       ON p.product_id = od.product_id
WHERE od.product_id IS NULL;