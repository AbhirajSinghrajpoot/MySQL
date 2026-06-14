create database relationship_db;

use relationship_db;
drop table customers;
drop table orders;

CREATE TABLE customers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE orders(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    foreign key(customer_id) references customers(id)
);

INSERT INTO customers(first_name, last_name, email)
VALUES
('Boy', 'George', 'george@gmail.com'),
('George', 'Michael', 'gm@gmail.com'),
('David', 'Bowie', 'david@gmail.com'),
('Blue', 'Steele', 'blue@gmail.com'),
('Bette', 'Davis', 'bette@aol.com');

INSERT INTO orders(order_date, amount, customer_id)
VALUES
('2016-02-10', 99.99, 1),
('2017-11-11', 35.50, 1),
('2014-12-12', 800.67, 2),
('2015-01-03', 12.50, 2),
('1999-04-11', 450.25, 5);

SELECT * FROM customers;

SELECT * FROM orders;



select * from customers, orders;

-- ------------------------------
-- IMPLICIT INNER JOIN
-- ------------------------------

select * from customers, orders
    where customers.id = orders.customer_id;

select first_name, last_name, order_date, amount 
from customers, orders
    where customers.id = orders.customer_id;

-- ------------------------------
-- EXPLICIT INNER JOIN
-- ------------------------------

select * from customers
JOIN orders
     ON customers.id = orders.customer_id;

select first_name, last_name, order_date, amount 
from customers
JOIN orders
	ON customers.id = orders.customer_id;

-- ------------------------------
-- ARBITARY INNER JOIN - DON'T do this!
-- ------------------------------

select * from customers
JOIN orders
     ON customers.id = orders.id;

select first_name, last_name, order_date, amount 
from customers
JOIN orders
	ON customers.id = orders.id;
    
    
    
SELECT
    first_name,
    last_name,
    SUM(amount) AS total_spent
FROM customers
JOIN orders
    ON customers.id = orders.customer_id
GROUP BY customers.id
ORDER BY total_spent DESC;
    