/* Very Easy: Create a table with your top three cars and include make, model, year. Create a query to add in two more cars */
CREATE DATABASE mysqlGI;

USE mysqlGI;

CREATE TABLE cars (
 	id INT NOT NULL AUTO_INCREMENT,
    car_year INT,
    car_make VARCHAR(100),
    car_model VARCHAR(100),
    PRIMARY KEY(id)
);
INSERT INTO cars
 	(car_year, car_make, car_model)
VALUES
	(2020, 'BMW','i8'),
    (2020, 'KIA','K5'),
    (2022, 'Audi','A5')
;

/* Easy: Create a table with your top five favorite books with Title, Publish Date, and
Author First/Last Name Create a query to add in two new books Remove the oldest book Provide an additional query giving the sum of all books */
CREATE TABLE books (
 	id INT NOT NULL AUTO_INCREMENT,
 	title VARCHAR(100),
    publish_date DATE,
    author_first VARCHAR(100),
    author_last VARCHAR(100),
    PRIMARY KEY(id)
);
INSERT INTO books
 	(title, publish_date, author_first, author_last)
VALUES
 	('Harry Potter and the Sorcerers Stone', '1997-06-26', 'Joanne', 'Rowling'),
    ("The Notebook", "1996-10-01", "Nicholas", "Sparks"),
    ('Charlie and the Chocolate Factory', '1964-01-17', 'Roald', 'Dahl'),
    ('Da Vinci Code', '2003-03-18', 'Dan', 'Brown'),
    ("Things Fall Apart", "1958-07-02", "Chinua", "Achebe"),
;

DELETE FROM books
ORDER BY publish_date
LIMIT 1;
    
/* Medium: Create a table with your top 10 movies. Include title, release date, and rating 
Create a query that pulls all movies, in order of release date, where the title includes the letter “s”. */
CREATE TABLE movies(
	id INT AUTO_INCREMENT NOT NULL,
	title VARCHAR(100),
	release_date DATE,
	rating FLOAT,
	PRIMARY KEY (id)
);
INSERT INTO movies(
 	title, release_date, rating)
VALUES
    ('Gone Girl', '2014-03-10', '8.1'),
    ('Avengers: Infinity War', '2018-04-23', '8.4'),
    ('Teen Beach Movie', '2013-07-19', '5.8'),
    ('Marriage Story', '2019-11-15', '7.9'),
    ('Fractured', '2019-09-22', '6.4'),
    ('The Dark Knight', '2008-07-18', '9.1'),
    ('The Godfather', '1972-03-24', '9.2'),
    ('The Shawshank Redemption', '1994-10-14', '9.3'),
    ('Joker', '2019-10-04', '8.4'),
    ('The Batman', '2022-03-04', '8.5')
;
SELECT * FROM movies
WHERE title LIKE ("%s%")
ORDER BY rating ASC;
/* 
Hard: Make a copy of your Medium Challenge Write out the queries that would add the director’s 
First Name and Last Name into two separate columns. Create a query that puts the names together. 
Create a query to put the list in alphabetical order by the last name from A-Z 
After you order the list, remove the Movies where the Last Name ends with ”R-Z” Write a query where the first three appear */
CREATE TABLE movies2(
	id INT AUTO_INCREMENT NOT NULL,
	title VARCHAR(80),
	release_date DATE,
	rating FLOAT,
	PRIMARY KEY (id)
);
ALTER TABLE movies2
ADD director_first VARCHAR(80),
ADD director_last VARCHAR(80);

INSERT INTO movies2(
 	title, release_date, rating, director_first, director_last)
VALUES
    ('Toy Story', '1995-11-2', '8.3', 'John', 'Lasseter'),
    ('The Matrix', '1999-03-31', '8.7', 'Lana', 'Wachowski'),
    ('The Dark Knight Rises', '2012-07-20', '8.4', 'Christopher', 'Nolan'),
    ('The Dark Knight', '2008-07-18', '9.1', 'Christopher', 'Nolan'),
    ('Forrest Gump', '1994-06-14', '8.8', 'Robert', 'Zemeckis'),
    ('The Godfather', '1972-03-24', '9.2', 'Francis Ford', 'Coppola'),
    ('Inception', '2010-07-16', '8.8', 'Christopher', 'Nolan'),
    ('The Shawshank Redemption', '1994-10-14', '9.3', 'Frank', 'Darabont'),
    ('Joker', '2019-10-04', '8.4', 'Todd', 'Phillips'),
    ('The Batman', '2022-03-04', '8.5', 'Matt', 'Reeves')
;
SELECT CONCAT(director_first, ' ', director_last) AS full_name,title, release_date,rating FROM movies2;
SELECT * FROM movies2
ORDER BY director_last ASC;
SET SQL_SAFE_UPDATES = 0;
DELETE FROM movies2 WHERE REGEXP_LIKE (director_last, '[r-z]$','i');
SELECT * FROM movies2 LIMIT 3;



-- VERY HARD
/* Copy the table from your Very Easy Challenge. Write a query to add in three cars at once
 Write query to add in prices and colors for each of these cars Write a query to put the Make and 
 Model together in one column Create  new query that adds an additional column to the results to the results 
 to show how many cars have teh same Make. */
CREATE TABLE cars
(
    id INT NOT NULL
    AUTO_INCREMENT PRIMARY KEY,
car_make VARCHAR
    (90),
car_model VARCHAR
    (90),
car_year INT
);

    INSERT INTO cars
        (car_make, car_model, car_year)
    VALUES
        ("Toyota", "Camry", 2020),
        ("Dodge", "Challenger", 2020),
        ("Jeep", "Chereoke", 2020);

    INSERT INTO cars
        (car_make, car_model, car_year)
    VALUES
        ("Volkwagen", "Toureg", 2018),
        ("Audi", "Premium", 2017),
        ("Lamborghini", "Urus", 2020);

    ALTER TABLE cars
ADD price INT
    ,
    ADD color VARCHAR
    (50);

UPDATE cars 
    SET price = 34400, color = "Matte Black"
    WHERE id = 1;
    SET price = 30000, color = "Red"
    WHERE id = 2; 
    SET price = 18900, color = "Green"
    WHERE id = 3;
    SET price = 28900, color = "Grey"
    WHERE id = 4;
    SET price = 65000, color = "Orange"
    WHERE id = 5;
    SET price = 200000, color = "Black"
    WHERE id = 6;


SELECT CONCAT(car_make, " ", car_model) AS car_make_and_car_model
FROM cars;

SELECT car_make AS make, COUNT(car_make) AS matches
FROM cars
GROUP BY car_make;