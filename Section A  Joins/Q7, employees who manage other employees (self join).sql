SELECT
	e.name AS employee,
    m.name AS manager
FROM employees AS e
JOIN employees AS m
ON e.manager_id = m.employee_id