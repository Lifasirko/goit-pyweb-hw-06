SELECT t.name, AVG(m.mark) AS average_mark
FROM teachers t
JOIN disciplines d ON t.id = d.teacher_id
JOIN marks m ON d.id = m.discipline_id
WHERE t.name = 'Ім'я викладача'  -- замініть на ім'я викладача
GROUP BY t.name;
