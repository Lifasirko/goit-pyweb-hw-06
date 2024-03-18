SELECT s.id, s.name, AVG(m.mark) AS average_mark
FROM students s
JOIN marks m ON s.id = m.student_id
GROUP BY s.id
ORDER BY average_mark DESC
LIMIT 5;
