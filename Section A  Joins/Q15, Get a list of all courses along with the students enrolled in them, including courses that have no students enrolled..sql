SELECT 
	c.course_name,
    s.name AS student_name,
    s.major
FROM courses AS c
LEFT JOIN enrollments AS e
	ON c.course_id = e.course_id
LEFT JOIN students AS s
	ON e.student_id = s.student_id
