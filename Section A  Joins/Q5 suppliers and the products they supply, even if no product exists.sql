SELECT s.supplier_id,
	s.supplier_name,
    p.product_id,
    p.product_name
FROM suppliers AS s
LEFT JOIN products AS p
ON s.supplier_id = p.supplier_id