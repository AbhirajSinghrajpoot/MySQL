CREATE DATABASE cat;

USE cat;

CREATE TABLE billie (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    age INT
);

insert into billie(name, age)
values('Draco', 11),('Romio', 5), ('Shaan', 7), ('Gail', 2);

select * from billie;



