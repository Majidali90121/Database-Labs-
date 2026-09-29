-- ===================================Task Complete University======================================
-- Q1: CREATE ABOVE TABLES
-- CREATE DEPARTMENT TABLE --

create table departments(
    dept_id INT PRIMARY KEY,
    dept_Name Varchar(100) UNIQUE
);

-- CREATE TABLE STUDENTS

create table students(
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    age INT,
    dept_id INT,
    FOREIGN KEY (dept_id)REFERENCES departments(dept_id)
    );
-- CREATE TABLE enrollments

create table courses(
    course_id INT PRIMARY KEY,
    course_Name VARCHAR(100),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
    );

-- CREATE TABLE INSTRUCTOR

CREATE TABLE instructor(
    instructor_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    dept_id INT,
    FOREIGN  KEY (dept_id) REFERENCES departments(dept_id)
    );

-- CREATE TABLE Enrollments

CREATE TABLE enrollments(
    student_id INT,
    course_id INT,
    semester VARCHAR(20),
    PRIMARY KEY (student_id,course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN key (course_id) REFERENCES courses(course_id)
    ),

--Q2: INSERTE DATA QUERY
-- Inserte SAMPLE
INSERT INTO departments VALUES (1,'CS'),(2,'EE');
INSERT INTO students (name,email,age,dept_id) VALUES('Ali','ali@gmail.com',20,1),('Sara','Sara@gmail.com',21,1),('Ahmed','ahmed@gmail.com',22,2);
INSERT INTO courses VALUES (101,'DATABASE',1),(102,'AI',1),(201,'Circuits',2);
INSERT INTO enrollments VALUES (1,101,'FALL 2025'),(1,102,'FALL 2025'),(2,101,'FALL 2025');

--Q3: UPDATE STUDENT NAME
-- update any student name 
UPDATE students
SET name="AlI Khan"
WHERE student_Id=1;

--Q4: DELETE ANY student recorde
-- delete records
DELETE FROM students
WHERE student_id=2;

--Q5: TRY DROP
-- DROP TABLE enrollemnts
DROP TABLE enrollments

--Q6 ADD Column
-- ADD Column
 ALTER TABLE students
 ADD phone VARCHAR(20);