SELECT DISTINCT d.name
FROM disciplines d
JOIN marks m ON d.id = m.discipline_id
JOIN students s ON m.student_id = s.id
WHERE s.name = 'Ім'я студента';  -- замініть на ім'я студента
