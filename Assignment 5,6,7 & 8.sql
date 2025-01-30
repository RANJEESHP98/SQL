create database Countriees;
use countriees;

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

select * from persons;

select substring(country_name,1,3) as First_three_char
from country;

select first_name, Last_name,concat( first_name,'  ',last_name) as full_name 
from persons;

select count(distinct country_name) from persons;

select max(population) from country;

select min(population) from persons;

insert into persons (person_Id, first_name, Last_name, Population, Rating, CountryId, Country_name)
values
(11,'krithik','null',2899565,3.2,11,'NEW_YORK'),
(12,'ASWIN','null',36564542,3.0,12,'England');

update persons
set last_name = ''
where person_id = 12;

update persons
set last_name = ''
where person_id = 11;

select count(last_name) from persons;

select count(*) from persons;

select population
from country 
limit 3;

select * from country 
order by rand()
limit 3;

select * from persons
order by  rating desc; 

select country_name,sum(population) as Total_population
from persons
group by country_name;

select country_name, sum(population) as totalpopulation
from persons
group by country_name having sum(population)>50000;

select country_name, count(*),avg(rating) as avg_rating
from persons
group by country_name having count(*)>2
order by avg(rating) asc;

SELECT 
    c.country_name AS country_namee,c.population AS country_population,c.area AS country_area,
    p.person_id,p.first_name,p.last_name,p.population AS person_population,p.rating,p.countryid,p.country_name AS country_name
FROM country c
INNER JOIN persons p ON c.country_id = p.countryid;

select 
 c.country_name AS country_namee,c.population AS country_population,c.area AS country_area,p.person_id,
    p.first_name,p.last_name,p.population AS person_population,p.rating,p.countryid,p.country_name AS country_name
FROM country c
left join  persons p ON c.country_id = p.countryid;

select 
c.country_name AS country_namee,c.population AS country_population,c.area AS country_area,p.person_id,
p.first_name,p.last_name,p.population AS person_population,p.rating,p.countryid,p.country_name AS country_name
FROM country c
Right join persons p ON c.country_id = p.countryid;

select distinct country_name
from country 
union
select distinct country_name
from persons;

select distinct country_name
from country 
union all
select distinct country_name
from persons;

select first_name, Last_name, round(rating)
from persons;

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

select country_name, count(*) as no_of_persons
from persons
group by country_name;

update persons
set country_name = 'Uk'
where person_id = 9;

update persons
set country_name = 'india'
where person_id = 10;

select country_name, count(*) as no_of_persons
from persons
group by country_name 
order by no_of_persons desc;

select country_name, avg(rating) as Avg_rating
from persons
group by country_name
having avg(rating) >3.0;

update persons
set country_name = 'USA'
where person_id = 1;

select distinct country_name
from persons
where Rating = (select rating from persons where country_name = 'USA');

select  country_name, population
from country
where population > (select avg(population) from country);

create database product;
use product;

create table customer (
customer_id int (10) primary key,
first_name varchar (20),
Last_name varchar (20),
email varchar (100),
phone_no int (10),
address varchar (100),
city varchar (50),
state varchar (50),
zip_code varchar (10),
country varchar (20));

insert into customer (customer_id,first_name,last_name,email,phone_no,address,city,state,zip_code,country)
values
(01,'Aswin','kashi','aswinkashi@gmail.com',912546780,'852 West Street Sacramento','Newyork','US','US2121','USA'),
(02,'Ajay','Menon','ajaymenon@gmail.com',882511651,'91 Devonshire Circle Hesperia', 'CA', 'US','CA92345','California');
(03,
desc customer;

create view customer_info as
select concat (first_name,' ' ,last_name) as Full_name,Email
from customer;

select * from customer_info;

create view US_customers as
select * from customer
where country = 'USA';

create view customer_details as
select concat(first_name,' ',Last_name) as full_name,Email,phone_no,state
from customer;

set sql_safe_updates = 0;

update customer
set phone_no = 154678165
where state = 'california';
set sql_safe_updates = 1;

select state, count(*)  as count_states
from customer
group by state
having count(*) > 5 ;

select state, count(*) as NO_customer
from customer_details
group by state;


select * 
from customer_details
order by state asc;
















 



























