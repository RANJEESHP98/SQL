create database school_infomation;
use school_infomation; 

create table teachers (
id int auto_increment primary key,
Full_name  varchar (25),
sub varchar(25),
experience decimal (10,2) not null,
salary decimal  (10,2) not null
);


insert into teachers (Full_name,sub,experience,salary)
values ('Alina_peter','Mathamatics',3,25000.00),
('Ashok_Kumar','Physcis','5',80000.00),
('Ambu','Chemistry','2',18000.00),
('Keerthi','Malayalam',3,22000.00),
('Shambu','English',12,95000.00),
('Kajal','Hindi',2.5,21500.00),
('Vijay','P.T',2,20000.00),
('Sreega','Biology',5,80000.00);


delimiter //
create trigger before_insert_teacher
before insert on teachers
for each row
begin 
if new.salary<0 then
signal sqlstate '45000'
set message_text ='salary cannot be zero';
end if;
end;
//
delimiter ;

create table teacher_log(
log_id int auto_increment primary key,
teacher_id int (20),
Action_type varchar (50),
time_stamp datetime default current_timestamp);


delimiter //
create trigger after_insert_teacher
after insert on teachers
for each row 
begin
 insert into teacher_log (teacher_id,action_type)
  values (new.id,'insert');
  end;
  //
  delimiter ;




delimiter //
create trigger before_delete_trigger
before delete on teachers
for each row
begin
if old.experience>10 then
signal sqlstate '45000'
set message_text = 'cannot delete experience more than 10 years ';
end if;
end //
delimiter ;

delete from teachers 
where full_name = 'shambu';

delimiter //
create trigger afterdeletetrigger
after delete on teachers
for each row
begin
insert into teacher_log (teacher_id,action_type)
values (old.id,'delete');
end //
delimiter ;

select * from teacher_log;

delete from teachers
where id = 9;
















