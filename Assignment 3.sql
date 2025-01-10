create database Employers;
use employers;

create table Managers (
Manager_id int auto_increment primary key,
First_name varchar (20) NOT NULL,
Last_name varchar (20) NOT NULL,
Date_of_Birth date  NOT NULL,
Age int CHECK ( AGE > 18),
Gender char (1) check (Gender in ('M','F','O')),
Department varchar (25) NOT NULL,
salary DECIMAL (10,2) not null);
 
 SELECT * FROM managers;
 INSERT INTO MANAGERS (first_name,LAST_NAME,DATE_OF_BIRTH,AGE,GENDER,DEPARTMENT,SALARY)
 VALUES ('Renjith','PR','1998-10-12',25,'M','IT',36000),
 ('ARJUN','VASU','1997-05-15',26,'M','FINANCE',12000),
 ('AALIYA','KP','1995-10-20',28,'F','IT',25000),
 ('Swetha','Mohan','1999-12-07',25,'F','ACCOUNTANT',8000),
 ('KESHU','DAS','1993-10-15',31,'M','OPERATION',35000),
 ( 'DASAN','KL','1998-03-18',26,'M','ANALYST',26000),
 ('VIKY','BK','1998-12-20',26,'M','Supervisor',25000),
 ( ' ABHI','MM','1997-08-16',27,'M','OPERATION',12000),
 ('KRITHI','KP','1996-07-29',25,'F','CRM',18000),
 ( 'SUNI','ANIL','1995-01-16',27,'F','FINANCE',18000);
 
 SELECT * FROM MANAGERS;
 
 SELECT  MANAGER_ID,first_name,LAST_NAME,(SALARY*12 ) 
 AS ANNUAL_INCOME FROM MANAGERS;
 
 SELECT *FROM MANAGERS
 WHERE FIRST_NAME!= 'Aaliya';
 
 select * from managers
 where department ='IT' and SALARY > 25000;
 
select * from managers
where salary between 10000 and 35000;
 




