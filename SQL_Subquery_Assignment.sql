create database comp7;

use comp7;

create table employee(
emp_id int primary key,
emp_name varchar(50),
department varchar(50),
salary decimal(10,2),
manager_id int);

insert into employee values 
(1,"Arjun","HR",40000,NULL),
(2,"Neha","IT",65000,5),
(3,"Rohan","IT",55000,5),
(4,"Meera","Finance",70000,NULL),
(5,"Suresh","IT",90000,4),
(6,"Alia","HR",45000,1),
(7,"Karan","Finance",75000,4),
(8,"Rahul","Marketing",30000,NULL),
(9,"Priya","Marketing",35000,8),
(10,"Varun","IT",50000,5);

select * from employee;

#Q1.List employees earning more than the average salary.
select emp_name,salary from employee
where salary>(select avg(salary) from employee);

#Q2.Find employees who earn the maximum salary.
select emp_name from employee
where salary=(select max(salary) from employee);

#Q3.Find employees working in the sale department as "Neha".
select emp_name,department from employee
where department=(select department from employee where emp_name="Neha");

#Q4.List employees whose salary is highest than Suresh's salary.
select emp_name,salary from employee
where salary>(select max(salary) from employee where emp_name="Suresh");

#Q5.Show department where the minimum salary is less than 40,000.
select department,salary from employee
where department in(select  department from employee group by department having min(salary)<40000);

#Q6.find employees who do not have a manager.
select emp_name,manager_id from employee
where emp_id not in(select manager_id from employee where manager_id is not NULL);

#Q7.Find employees who report to the same manager as Rohan.
select emp_name from employee
where manager_id=(select manager_id from employee where emp_name="Rohan");

#Q8.List employees in IT with salary above the IT average.
select emp_name,salary from employee where department="IT" and salary>(
select avg(salary) from employee where department="IT");

#Q9.Show employees whose salary is in the bottom 3.
select emp_name from employee 
where salary in(select salary from (select salary from employee order by salary limit 3)as t);

#Q10.Show employees whose salary is within the top 3.
select emp_name from employee 
where salary in(select salary from (select salary from employee order by salary DESC limit 3) as t);

#Q11.Find employees earning more than HR department average salary.
select emp_name,salary from employee
where salary>(select avg(salary) from employee where department="HR");

#Q12.List employees having the same salary as priya.
select emp_name,salary from employee
where salary=(select salary from employee where emp_name="Priya");

#Q13.Count employees who earn below overall average.
select emp_name, salary from employee
where  salary<(select avg(salary) from employee);

#Q14.Show employees whose manager earns more than 70000.
select emp_name,manager_id from employee 
where manager_id in(select emp_id from employee where salary>70000);

#Q15.Display employees in department where more than 2 employees work.
select emp_name,department from employee
where department in(select department from employee group by department having count(*)>2);

#Q16.Show departments where the average salary is above company average.
select department, avg(salary) from employee 
group by department having avg(salary)>(select avg(salary) from employee );

#Q17.Find the 2nd highest salary.
select emp_name,salary from employee
where salary<(select max(salary) from employee) order by salary desc limit 1;

#Q18.Employees with salary greater than the average salary of their manager's team.
select emp_name,salary from employee
where salary>(select avg(salary) from employee where manager_id=manager_id);

#Q19.Show employees who work in a department where Suresh works.
select emp_name,department from employee 
where department=(select department from employee where emp_name="Suresh");

#Q20.List employees whose manager earns the max salary.
select emp_name,manager_id from employee
where manager_id in(select manager_id from employee where salary=(select max(salary) from employee));

#Q21.Show employees whose salaries appear more than once.
select emp_name,salary from employee 
where salary in (select salary from employee group by salary having count(*) > 1);

#Q22.List employees earning less than the minimum IT salary.
select emp_name,salary from employee 
where salary<(select min(salary) from employee where department="IT");

#Q23.Show employees with salary higher than Finance average salary.
select emp_name, salary from employee 
where  salary>(select avg(salary) from employee where department="Finance" );

#Q24.Find employees earning exactly the 3rd highest salary.
select emp_name, salary from employee where salary=(select max(salary) from employee 
where salary<(select max(salary) from employee
where salary<(select max(salary) from employee )));

select emp_name from employee
where salary>(select salary from employee order by salary DESC limit 1 offset 2);

#Q25.List employees having salary in the same salary group as Meera’s department.
select emp_name, department, salary from employee 
where department=(select department from employee where emp_name = "Meera");

