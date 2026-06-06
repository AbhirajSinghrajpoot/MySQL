create database company;

use company;

create table employees(
id INT NOT NULL AUTO_INCREMENT,
first_name VARCHAR(255) NOT NULL,
middle_name VARCHAR(255),
last_name VARCHAR(255) NOT NULL,
age INT NOT NULL,
current_status VARCHAR(100) NOT NULL DEFAULT 'employed',
PRIMARY KEY (id)
);

INSERT INTO employees 
(first_name, middle_name, last_name, age)
VALUES
('Arpit', 'Singh', 'Rajpoot', 20),
('Rahul', NULL, 'Sharma', 25),
('Aman', 'Kumar', 'Verma', 30);

select * from employees;
