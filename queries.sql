-- View all bugs
SELECT * FROM bugs;

-- Open bugs
SELECT title, priority, status
FROM bugs
WHERE status = 'open';

-- Bugs per project
SELECT p.project_name, COUNT(b.bug_id) AS bug_count
FROM projects p
LEFT JOIN bugs b ON p.project_id = b.project_id
GROUP BY p.project_name;

-- Bugs assigned to James
SELECT b.title, b.status, u.name
FROM bugs b
JOIN users u ON b.assigned_to = u.user_id
WHERE u.name = 'James Jakubczyk';
