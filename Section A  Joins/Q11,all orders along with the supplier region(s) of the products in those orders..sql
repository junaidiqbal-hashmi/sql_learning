SELECT 
	o.order_id,
	o.order_date,
    p.product_id,
    p.product_name,
    s.supplier_name,
    s.region
FROM orders AS o
LEFT JOIN order_details AS od
	USING (order_id)
LEFT JOIN products AS p
	USING (product_id)
LEFT JOIN suppliers AS s
	USING (supplier_id)
