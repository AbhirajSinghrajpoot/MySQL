create database cat;

use cat;

create table cats
(
cat_id INT NOT NULL auto_increment,
name VARCHAR(100),
breed VARCHAR(100),
age INT,
primary key (cat_id)
);

INSERT INTO cats(name, breed, age)
VALUES 
('Ringo', 'Tabby', 4),
('Cindy', 'Maine Coon', 10),
('Dumbledore', 'Maine Coon', 11),
('Egg', 'Persian', 4),
('Misty', 'Tabby', 13),
('George Michael', 'Ragdoll', 9),
('Jackson', 'Sphynx', 7);


delete from cats where name = 'Egg';
select * from cats;