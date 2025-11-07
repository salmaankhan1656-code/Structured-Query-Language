create database comp;

use comp;

create table employees1(
id int primary key auto_increment,
name varchar(100),
position varchar(100),
salary decimal(10,2),
date_of_joining date);

insert into employees1(name,position,salary,date_of_joining)values
("John Doe","Manager",55000.00,"2020-01-15"),
("Jane Smith","Developer",48000.00,"2019-07-10"),
("Alice Johnson","Designer",45000.00,"2021-03-22"),
("Bob Brown","Developer",50000.00,"2018-11-01");

select * from employees1;

# Q1 Retrieve all employees1who are Developer.
select * from employees1 where position="Developer";

# Q2 update the salary all Alice johnson to 46000.00.
update employees1
set salary=46000.00 
where name="Alice Johnson";

SET SQL_SAFE_UPDATES=0;

# Q3 Delete the employees record for Bob Brown
delete from employees1 where name="Bob Brown";
 
# Q4 Find employees who have a salary grater than 48000
select * from employees1 where salary>48000;

# Q5 Add a new column"email" to the employees table
alter table employees1 add column email varchar(100);

# Q6 update the email for john doe to john.doe@company.com
update employees1 set email="Alice Johnson 000@gnail.com" where name="Alice Johnson";

truncate table employees1;

# Q7 retrieve only the name and salary of all employees
select name ,salary from employees1;

# Q8 count the number of employees who joined after january 1,2020
select count(*) from employees1
where date_of_joining>"2020-01-01";

# Q9 order the employees by salary in descending order
select * from employees1
order by salary DESC;

# Q10 drop the email column  from the employees table
alter table employees1
drop column email;

# Q11 Find the employees with the highest salary
select * from employees1
where salary=(select max(salary) from employees1);