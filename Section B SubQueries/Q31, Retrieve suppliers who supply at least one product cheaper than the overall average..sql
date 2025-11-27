SELECT DISTINCT supplier_id, 
		supplier_name
FROM suppliers AS s
JOIN products AS p
USING(supplier_id)
	WHERE p.price < (
		SELECT AVG(price)
		FROM products
)

-- JOIN Based Solution

SELECT DISTINCT s.supplier_id, s.supplier_name
FROM suppliers s
JOIN products p
ON s.supplier_id = p.supplier_id
JOIN (
      SELECT AVG(price) AS avg_price
      FROM products
) AS x
ON p.price < x.avg_price;

-- EXISTS Based Solution

SELECT s.supplier_id, s.supplier_name
FROM suppliers s 
WHERE EXISTS (
		SELECT 1
        FROM products p
        WHERE p.supplier_id = s.supplier_id
        AND p.price < (SELECT AVG(price) FROM products)
)