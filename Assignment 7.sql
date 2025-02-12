create database Countriees3;
use countriees3;


create table country ( 
country_id int auto_increment primary key,
country_name varchar (25) not null,
Population int (20) NOT NULL,
AREA int (25) NOT NULL);

desc country;


create table persons (
person_id int (10) primary key,
first_name varchar (20),
Last_name varchar (20),
population int (20),
rating decimal (1,1) check (rating > 0),
Countryid int (12),
country_name varchar(25));

  insert into country (country_name,population,area)
values ('America', 1025000,23521),
('Canada',250001,23594),
('Brazil',3250000,25132),
('Germany',25637899,10235203),
('korea',203456849,1246789),
('China',26458911,223044567),
('India',501456891,33021456),
('Australia',35261451,23254787),
('New zeland',565444778,99845622),
('South Africa',666454782,99945778);

select *  from country;


ALTER TABLE persons MODIFY COLUMN rating DECIMAL(3, 1);


insert into persons (person_Id, first_name, Last_name, Population, Rating, CountryId, Country_name)
values 
(1, 'John', 'Doe', 331000000, 4.2, 1, 'America'),
(2, 'Jane', 'Smith', 38000000, 4.7, 2, 'Canada'),
(3, 'Emily', 'Clark', 67886000, 3.8, 3, 'UK'),
(4, 'Amit', 'Sharma', 1390000000, 4.5, 4, 'India'),
(5, 'Sophia', 'Wilson', 25687000, 4.9, 5, 'Australia'),
(6, 'Michael', 'Brown', 83167000, 4.3, 6, 'Germany'),
(7, 'Olivia', 'Martin', 65426000, 4.1, 7, 'New zeland'),
(8, 'David', 'Lee', 60263000, 3.6, 8, 'South Africa'),
(9, 'Yuki', 'Tanaka', 125800000, 4.8, 9, 'China'),
(10, 'Hana', 'Kim', 51780000, 4.4, 10, 'Korea');



alter table persons
add DOB date;

delimiter $$
create function date_birth (DOB DATE)
returns int
deterministic
no sql
begin
declare age int;
set age  = timestampdiff(year,dob,curdate());
return age;
end $$
delimiter ;

select person_Id, first_name, Last_name,DOB,date_birth (dob) as AGE
from persons;

select country_name, length(country_name) 
from country;

select country_name, left(country_name,3)
from country;	

select country_name, upper(country_name) as Capital_letter,
lower(country_name) as small_letter
from country;