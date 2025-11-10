SELECT employee_id,
	name
FROM employees
WHERE salary = (
		SELECT MAX(salary) FROM employees
)