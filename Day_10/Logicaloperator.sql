CREATE DATABASE library_db;
USE library_db;

CREATE TABLE books (
    book_id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(100),
    author_fname VARCHAR(100),
    author_lname VARCHAR(100),
    released_year INT,
    stock_quantity INT,
    pages INT,
    PRIMARY KEY(book_id)
);


INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman', 2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
('Where I''m Calling From: Selected Stories', 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

INSERT INTO books
(title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('10% Happier', 'Dan', 'Harris', 2014, 29, 256),
('fake_book', 'Freida', 'Harris', 2001, 287, 428),
('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);


select * from books;

drop table books;

select title, author_fname, author_lname, released_year from books where released_year = "2017";



select * from books 
where author_lname = 'Eggers' and  
released_year > "2010";

select * from books 
where author_lname = 'Eggers' and  
released_year > "2010" AND
title LIKE '%novel%';


select  1 < 5 && 7 = 9;

select -10 > -20 && 0 <= 0;

select -40 <= 0 AND 10 > 40;

select 54 <= 54 && 'a' = 'A';




select * from books 
where author_lname = 'Eggers' OR 
released_year > "2010";

select title, author_fname, released_year from books 
where author_lname = 'Eggers' ||
released_year > "2010";


select 40 <= 100 || -2 > 0;

select 10 > 5 || 5 = 5;

select 'a' = 5 || 3000 > 2000;

select title, author_fname, author_lname, released_year, stock_quantity from books 
where author_lname = 'Eggers' ||
released_year > "2010" or
stock_quantity > 100;


select * from books 
where released_year  >= 2004 and  
released_year < "2010"
order by released_year;

select * from books 
where released_year between 2004 and "2015"
order by released_year;

select * from books 
where released_year NOT between 2004 and "2015"
order by released_year;


select cast('2017-05-02' AS datetime);

select * from books 
where released_year between 2010-05-02 and "2017-05-02"
order by released_year;
