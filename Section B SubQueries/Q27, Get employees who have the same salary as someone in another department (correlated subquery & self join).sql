SELECT e1.employee_id,
		e1.name,
        e1.salary,
        e1.department_id
FROM employees AS e1
WHERE exists (
			SELECT 1 FROM employees AS e2
			WHERE e2.salary = e1.salary
			AND e2.department_id != e1.department_id
			AND e2.employee_id != e1.employee_id
)

-- self join solution

SELECT DISTINCT e1.employee_id,
                e1.name,
                e1.salary,
                e1.department_id
FROM employees AS e1
JOIN employees AS e2
  ON e1.salary = e2.salary
  AND e1.department_id <> e2.department_id
  AND e1.employee_id <> e2.employee_id;