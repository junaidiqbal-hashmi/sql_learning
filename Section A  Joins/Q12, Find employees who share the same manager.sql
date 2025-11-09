SELECT 
	e1.name AS employee_1,
    e2.name AS employee_2,
    m.name AS manager
FROM employees AS e1
JOIN employees AS e2
	ON e1.manager_id = e2.manager_id AND
    e1.employee_id != e2.employee_id
JOIN employees AS m
	ON e1.manager_id = m.employee_id
WHERE e1.employee_id < e2.employee_id
