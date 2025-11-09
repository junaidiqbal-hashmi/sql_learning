SELECT 
	m.title,
    a.name,
    mc.role_name
FROM movies AS m
LEFT JOIN movie_cast AS mc
ON m.movie_id = mc.movie_id
LEFT JOIN actors AS a
ON mc.actor_id = a.actor_id
