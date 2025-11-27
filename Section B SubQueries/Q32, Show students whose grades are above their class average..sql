SELECT 
    s.student_id,
    s.name,
    e.grade
FROM students AS s
JOIN enrollments e USING(student_id)
WHERE 
    (CASE e.grade
        WHEN 'A' THEN 4
        WHEN 'B' THEN 3
        WHEN 'C' THEN 2
        WHEN 'D' THEN 1
        ELSE 0
     END)
     >
     (
        SELECT AVG(
            CASE e2.grade
                WHEN 'A' THEN 4
                WHEN 'B' THEN 3
                WHEN 'C' THEN 2
                WHEN 'D' THEN 1
                ELSE 0
            END
        )
        FROM enrollments e2
        WHERE e2.course_id = e.course_id
     );