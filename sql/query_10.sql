SELECT DISTINCT d.name
FROM disciplines d
JOIN marks m ON d.id = m.discipline_id
JOIN students s ON m.student_id = s.id
JOIN teachers t ON d.teacher_id = t.id
WHERE s.name = 'Ім'я студента' AND t.name = 'Ім'я викладача';  -- замініть на ім'я студента та викладача
