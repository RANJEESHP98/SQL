create database Countries;
use countries;

create table country ( 
country_id int auto_increment primary key,
country_name varchar (25) not null,
Population varchar (20) NOT NULL,
AREA VARCHAR (25) NOT NULL);

create table persons (
person_id int (10) primary key,
first_name varchar (20),
Last_name varchar (20),
population varchar (20),
rating decimal (1,1) check (rating > 0),
Countryid int,
country_name varchar (25),
  foreign key (countryid) references country(country_id));

insert into country (country_name,population,area)
values 
('America', 1025000,23521);

insert into country (country_name,population,area)
values 
('Canada',250001,23594),
('Brazil',3250000,25132),
('Germany',25637899,10235203),
('korea',203456849,1246789),
('China',2226458911,223044567),
('India',22501456891,3302145698),
('Australia',35261451,2325478788),
('New zeland',5654447778,9984562231),
('South Africa',6664547823,99945778);
select * from country;
insert into country (country_name,population,area)
values 
('UK',88454121,332164457);

ALTER TABLE persons MODIFY COLUMN rating DECIMAL(3, 1);

insert into persons (person_Id, first_name, Last_name, Population, Rating, CountryId, Country_name)
values 
(1, 'John', 'Doe', 331000000, 4.2, 1, 'America');
insert into persons (person_Id, first_name, Last_name, Population, Rating, CountryId, Country_name)
values 
(2, 'Jane', 'Smith', 38000000, 4.7, 2, 'Canada'),
(3, 'Emily', 'Clark', 67886000, 3.8, 3, 'UK'),
(4, 'Amit', 'Sharma', 1390000000, 4.5, 4, 'India'),
(5, 'Sophia', 'Wilson', 25687000, 4.9, 5, 'Australia'),
(6, 'Michael', 'Brown', 83167000, 4.3, 6, 'Germany'),
(7, 'Olivia', 'Martin', 65426000, 4.1, 7, 'New zeland'),
(8, 'David', 'Lee', 60263000, 3.6, 8, 'South Africa'),
(9, 'Yuki', 'Tanaka', 125800000, 4.8, 9, 'China'),
(10, 'Hana', 'Kim', 51780000, 4.4, 10, 'Korea'),
(11, ' Haski','pep',12132451,4.1,11,'brazil');

select * from persons;
select country_name from persons;

select first_name as f_name,
last_name as L_name
from persons;

select *from persons
where rating >4.0;

select * from country
where population > 1000000;

select * from persons
where country_name ='America' or rating > 4.5;

select * from persons
where country_name = null;

select * from persons
where country_name in ('America','canada','UK');

select * from persons
where country_name not in ('india','australia');

select * from country
where population between 500000 and 2000000;

select * from country
where  country_name  not like'c%';







