create database Cats1;

use Cats1;

create table for_default(
 name varchar(100) NOT NULL default 'unnamed',
 age INT NOT NULL default 99
 );
 
 insert into for_default(name, age)
 values ('disana', 4);
 
 select * from for_default;