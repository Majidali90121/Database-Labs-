-- CREATE AN EMPLOYEE TABLE AND INSERTE INFO

CREATE DATABASE IF NOT EXISTS filters_lab;
USE filters_lab;
DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (
EmpID INT PRIMARY KEY,
EmpName VARCHAR(50) NOT NULL,
Gender CHAR(1),
Salary DECIMAL(10,2),
HireDate DATE,
City VARCHAR(30),
JobTitle VARCHAR(40),
DeptName VARCHAR(40)
);
INSERT INTO Employee VALUES
(101,'Ali Khan', 'M',120000,'2018-03-15','Lahore', 'Senior
Engineer','Engineering'),
(102,'Sara Iqbal', 'F', 95000,'2019-06-01','Lahore', 'Software
Engineer','Engineering'),
(103,'Hamza Raza', 'M', 85000,'2020-01-20','Karachi', 'Software
Engineer','Engineering'),
(104,'Ayesha Noor', 'F',110000,'2017-11-10','Karachi', 'Marketing Lead',
'Marketing'),
(105,'Bilal Ahmed', 'M', 70000,'2021-04-05','Karachi', 'Marketing Exec',
'Marketing'),
(106,'Fatima Sheikh', 'F', 90000,'2019-09-12','Islamabad','Accountant', 'Finance'),
(107,'Usman Tariq', 'M', 78000,'2022-02-18','Islamabad','Accountant',
'Finance'),
(108,'Maira Javed', 'F',115000,'2016-07-22','Lahore', 'Research Lead', 'Research'),
(109,'Zain Abbas', 'M', 60000,'2023-01-09','Lahore', 'Research
Analyst','Research'),
(110,'Nida Yousaf', 'F', 72000,'2022-08-30',NULL, 'Research
Analyst','Research'),
(111,'Adeel Akhtar', 'M', 88000,'2020-05-14','Lahore', 'QA Engineer',
'Engineering'),
(112,'Sana Malik', 'F',102000,'2018-12-01','Karachi', 'Sales Manager', 'Sales'),
(113,'Talha Hussain', 'M', 65000,'2023-07-18','Islamabad','Sales Exec', 'Sales'),
(114,'Mehwish Anwar', 'F', 80000,'2021-10-25','Lahore', 'HR Officer', 'HR'),
(115,'Imran Shafi', 'M',125000,'2015-04-30',NULL,
'Director', 'Engineering');

--select employee who earn more then 90 thousand
SELECT EmpID,EmpName,Salary
FROM employee
WHERE Salary>90000

--select employee with salary less then or equal to 70,000
SELECT EmpID,EmpName,Salary
FROM employee
WHERE Salary<=70000

--select employee lie in lahore and earn more then 90000
SELECT EmpID,EmpName,City,Salary
FROM employee
where City='Lahore' AND Salary>90000 

-- List employees in Karachi or Islamabad. Show EmpName and City.
SELECT EmpID,EmpName,City
FROM employee
where City='Karachi' OR City='Islamabad'

-- Find female employees who are not in the Engineering department
SELECT EmpID,EmpName,Gender,DeptName
FROM employee
WHERE Gender='F' AND DeptName!='Engineering'

-- Show employees who are male and earn between 70,000 and 90,000 (use AND and comparison operators only no BETWEEN yet)
SELECT EmpID,EmpName,Gender,Salary
FROM employee
WHERE Gender='M' AND Salary>=70000 AND Salary<=90000

-- List employees who are either Software Engineers or earn more than 100,000.
SELECT EmpID,EmpName,JobTitle,Salary
FROM employee
where JobTitle='Software Engineers' OR Salary>100000

--Find employees who are not in Marketing and not in Sales
SELECT EmpID,EmpName,DeptName
from employee
WHERE DeptName!="Marketing" OR DeptName="Sales"

-- List employees with salary between 75,000 and 100,000 (inclusive). Sort by salary ascending.
SELECT EmpID,EmpName,Salary
from  employee
where Salary BETWEEN 75000 AND 100000
ORDER BY Salary ASC

-- List employees hired between January 2020 and December 2022.
SELECT EmpID,EmpName,HireDate
FROM employee
WHERE HireDate BETWEEN '2020-01-01' AND '2022-12-30'

--Show employees whose salary is not between 80,000 and 100,000
SELECT EmpName, Salary
FROM Employee
WHERE Salary NOT BETWEEN 80000 AND 100000;

-- List employees whose city is one of: Lahore, Islamabad. Sort by city, then by salary descending
SELECT EmpID,EmpName,City,Salary
FROM employee
WHERE City IN ('Lahore','Islamabad')
ORDER BY Salary DESC

-- Find employees in any department except Engineering, Sales, and HR.
SELECT EmpID,EmpName,DeptName
FROM employee
WHERE DeptName NOT IN ('Engineering','Sales','HR')

-- Show all employees whose name starts with the letter 'M'. Display EmpName.
SELECT EmpID,EmpName
FROM employee
WHERE EmpName LIKE 'A%'

-- Find employees whose name contains the letter 'a' anywhere (case-insensitive).
SELECT EmpID,EmpName
FROM employee
WHERE EmpName LIKE '%a%'

-- Find employees whose name ends with 'an'.
SELECT EmpID,EmpName
FROM employee
WHERE EmpName LIKE '%an';

-- Show employees whose job title contains the word 'Engineer' but who do not work in the Engineering department
SELECT EmpName,JobTitle,DeptName
FROM employee
WHERE JobTitle LIKE '%Engineer%' AND DeptName NOT IN ('Engineering')

-- List the names of employees who do not have a recorded city.
SELECT EmpID,EmpName,City
FROM employee
WHERE City IS NULL

-- List employees who have a recorded city, sorted alphabetically by city.
SELECT EmpID,EmpName,City
FROM employee
WHERE City IS NOT NULL
ORDER BY City ASC

-- Display the 3 highest paid employees. Show EmpName and Salary
SELECT EmpID,EmpName,Salary
FROM employee
ORDER BY Salary DESC
LIMIT 3

-- Display the 5 most recently hired employees.
SELECT EmpID,EmpName,HireDate
FROM employee
ORDER BY HireDate DESC
LIMIT 5

-- Show all employees, sorted by department ascending, then by hire date ascending within each department.
SELECT EmpID,EmpName,HireDate,DeptName
FROM employee
ORDER BY HireDate ASC,DeptName ASC