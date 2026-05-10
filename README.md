# University Lab Database Example

This repository contains a simple university lab database example designed for MySQL/phpMyAdmin. The schema includes departments, students, courses, instructors, and enrollments.

## Database Overview

The database is named `complete university lab example` and has the following tables:

- `departments`
- `students`
- `courses`
- `instructor`
- `enrollments`

The design represents a small university data model with department-based students, courses, and instructors, plus a many-to-many enrollment relationship between students and courses.

## Images

The repository includes the following image references with specific explanations:

- ![SQL commands and results](Images/1.png)
  - Shows the MySQL/phpMyAdmin SQL editor after running the `CREATE TABLE` and `INSERT` commands. It confirms successful insertion of sample department, student, course, and enrollment data.
- ![SQL command text view](Images/2.png)
  - Shows the SQL query text in phpMyAdmin, including `CREATE TABLE` statements for `departments`, `students`, `courses`, `instructor`, and `enrollments`, followed by a sample `INSERT INTO enrollments` statement.
- ![Table list in phpMyAdmin](Images/3.png)
  - Shows the database table list view in phpMyAdmin. This confirms the five tables exist and displays engine and collation details for `courses`, `departments`, `enrollments`, `instructor`, and `students`.
- ![ER diagram of database](Images/4.png)
  - Shows the entity-relationship diagram with foreign key connections: `departments` linked to `students`, `courses`, and `instructor`, and `students` linked to `courses` through `enrollments`.

These images can be viewed directly in GitHub or in a Markdown preview.

## Table Structure and Relationships

### `departments`
- `dept_id` INT PRIMARY KEY
- `dept_name` VARCHAR(100)

This table stores academic departments and is referenced by students, courses, and instructors.

### `students`
- `student_id` INT AUTO_INCREMENT PRIMARY KEY
- `name` VARCHAR(100) NOT NULL
- `email` VARCHAR(100) UNIQUE
- `age` INT
- `dept_id` INT FOREIGN KEY REFERENCES `departments`(`dept_id`)

Each student belongs to one department.

### `courses`
- `course_id` INT PRIMARY KEY
- `course_name` VARCHAR(100)
- `dept_id` INT FOREIGN KEY REFERENCES `departments`(`dept_id`)

Each course is offered by one department.

### `instructor`
- `inst_id` INT PRIMARY KEY
- `name` VARCHAR(100)
- `email` VARCHAR(100) UNIQUE
- `dept_id` INT FOREIGN KEY REFERENCES `departments`(`dept_id`)

Each instructor is assigned to one department.

### `enrollments`
- `student_id` INT FOREIGN KEY REFERENCES `students`(`student_id`)
- `course_id` INT FOREIGN KEY REFERENCES `courses`(`course_id`)
- `semester` VARCHAR(100)
- PRIMARY KEY (`student_id`, `course_id`)

This table implements a many-to-many relationship between students and courses, recording which student is enrolled in which course and in which semester.

## SQL Example

### Create tables

```sql
CREATE TABLE departments(
  dept_id INT PRIMARY KEY,
  dept_name VARCHAR(100)
);

CREATE TABLE students(
  student_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE,
  age INT,
  dept_id INT,
  FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

CREATE TABLE courses(
  course_id INT PRIMARY KEY,
  course_name VARCHAR(100),
  dept_id INT,
  FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

CREATE TABLE instructor(
  inst_id INT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100) UNIQUE,
  dept_id INT,
  FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

CREATE TABLE enrollments(
  student_id INT,
  course_id INT,
  semester VARCHAR(100),
  PRIMARY KEY (student_id, course_id),
  FOREIGN KEY (student_id) REFERENCES students(student_id),
  FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
```

### Insert example data

```sql
INSERT INTO departments VALUES (1, 'CS'), (2, 'EE');

INSERT INTO students(name, email, age, dept_id) VALUES
  ('ALI', 'ali@gmail.com', 20, 1),
  ('SARA', 'sara@gamil.com', 21, 2),
  ('Ahmed', 'ahmed@gmail.com', 22, 2);

INSERT INTO courses VALUES
  (101, 'DSA', 1),
  (102, 'AI', 1),
  (201, 'Circuits', 2);

INSERT INTO enrollments VALUES
  (1, 101, 'Fall 2025'),
  (2, 102, 'Fall 2026'),
  (2, 101, 'Fall 2027');
```

## Relationship Diagram

The schema follows these relationships:

- `departments` -> `students` : one department has many students
- `departments` -> `courses` : one department has many courses
- `departments` -> `instructor` : one department has many instructors
- `students` <-> `courses` : many-to-many through `enrollments`

This structure allows departments to organize both people and classes, while enrollments connect students and courses across semesters.

## Notes

- Use phpMyAdmin to run the SQL commands in the SQL query window.
- The sample data inserts demonstrate basic department, student, course, and enrollment records.
- The `email` fields in `students` and `instructor` are unique so duplicate addresses are prevented.
