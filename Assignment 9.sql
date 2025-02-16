
create database company;
use company;

CREATE TABLE workers (
worker_id INT AUTO_INCREMENT PRIMARY KEY,
first_name CHAR(25),
last_name CHAR(25),
salary INT (15),
joining_date DATETIME,
department CHAR(25)
);

insert into workers(first_name,last_name,salary,joining_date,department)
values ('Aswin','sasi',25000,'20.12.2010','Hr'),
('Abhinav','Menon',34000,'18.07.2010','Accountant'),
('Vignesh','Bhagavathy',55000,'22.10.2015','Manager'),
('Ranjeesh','Perumbidi',68000,'10.02.2018','Analyst');


insert into workers(first_name,last_name,salary,joining_date,department)
values ('Nithin','Krishna',35000,'23.02.2019','IT'),
('Krisha','DAS',32000,'24.10.2019','Supervisor'),
('Madhavan','Unni',28500,'07.07.2017','CRM');

select* from workers;
delimiter //
create procedure workerdetails(in dept_name varchar(25))
begin
select w.first_name,w.last_name,w.salary,w.joining_date,w.department
from workers w
where w.department = dept_name;
end//
delimiter ;

call workerdetails('Supervisor');

# using stored procedure in and out parameters

delimiter //
create procedure total_salary(in workers_id int, out salaries decimal(10,2),out work_id int)
begin
select salary,worker_id into salaries,work_id
from workers
where workers_id = worker_id;
end //
delimiter ;


drop procedure total_salary;
set @salaries = 0;
set @work_id = 0;
CALL total_salary(2,@salaries,@work_id);

SELECT @work_id as worker_id,@salaries as P_salary;

delimiter //
create procedure workers_details(in workers_id int,in new_department char (25))
begin
update workers 
set department = new_department
where worker_id = workers_id;
end//
delimiter ;

drop procedure workers_details;

call workers_details(2,'security');

select * from  workers;

delimiter //
create procedure company_details(in department_details char (25) , OUT p_work_count int,out departmentname char (25))
begin
select count(*) into p_work_count 
from workers
where department = department_details;
set departmentname = department_details;
end //
delimiter ;



drop procedure salarydetails;

set @workerscount = 0;
set @departmentname =' ';
call company_details('HR', @workerscount, @departmentname);

select @workerscount as p_workercount,@departmentname;

delimiter //
create procedure salarydetails(in department_name char (25), out avg_salary decimal(10,2))
begin
select avg(salary) into avg_salary
from workers
where department = department_name;
end //
delimiter ;

set @avgsalary = 0;
call salarydetails('IT', @avgsalary);

select @avgsalary as avg_salary;

















