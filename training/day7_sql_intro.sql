-- TASK-1

SHOW TABLES;

SHOW COLUMNS FROM customer;

-- TASK-2

SELECT * FROM customer;

SELECT first_name, last_name FROM staff;

-- TASK-3

SELECT * FROM customer WHERE active=1;

SELECT * FROM film WHERE release_year > 2005;

SELECT * FROM rental WHERE rental_date BETWEEN '2005-01-01' AND '2005-12-31';

SELECT * FROM film WHERE title LIKE 'A%';

SELECT * FROM film WHERE rating IN ('PG', 'G');

-- TASK-4

SELECT * FROM film 
ORDER BY title DESC;

SELECT title, rental_duration FROM film
GROUP BY title, rental_duration
ORDER BY rental_duration DESC
LIMIT 10;

SELECT first_name, last_name FROM customer
ORDER BY last_name DESC;

-- TASK-5 Basic Aggregations

-- Count number of Customers

SELECT COUNT(*) AS total_customer FROM customer;

-- Average patment amount

SELECT AVG(amount) AS avg_payment FROM payment;

-- Total revenue generated

SELECT SUM(amount) AS total_revenue FROM payment;

-- Revenue by store

SELECT staff_id, SUM(amount) AS total_revenue FROM payment
GROUP BY staff_id;



