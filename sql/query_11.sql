SELECT s.name AS student_name, t.name AS teacher_name, AVG(m.mark) AS average_mark
FROM marks m
JOIN students s ON m.student_id = s.id
JOIN disciplines d ON m.discipline_id = d.id
JOIN teachers t ON d.teacher_id = t.id
WHERE s.name = 'Ім'я студента' AND t.name = 'Ім'я викладача'  -- замініть на актуальні імена
GROUP BY s.name, t.name;
