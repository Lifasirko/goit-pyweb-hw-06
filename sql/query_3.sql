SELECT g.id, g.name, AVG(m.mark) AS average_mark
FROM groups g
JOIN students s ON g.id = s.group_id
JOIN marks m ON s.id = m.student_id
JOIN disciplines d ON m.discipline_id = d.id
WHERE d.name = 'choose'  -- замініть на актуальну назву предмета
GROUP BY g.id;
