SELECT s.name, m.mark
FROM students s
JOIN marks m ON s.id = m.student_id
JOIN disciplines d ON m.discipline_id = d.id
JOIN groups g ON s.group_id = g.id
WHERE g.name = 'Назва групи' AND d.name = 'Назва предмета';  -- замініть на назву групи та предмета
