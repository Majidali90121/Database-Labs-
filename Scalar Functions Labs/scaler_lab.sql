/* ====================================Part A ======================================*/

--List each customer's name with leading and trailing spaces removed, alongside the original. Show CustID, original
--CustName, CleanedName.
 select CustID, CustName As Original_Name, 
 Trim(CustName) As Cleaned_Name
  from Customer;

--Display every customer name in UPPERCASE and the same name in lowercase. Show CustID, UpperName,
--LowerName
 select CustID, upper(CustName) As UpperName,
  lower(CustName) As LowerName
   from customer;


--For each customer, show their trimmed name and the number of characters in it.
 select trim(CustName) as Trimmed_Name ,
  char_length(CustName) As Lenth
   from customer;


--Build a greeting column for each customer: 'Dear <trimmed name>, welcome!
 select concat('Dear ', trim(CustName), ' ,welcome!') 
 from customer;

--For customers who have an email, extract the part before the '@' (the username). Show CustName and
--Username.
 select custName, substring(Email, locate('@', Email) -5) AS Username
  from Customer;

--For customers who have an email, extract the domain (everything after '@'). Show CustName and Domain
select custName, Email,
 substring(Email, locate('@', Email) +1) AS Domain
  from Customer;

--Show each customer's name with the first 3 characters only.
 select left(CustName, 3) 
 from Customer;

--Mask each phone number: show the country/area code (first 4 chars), then 'XXX-XXXX'. Skip customers with no
--phone
 select concat(left(phone,4), 'XXXXXXX') As Masked_Phone
  from Customer 
  where phone is not null;

--Show each product name with all spaces replaced by hyphens. Show ProdID and SlugName
 select ProdID, Replace(ProdName,' ','-') As Slug_Name
  from Product;


--Show each ProdID padded to 5 digits with leading zeros 
select LPAD(CUSTID, 5, 0)
 FROM Customer;


--Show product names that contain the word 'Pro' anywhere
 select ProdName , 
 locate('Pro', ProdName)
  from Product;


--======================================================================= Part B===========================


--Apply a 15% discount to every product. Show ProdName, Price, DiscountedPrice rounded to 2 decimals.
 select ProdName , 
 round(Price , 2) As Price, 
 round(Price - Price * 0.15,2) As Discounted_Price
  from Product;



--For each product, compute 17% sales tax and the final price (price + tax). Show ProdName, Tax, PriceWithTax.
 SELECT ProdName ,
  round(Price * 0.17 , 2) As Tax,
   round(Price + Price * 0.17,2) As Price_with_Tax
    from Product;


--Compute the floor and ceiling of every product's price divided by 1000. Show ProdName, Price, FloorVal, CeilVal.
 select ProdName, Price, 
 floor(Price/1000) As FloorVal,
  Ceil(Price/1000) As CeilVal
   from Product;


--Round each product's price to the nearest hundred. (Hint: ROUND with negative second argument, e.g.
--ROUND
SELECT ProdID, ProdName 
from Product
 where MOD(ProdId,2) != 0;


--For each customer, show the year, month name, and day of the week they joined.
Select CustName, JoinDate ,
Year(JoinDate) As Year,
 Monthname(JoinDate) as Month, 
 Dayofweek(JoinDate)AS Day
  from Customer;

--Display each customer's date of birth formatted as 'DD-Month-YYYY'
 select CustName, DOB,
  Date_format(DOB, '%d %M %Y') as FormattedDate 
  from Customer;


--Compute each customer's current age in years. Show CustName, DOB, Age.
 select CustName, DOB,
  timestampdiff(year, DOB, CURRENT_DATE()) As Age
   from Customer;


--Compute how many days ago each customer joined (from today). Show CustName, JoinDate, DaysSinceJoin
 select CustName, JoinDate, 
 timestampdiff(day, JoinDate, CURRENT_DATE()) As DaysSinceJoin
  from Customer;

--List customers who joined in the year 2023. Use a date function, not BETWEEN
 select CustName, JoinDate
  from Customer 
  where year(JoinDate) = '2023';


--List products launched in any year's Q4
select ProdName, LaunchDate
 from Product
  where Month(LaunchDate) In (10,11,12)
   order by LaunchDate;


--Find customers who joined within the last 6 months from today. Use DATE_SUB
 select CustName, JoinDate 
 from Customer 
 where JoinDate >= Date_sub(curdate(), interval 6 month);



--Calculate each product's 'age' in days (days since launch). Show ProdName, LaunchDate, AgeInDays
 select ProdName, LaunchDate,
  timestampdiff(day,LaunchDate , curdate()) As AgeInDays 
  from Product;


--Compute the date exactly 90 days from each product's LaunchDate. Show ProdName, LaunchDate,
--NinetyDaysLater.
 select ProdName, LaunchDate,
  date_add(LaunchDate, interval 90 day)As NintyDayLater
   from Product;

--Combined challenge: produce a single column called 'Summary' formatted as 'Hello ALI KHAN, age 31, joined
--Jan 2022' for every custome
 select concat('Hello ', trim(upper(CustName)), ' ,age ',timestampdiff(year, DOB, curdate())  , ' joined: ', date_format(JoinDate, '%M %Y')) as Summary from Customer;

/* =============================================== Questions ================================================*/
--Display each employee's full name with leading/trailing spaces removed and in proper UPPERCASE.
--Show EmpID, original FullName, CleanedName.
 SELECT EmpID, FullName As Original_Full_Name,
  trim(upper(FullName)) Cleaned_Name
   from Employee;


--For employees with a recorded email, extract the username (part before '@'). Show FullName and
--Username
 SELECT FullName,
  substring(Email, locate('@', Email) - 6) As Username 
  from Employee;


--Mask each phone number: show the first 4 characters then 'XXX-XXXX'. Skip employees with no
--phone
 SELECT EmpID, FullName, concat(left(phone, 4), 'XXXXXXX') As phone
  from Employee
   where phone is not null;

--Generate a corporate email for each employee: lowercase the trimmed FullName, replace spaces
--with dots, then append '@company.com'. (e.g. 'AHMAD RAZA' -> 'ahmad.raza@company.com'.)
--Show FullName and GeneratedEmail.
 SELECT FullName,
  concat(trim(lower(replace(FullName, ' ', '.'))),'@company.com') As GeneratedEmail
   from Employee;


--Apply a 12.5% pay raise to every employee. Show FullName, Salary, NewSalary rounded to 2
--decimals
 SELECT FullName, Salary,
  round(Salary+ Salary*0.125,2) As NewSalary 
  from Employee;
  
  --Round every salary down to the nearest thousand. Show FullName, Salary, RoundedSalary.
   SELECT FullName, Salary, 
   round(Salary,1) As RoundedSalary 
   from Employee;


--Compute each employee's current age and years of service. Show FullName, AgeYears,
--YearsOfService
 SELECT FullName, 
 timestampdiff(year, DOB, curdate()) As AgeInYears ,
  timestampdiff(year, HireDate, Curdate()) As yearsOfService 
  from Employee;


--Format every employee's HireDate as 'DD-Mon-YYYY' (e.g. '01-Sep-2018'). Show FullName and
--FormattedHireDate
 SELECT FullName,
  Date_format(HireDate, '%d-%M-%Y') As FormattedHireDate
   from Employee;


--List employees who were hired in the year 2019 or later. Use a date function rather than BETWEEN.
 SELECT FullName, HireDate
  from Employee
   where year(HireDate) >= '2019';




--Combined challenge: produce a single column 'Profile' formatted as: 'AHMAD RAZA | Lahore |
--Senior Engineer | Joined: 01-Sep-2018 | Age: 35'. Use CONCAT, UPPER, TRIM, DATE_FORMAT,
--TIMESTAMPDIFF.
 SELECT concat(trim(upper(FullName)), ' | ' , City, ' | ' , JobTitle, ' | ', ' Joined: ' , Date_format(HireDate, '%d-%M-%Y'), ' | ', 'Age: ', timestampdiff(year, DOB, curdate())) as Profile from Employee;