create database trigger_db;

use trigger_db;


create table users(
        id int auto_increment primary key,
        name varchar(255),
        age int
);
 insert into users(name, age)
 values ('yang', 65),
		('aaman', 19);
        
select * from users;
        















