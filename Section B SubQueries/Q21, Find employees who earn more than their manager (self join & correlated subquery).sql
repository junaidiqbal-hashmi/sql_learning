SELECT
	e.employee_id,
	e.name AS employee_name,
	e.salary AS employee_salary,
    m.name AS manager_name,
	m.salary AS manager_salary
FROM employees AS e
	JOIN employees AS m
ON e.manager_id = m.employee_id
WHERE e.salary > m.salary

SELECT e.employee_id,
	e.name,
    e.salary
FROM employees AS e
WHERE e.salary > (
	SELECT m.salary
	FROM employees AS m
    WHERE e.manager_id = m.employee_id
)