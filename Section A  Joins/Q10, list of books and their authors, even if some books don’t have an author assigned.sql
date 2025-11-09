SELECT book_title,
	author_name
FROM books AS b
LEFT JOIN authors AS a
	ON b.author_id = a.author_id