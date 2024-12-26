create database sales;
use sales;

create table orders (
order_id int primary key unique,
Customer_name varchar (50),
product_category varchar  (50),
ordered_item varchar (150),
contact_No varchar  (15) not null
);
desc orders;

alter table orders
add order_quantity varchar (50);

Rename table orders to sales_orders;
insert into sales_orders (order_id,customer_name,product_category,ordered_item,contact_No,order_quantity)
values(1,'Sachin','Toothpaste','Colcate',8252259631,2),
(2,'Ganguly','Brush','Pepsodent',9363467391,10),
(3,'Dravid','Dish wash','pril',7391497692,6),
(4,'Dhoni','soap','Santoor',6979431846,8),
(5, 'Yuvi','Body Cream','Nivia',9346193738,5),
(6,'Raina','Energy powder','Boost',3917284692,20),
(7,'Shweag','Milk','Milma',7946131976,15),
(8,'Gambir','tea','3Roses',9946485825,4),
(9, 'vikey','shoe','addidas',9977558866,11),
(10,'jaddu','Chappal','Nike',7799446622,11);

select * from sales_orders;

select	customer_name,ordered_item from sales_orders;

update sales_orders
set product_category = 'mouthwash'
where order_id = 1;

select * from sales_orders;

drop table sales_orders;



