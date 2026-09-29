# SQL Database Practice Repository

This repository is a practical SQL learning workspace designed for database and relational modeling exercises. It contains multiple labs and practice files covering core SQL topics such as table creation, filtering, joins, aggregate functions, scalar functions, normalization, and database design.

The project is organized around real classroom-style SQL tasks and examples that can be executed in MySQL or phpMyAdmin.

## Overview

This repository includes hands-on exercises for:

- Creating and modifying database tables
- Inserting and managing sample data
- Writing targeted SELECT queries
- Applying WHERE, ORDER BY, GROUP BY, and HAVING
- Using INNER JOIN, LEFT JOIN, RIGHT JOIN, and UNION patterns
- Performing aggregate analysis with COUNT, SUM, AVG, MIN, and MAX
- Using scalar functions for text, numeric, and date processing
- Understanding normalization from 1NF to 3NF
- Building a small POS system and university-style database model

## Repository Structure

| Folder / File | Topic | Description |
| --- | --- | --- |
| [Aggregate Lab/aggregate.sql](Aggregate%20Lab/aggregate.sql) | Aggregate Functions | Includes counting, grouping, totals, averages, and revenue calculations. |
| [Join Labs/Joins_lab.sql](Join%20Labs/Joins_lab.sql) | Joins | Covers INNER JOIN, LEFT JOIN, RIGHT JOIN, and multi-table relationships. |
| [Scalar Functions Labs/scaler_lab.sql](Scalar%20Functions%20Labs/scaler_lab.sql) | Scalar Functions | Demonstrates string, numeric, and date manipulation functions like TRIM, UPPER, SUBSTRING, CONCAT, and DATE_FORMAT. |
| [POS LABS/POS.sql](POS%20LABS/POS.sql) | POS Database Design | Contains a point-of-sale schema with categories, customers, employees, products, sales, purchases, discounts, and returns. |
| [SQl Guide Lab/lab 3.sql](SQl%20Guide%20Lab/lab%203.sql) | SQL Practice Guide | Includes beginner-to-intermediate SQL tasks and aggregate queries. |
| [Lab5 Filter Roll Number 22/Lab4_22.sql](Lab5%20Filter%20Roll%20Number%2022/Lab4_22.sql) | Filtering Basics | Focuses on WHERE clauses, conditions, ranges, IN, BETWEEN, LIKE, and NULL handling. |
| [Lab5 Filter Roll Number 22/ASSESSMENT_22.sql](Lab5%20Filter%20Roll%20Number%2022/ASSESSMENT_22.sql) | Assessment Practice | Contains a data table exercise and filter-based questions. |
| [Normalization/Task7_22.sql](Normalization/Task7_22.sql) | Normalization | Covers how tables are transformed from 1NF to 3NF. |
| [Normalization/Assement_22.sql](Normalization/Assement_22.sql) | Normalization Practice | Includes another practical normalization example with patients, doctors, departments, and diagnoses. |
| [Images/](Images/) | Visual References | Screenshots showing SQL execution, table creation, and database schema. |

## Main Learning Topics

### 1. Database Creation and Schema Design

The repository contains examples of creating relational tables with primary keys, foreign keys, unique constraints, and data types.

Example:

```sql
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    age INT,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);
```

### 2. Filtering and Conditional Queries

The filtering lab demonstrates how to retrieve records based on:

- Comparison operators: =, <>, >, <
- Logical conditions: AND, OR
- Range checks: BETWEEN
- Membership checks: IN
- Pattern matching: LIKE
- NULL checks: IS NULL, IS NOT NULL

### 3. Joins and Relationships

The join exercises show how to combine data from multiple tables using relationships between keys.

Common patterns used in the repo:

- INNER JOIN for matching records
- LEFT JOIN for preserving rows from the left table
- RIGHT JOIN for preserving rows from the right table
- UNION for combining results from both sides

### 4. Aggregate Functions

The aggregate lab focuses on summarizing data using:

- COUNT()
- SUM()
- AVG()
- MIN()
- MAX()
- GROUP BY
- HAVING

### 5. Scalar Functions

Scalar function exercises cover data transformation and formatting tasks such as:

- TRIM()
- UPPER()
- LOWER()
- CONCAT()
- SUBSTRING()
- REPLACE()
- LEFT()
- ROUND()
- DATE_FORMAT()
- YEAR(), MONTH(), DAY()
- TIMESTAMPDIFF()

### 6. Normalization

Normalization files show how data is organized from a denormalized design into 1NF, 2NF, and 3NF. These tasks demonstrate how to reduce redundancy and improve data integrity.

Key concepts covered:

- Repeating groups
- Partial dependency
- Transitive dependency
- Primary key-based decomposition

### 7. POS Database Practice

The POS lab introduces a retail system with tables such as:

- Categories
- Products
- Customers
- Employees
- Sales
- SaleItems
- Purchases
- PurchaseItems
- Discounts
- Returns
- Suppliers

## Database Concepts Practiced

This repository is a strong exercise set for learning:

- Relational database design
- Entity relationship modeling
- Keys and constraints
- Data insertion and updates
- Query writing with filters and sorting
- Multi-table joins
- Grouping and summarization
- Text and date functions
- Business database modeling
- Data normalization

## How to Use This Repository

1. Open the SQL files in phpMyAdmin, MySQL Workbench, or any SQL client.
2. Create the required database or use the relevant schema.
3. Run the CREATE TABLE statements first.
4. Insert the sample data.
5. Execute the SELECT queries to explore and test the logic.

## Suggested Learning Path

1. Start with the filtering lab.
2. Learn joins and relationships.
3. Practice aggregate queries.
4. Move to scalar functions.
5. Explore normalization.
6. Review the POS project and full database logic.

## Notes

- The project is intended for academic and learning purposes.
- Files are written as practical SQL examples and may contain classroom-style exercises.
- Some scripts are designed for demonstration, so they may be short, repeated, or intentionally simplified.

## Conclusion

This repository is a complete SQL practice pack for beginners to intermediate learners. It combines theory and hands-on queries in a structured, classroom-style format that helps reinforce real-world database concepts.

## Why This Repository Is Useful

This project is useful because it helps students understand the relationship between data modeling, database design, and practical SQL querying. Instead of only memorizing syntax, learners can see how tables are created, connected, queried, and summarized in real business scenarios.

It also gives a strong foundation for future database work in software development, analytics, reporting, and backend system design. The exercises show that SQL is not just for retrieving records but also for measuring performance, identifying patterns, and making data-driven decisions.

## Skills You Will Build

By working through these labs, you will strengthen the following skills:

- Writing clean and readable SQL statements
- Designing tables with meaningful keys and constraints
- Working with one-to-many and many-to-many relationships
- Practicing data validation through logical conditions
- Extracting insights using grouping and aggregation
- Applying functions to clean and transform data
- Building normalized databases that reduce redundancy
- Thinking like a database designer and analyst

## Sample SQL Workflow

A typical workflow in this repository looks like this:

```sql
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100)
);

CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO departments VALUES (1, 'CS');
INSERT INTO students (name, dept_id) VALUES ('Ali', 1);

SELECT s.name, d.dept_name
FROM students s
JOIN departments d ON s.dept_id = d.dept_id;
```

This simple sequence shows the full life cycle of database work: define structure, store data, and then query and analyze it.

## Real-World Relevance

The SQL practices in this repository reflect real-world scenarios commonly seen in:

- academic systems
- retail systems
- inventory management
- customer relationship systems
- employee record systems
- analytical reporting dashboards

These examples help bridge the gap between classroom learning and professional database work.

## Target Audience

This repository is suitable for:

- beginner SQL students
- college database lab learners
- students preparing for database assignments
- anyone learning MySQL and relational database fundamentals
- people who want to revise core SQL concepts quickly

## Learning Outcome

After finishing these exercises, a learner should be able to:

- create relational tables with constraints
- insert and organize data properly
- retrieve specific records with filters
- connect multiple tables with joins
- calculate business statistics using aggregate functions
- format and transform values with scalar functions
- explain the concept of normalization and database integrity

## Best Practices Used in the Project

Throughout the SQL scripts, the repository emphasizes best practices such as:

- using clear and readable naming conventions
- applying primary and foreign keys correctly
- avoiding redundant data in normalized tables
- writing queries that are easy to understand
- separating data creation, insertion, and analysis steps
- practicing structured query design rather than ad-hoc queries only

## Future Improvements

This project can be extended in many ways, such as:

- adding more advanced SQL projects
- creating a complete student management system
- building a library management database
- developing an e-commerce database schema
- creating a reporting dashboard using SQL queries
- adding ER diagrams and database documentation files

## Summary

This repository is more than just a set of SQL files. It is a complete learning package for understanding how relational databases work in practice. From table design to joins, aggregation, normalization, and function-based queries, it gives a strong introduction to the core concepts needed in modern database development.

---

Made for SQL learning and database practice in MySQL and phpMyAdmin.
