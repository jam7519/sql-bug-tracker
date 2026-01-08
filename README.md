# SQL Bug Tracker 🐞

A simple PostgreSQL-based bug tracking database designed to demonstrate core SQL skills including schema design, relationships, constraints, and query writing.

This project was built using **PostgreSQL 18** and **pgAdmin 4** as a hands-on SQL portfolio project.

---

## 📌 Project Overview

The SQL Bug Tracker models a basic issue-tracking system commonly used in software development teams.  
It tracks:

- Users (testers, developers, managers)
- Projects
- Bugs/issues assigned to users and projects

The project focuses on **relational database design**, **data integrity**, and **querying real-world relationships**.

---

## 🗂 Database Structure

### Tables

#### `users`
Stores system users.
- `user_id` (PK)
- `name`
- `email` (unique)
- `role` (`tester`, `developer`, `manager`)

#### `projects`
Stores projects being tracked.
- `project_id` (PK)
- `project_name`
- `status` (`active`, `completed`)

#### `bugs`
Stores bug reports.
- `bug_id` (PK)
- `title`
- `description`
- `priority` (`low`, `medium`, `high`, `critical`)
- `status` (`open`, `in_progress`, `resolved`)
- `created_at`
- `updated_at`
- `resolved_at`
- `assigned_to` (FK → `users.user_id`)
- `project_id` (FK → `projects.project_id`)

---

## 📁 Repository Files

| File | Description |
|-----|------------|
| `schema.sql` | Creates all tables, constraints, and relationships |
| `data.sql` | Inserts sample users, projects, and bugs |
| `queries.sql` | Example SQL queries for reporting and filtering |

---

## 🧪 Example Queries

- Show all open bugs
- Show bugs assigned to a specific user
- Filter bugs by priority or project
- Join users, bugs, and projects for reports

Example:
```sql
SELECT b.title, b.status, u.name
FROM bugs b
JOIN users u ON b.assigned_to = u.user_id
WHERE u.name = 'James Jakubczyk';
