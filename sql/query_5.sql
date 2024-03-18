SELECT d.name
FROM disciplines d
JOIN teachers t ON d.teacher_id = t.id
WHERE t.name = 'Ім'я викладача';  -- замініть на ім'я викладача
