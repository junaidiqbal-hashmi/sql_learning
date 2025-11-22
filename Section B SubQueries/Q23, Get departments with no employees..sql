SELECT d.department_name
FROM departments d
WHERE NOT EXISTS (
	SELECT 1
	FROM employees e
    WHERE e.department_id = d.department_id
)


--------------------------------------------------------------
SELECT department_name 
FROM departments 
WHERE department_id NOT IN ( 
	SELECT department_id 
    FROM employees 
)