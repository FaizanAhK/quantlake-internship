-- Customers from a specific city with high payments

SELECT city_id, COUNT(*), AVG(amount)
from customer
JOIN address USING(address_id)
JOIN city USING(city_id)
JOIN payment USING(customer_id)
WHERE amount > 5 and city LIKE 'A%'
GROUP BY city_id;

-- Customers who made payments greater than 10

SELECT first_name, last_name 
FROM customer
WHERE customer_id in
(SELECT customer_id FROM payment WHERE amount > 10
);

SELECT USER();

-- Update Example

UPDATE customer SET email = 'test@example.com' WHERE customer_id = 1;
SELECT * FROM customer;

-- Delete Example

DELETE FROM payment WHERE amount = 0;
SELECT * FROM payment;

