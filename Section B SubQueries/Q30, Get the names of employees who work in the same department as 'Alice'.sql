SELECT name
FROM employees
WHERE department_id = (
			SELECT
			department_id
			FROM employees
			WHERE name = 'Alice Johnson'
)

-- join version
SELECT e.name
FROM employees e
JOIN employees a
    ON e.department_id = a.department_id
WHERE a.name = 'Alice Johnson';


-- EXISTS version
SELECT e.name
FROM employees e
WHERE EXISTS (
    SELECT 1
    FROM employees a
    WHERE a.name = 'Alice Johnson'
      AND a.department_id = e.department_id
);