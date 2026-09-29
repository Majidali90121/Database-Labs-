--List every employee with their department name and location. (INNER JOIN)

Select e.EmpName,  d.DeptName, d.Location
 from Employee e 
 inner join Department d on e.DeptID = d.DeptID;

--Same as A1, but include employees whose DeptID is NULL — if any. (LEFT JOIN)

 Select e.EmpName,  d.DeptName, d.Location 
 from Employee e 
 left join Department d on e.DeptID = d.DeptID where e.DeptID is NULL;


--List every department with the names of its employees. Departments with no employees should still appear once
-- with NULL EmpName.
 select d.DeptName , e.EmpName
  from department d 
  left join Employee e on d.DeptID = e.DeptID;

--List every project with its department name and location. Include projects that have no department.

 select p.ProjectName, d.DeptName, d.Location 
 from Project p
  left join Department d on p.DeptID = d.DeptID;

--Find employees who are not assigned to any project. (LEFT JOIN + IS NULL pattern)
 select e.EmpName
  from Employee e
   left join Assignment a on e.EmpID = a.EmpID 
   where a.EmpID is NULL;

--List every project that currently has no assignments.

 select p.ProjectName 
 from Project p
  left join Assignment a on p.ProjectID = a.ProjectID
   where a.ProjectID is NULL;


--Show every employee in the Engineering department along with their salary, sorted by salary descending. (INNER
--JOIN + WHERE)
 select e.EmpName, e.Salary, d.DeptName 
 from Employee e
  Inner JOIN Department d on e.DeptID= d.DeptID 
  where d.DeptName = 'Engineering' 
  ORDER BY e.Salary DESC;

 
 --List employees in Lahore-based departments. Show EmpName and DeptName.
 
 select e.EmpName, d.DeptName
  from Employee e Inner JOIN
   Department d on e.DeptID= d.DeptID
    where d.Location ='Lahore'; 

--Produce a FULL OUTER JOIN result of Employee and Department using UNION.

 select e.EmpID,e.EmpName,e.Gender,e.Salary,e.HireDate,e.City, e.ManagerID, d.DeptName, d.Location,d.Budget
  from Employee e
   left JOIN Department d on e.DeptID= d.DeptID  

 UNION

 select e.EmpID,e.EmpName,e.Gender,e.Salary,e.HireDate,e.City, e.ManagerID, d.DeptName, d.Location,d.Budget
  from Employee e
   right JOIN Department d on e.DeptID= d.DeptID ; 

--For each employee, show their name and their manager's name. Top-level managers should still appear with NULL
--Manager. (Left JOIN)
 select e.EmpName As Employee, m.EmpName As Manager 
 from Employee e
  left join Employee m  on e.ManagerID = m.EmpID;

--List employees who earn more than their direct manager. Show employee name, employee salary, manager name,
--manager salary
 select e.EmpName As Employee, e.Salary As EmployeeSalary, m.EmpName As Manager, m.Salary As ManagerSalary 
 from Employee e 
 left join Employee m  on e.ManagerID = m.EmpID 
 where m.Salary>e.Salary;

 
--List employees whose manager works in a different department. Show EmpName, ManagerName, and both department names
 select e.EmpName, p.ProjectName , a.HoursPerWeek 
 from Employee e 
 join Project p on e.DeptID= p.DeptID 
 join Assignment a on e.EmpID=a.EmpID;


--Show every employee with the project name they work on
  SELECT e.EmpName, p.ProjectName, d.DeptName 
  FROM Employee e 
  JOIN Assignment a ON e.EmpID = a.EmpID
   JOIN Project    p ON a.ProjectID = p.ProjectID 
   JOIN Department d ON p.DeptID    = d.DeptID;


--List the names and weekly hours of employees working on the Mobile App project.
select e.EmpName, a.HoursPerWeek
  from Employee e 
  left join Assignment a on e.EmpID = a.EmpID 
  where a.ProjectID =1002;


--List every employee in Lahore together with the projects they are assigned to (project name and hours). Include
--Lahore employees with no assignments.
select e.EmpName, p.ProjectName , a.HoursPerWeek
 from Employee e 
 Join Project p on e.DeptID=p.DeptID 
 Join Assignment a on e.EmpID= a.EmpID 
 where e.City='Lahore';


--List the names of employees who work on a project run by a department different from their own.
 select e.EmpName, p.ProjectName , d.DeptName
  from Employee e 
  join Project p on e.DeptID=p.DeptID 
  join Department d on p.DeptID=e.DeptID
   where e.DeptID = p.DeptID;

--For each department, list the names of projects that started in 2024. Include departments that have no such
--projects.

 select d.DeptName,p.ProjectName, p.StartDate 
 from Project p
  left join Department d on p.DeptID=d.DeptID
   where p.StartDate > '2024' & p.StartDate< '2025';
 

-- Assessment Problem

--Show every book with its author's name and country.
 select b.Title, a.AuthorName,a.Country
  from Book b
   inner join Author a on b.AuthorID=a.AuthorID;

--Show every author with their books. Authors with no books must still appear once with NULL Title.
 select b.Title, a.AuthorName
  from Book b 
  left join Author a on b.AuthorID=a.AuthorID;

--List members who have never borrowed any book.
select m.MemberName
 from Member m
  left join Loan l on m.MemberID=l.MemberID 
  where l.LoanID is null;

--List every loan with the member's name, book title, and author's name.
 select  l.loanID,m.MemberName, b.Title As BookTitle, a.AuthorName 
 from Author a
  join Book b on a.AuthorID=b.AuthorI 
  join loan l on b.BookID=l.BookID 
  join Member m on l.MemberID=m.MemberID;


--List currently borrowed books (ReturnDate IS NULL) along with the borrower's name and city.
 select b.Title,m.MemberName, m.City
  from Member m 
  join Loan l on m.MemberID=l.MemberID
   join Book b on l.BookID=b.BookID
    where l.ReturnDate is Null;


--List Pakistani authors and the titles of their books. Include Pakistani authors with no books
 select a.AuthorName, b.Title
  from Author a 
  left join Book b on a.AuthorID=b.AuthorID
   where a.Country = 'Pakistan';


--List every book together with the names of all members who have borrowed it. Include books that
--have never been borrowed
  select a.AuthorName 
  from Author a
   join Book b on a.AuthorID=b.AuthorID
    join loan l on b.BookID=l.BookID 
    where l.LoanID is null;

--Produce a FULL OUTER JOIN of Author and Book using UNION — every author and every book,
--matched where possible.
 select b.BookID, b.Title,b.Genre,b.Price,b.AuthorID,b.PublishedYear
  from Book b
   left join Author a on b.BookID=a.AuthorID 
   UNION 
   select b.BookID, b.Title,b.Genre,b.Price,b.AuthorID,b.PublishedYear
    from Book b
     right join Author a on b.BookID=a.AuthorID;


--List members who have borrowed books written by Pakistani authors. Show member name, book
--title, and author name
 select m.MemberName, b.Title, a.AuthorName 
 from Author a
  join Book b on a.AuthorID=b.AuthorID
   join Member m on a.AuthorID=b.AuthorID
    join loan l on m.MemberID=l.MemberID 
     where a.Country = 'Pakistan';

