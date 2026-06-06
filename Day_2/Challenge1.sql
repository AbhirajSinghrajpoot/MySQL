create database peoples;
use peoples;

create table people (
id int primary key AUTO_INCREMENT,
first_name varchar(20),
last_name varchar(20),
age int 
);

insert into people(first_name, last_name, age)
values('Linda','Belcher', 45),
('Philips', 'Frond', 38),
('Calvin', 'Fischoeder', 70);

select * from people;

