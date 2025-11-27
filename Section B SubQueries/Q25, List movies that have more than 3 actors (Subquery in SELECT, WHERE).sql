SELECT m.movie_id,
		m.title,
        COUNT(mc.actor_id) AS actors
FROM movies AS m
JOIN movie_cast AS mc
ON m.movie_id = mc.movie_id
GROUP BY m.movie_id, m.title
HAVING COUNT(mc.actor_id) > 3

-- Subquery IN WHERE Clause 
SELECT movie_id, title
FROM movies
WHERE movie_id IN (
    SELECT movie_id
    FROM movie_cast
    GROUP BY movie_id
    HAVING COUNT(actor_id) > 3
);


-- Subquery IN SELECT Clause 
SELECT m.movie_id,
       m.title,
       (SELECT COUNT(*) 
        FROM movie_cast mc 
        WHERE mc.movie_id = m.movie_id) AS actor_count
FROM movies m
WHERE (SELECT COUNT(*)
       FROM movie_cast mc
       WHERE mc.movie_id = m.movie_id) > 3;

