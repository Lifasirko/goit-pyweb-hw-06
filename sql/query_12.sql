SELECT s.name, m.mark
FROM students s
JOIN groups g ON s.group_id = g.id
JOIN marks m ON s.id = m.student_id
JOIN disciplines d ON m.discipline_id = d.id
WHERE g.name = 'Назва групи' AND d.name = 'Назва предмета'  -- замініть на актуальні назви
AND m.date_received = (
    SELECT MAX(m2.date_received)
    FROM marks m2
    JOIN students s2 ON m2.student_id = s2.id
    JOIN disciplines d2 ON m2.discipline_id = d2.id
    WHERE s2.group_id = g.id AND d2.name = 'Назва предмета'  -- повторіть назву предмета
);
