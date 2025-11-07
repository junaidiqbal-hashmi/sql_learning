SELECT
	s.student_id,
    s.name,
    c.course_name
FROM students AS s
	LEFT JOIN enrollments AS e
	ON s.student_id = e.student_id
	LEFT JOIN courses AS c
	ON c.course_id = e.course_id
