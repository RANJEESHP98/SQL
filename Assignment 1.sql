#Createing database Students;

Create database Students;
use Students;

Create table Student_details
(Roll_No int  primary key,
First_Name varchar (25) not null,
Second_Name varchar (25) not null,
Marks int (15) not null,
Grade varchar (10) not null);

desc student_details;
-- Add details--

Insert	into student_details (Roll_No, First_Name, Second_name,marks,Grade)
values (1,"Sachin", "T", 80, "A"),
(2,"YUVI", "Singh", 65,"B+"),
(3, "DHONI", "M.S", 95, "A+");

select * from student_details;

-- Add contact--
alter table student_details
add Contact varchar (12);

select * from student_details;

-- Remove Grade--
alter table student_details
Drop grade;

desc student_details;

-- Rename Table --
Rename table student_details to CLASSTEN;

desc classten;
select * from classten;

-- Delete Rows--
Truncate table classten;

select * from classten;

-- delete table--
Drop table classten;

select * from classten;






