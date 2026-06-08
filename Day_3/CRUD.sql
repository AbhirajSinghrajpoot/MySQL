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

select * from cats;
select name from cats;
select breed from cats;
select age from cats;
select name, breed from cats;
select * from cats where age=4;

select name AS 'Cat Name', breed AS 'Kitty breed' from cats;

UPDATE cats
SET breed = 'ShortHair'
WHERE breed = 'Tabby';

UPDATE cats
SET age = 14
WHERE name = 'Misty';

delete from cats where name = 'Egg';

select * from cats 
