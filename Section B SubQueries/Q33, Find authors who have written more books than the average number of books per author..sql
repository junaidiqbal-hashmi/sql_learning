SELECT a.author_id, 
       a.author_name, 
       COUNT(b.book_id) AS books_written
FROM authors AS a
JOIN books AS b
    ON a.author_id = b.author_id
GROUP BY a.author_id
HAVING COUNT(b.book_id) > (
        SELECT AVG(books_count)
        FROM (
                SELECT author_id,
                       COUNT(book_id) AS books_count
                FROM books
                GROUP BY author_id
        ) AS sub
);