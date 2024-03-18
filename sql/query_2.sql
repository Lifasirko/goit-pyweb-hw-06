SELECT s.id, s.name, AVG(m.mark) AS average_mark
FROM students s
JOIN marks m ON s.id = m.student_id
JOIN disciplines d ON m.discipline_id = d.id
WHERE d.name = 'choose'  -- замініть на актуальну назву предмета
GROUP BY s.id
ORDER BY average_mark DESC
LIMIT 1;
