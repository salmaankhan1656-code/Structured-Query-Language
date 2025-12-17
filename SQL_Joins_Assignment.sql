create database comp5;
use comp5;

create table employee(
emp_id int primary key,
emp_name varchar(50),
dept_id int,
salary decimal(10,2));

insert into employee values
(1,"John",101,50000),
(2,"Emma",101,65000),
(3,"Raj",102,45000),
(4,"Meera",103,70000),
(5,"Ravi",102,48000),
(6,"Naina",103,52000),
(7,"Alex",101,58000);

create table department(
dept_id int primary key,
dept_name varchar(50));

insert into department values
(101,"Sales"),
(102,"Marketing"),
(103,"Finance"),
(104,"HR");

#Q1.Display employee name with their department name.
select e.emp_name,d.dept_name
from employee e
inner join department d on e.dept_id=d.dept_id;

#Q2.List all employees including those with no matching department.
select e.emp_name,d.dept_name
from employee e
left join department d on e.dept_id=d.dept_id;

#Q3.List all departments even if no employees.
select e.emp_name,d.dept_name
from department d
left join employee e on d.dept_id=e.dept_id;#

#Q4.Show employee from sales department.
select e.emp_name,d.dept_name
from employee e
inner join department d on e.dept_id=d.dept_id
where d.dept_name="sales";

#Q5.Find top3 highest paid employees.
select e.emp_name,e.salary,d.dept_name
from employee e
inner join department d on e.dept_id=d.dept_id
order by e.salary DESC LIMIT 3;

#Q6.Find employees earning more than 50,000 from marketing.
select e.emp_name,e.salary,d.dept_name
from employee e
inner join department d on e.dept_id=d.dept_id
where d.dept_name="marketing" and salary>50000;

#Q7.Count Employees in each department.
select d.dept_name,count(e.emp_id)
from department d 
left join employee e on d.dept_id=e.dept_id
group by d.dept_name;

#Q8.Show department having more than 2 employees.
select d.dept_name, count(e.emp_id)
from department d
left join employee e on d.dept_id=e.dept_id
group by d.dept_name having count(e.emp_id)>2;

#Q9.Show highest salary in each department.
select d.dept_name,max(e.salary)
from department d
left join employee e on d.dept_id=e.dept_id
group by d.dept_name;

#Q10.Show employees whose salary is above department average.
select e.emp_name,e.salary,d.dept_name
from employee e
inner join department d on e.dept_id=d.dept_id
where e.salary>(select avg(e.salary)
from employee e 
where e.dept_id=e.dept_id);

#Q11.Show employee and their department sorted by department name.
select e.emp_name,d.dept_name
from employee e
inner join department d on e.dept_id=d.dept_id
order by d.dept_name ASC;

#Q12.List the 2 lowest-paid employees with departments names.
select d.dept_name,min(e.salary)
from department d
left join employee e on d.dept_id=e.dept_id
group by d.dept_name;

#Q13.Show total salary expenditure per department.
select d.dept_name,sum(e.salary)
from department d 
left join employee e on d.dept_id=e.dept_id
group by d.dept_name;

#Q14.Show department where total salary spent is more than 150,000.
select d.dept_name,sum(e.salary)
from department d
left join employee e on d.dept_id=e.dept_id
group by d.dept_name having sum(e.salary)>150000;

#Q15.Show employees who belong to department starting wih"S".
select e.emp_name,d.dept_name
from employee e
inner join department d on e.dept_id=d.dept_id
where d.dept_name like "S%";

#Q16.Find employees whose salary is the highest in their DESC.
select e.emp_name,e.salary,d.dept_name
from employee e
inner join department d on e.dept_id=d.dept_id
where e.salary=(select max(e.salary) from employee e);

#Q17.Show employees and department sorted by salary DESC.
select e.emp_name,e.salary,d.dept_name
from employee e
inner join department d on e.dept_id=d.dept_id
order by e.salary DESC;

#Q18.Count how many employees earn above 50,000 per department.
select d.dept_name,count(e.emp_id)
from department d
left join employee e on d.dept_id=e.dept_id
and e.salary>50000 group by d.dept_name;

#Q19.Show employee name, department, and salary for employees between 45000 and 60000.
select e.emp_name,e.salary,d.dept_name
from employee e
inner join department d on e.dept_id=d.dept_id
where e.salary between 45000 and 60000;

#Q20.Find department with on employee.
select d.dept_name
from department d
left join employee e on d.dept_id=e.dept_id
where e.emp_id is null;









