-- 1. List all customers who live in Texas (use JOINs)

SELECT *
FROM customer 
JOIN address 
ON customer.address_id = address.address_id
WHERE district = 'Texas';

--Answer: 5 customers live in texas

SELECT *
FROM orders --(left circle)
JOIN customer --INNER JOIN TABLE BY DEFAULT 	(right circle)
ON orders.customer_id = customer.customer_id; 

--2. Get all payments above $6.99 with the Customer's Full Name

SELECT amount
FROM payment 
JOIN customer
ON payment.customer_id = customer.customer_id 
WHERE amount > '6.99';

--Answer: 1406 total payments above $6.99

--3. Show all customers names who have made payments over $175(use subqueries)


SELECT first_name, last_name , customer_id 
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment 
	GROUP BY customer_id
	HAVING sum(amount) > 175
); 

--Answer: 5 customers

--4. List all customers that live in Nepal (use the city table)

SELECT title, country, concat(first_name,' ', last_name) AS full_name
FROM country
JOIN city
ON country.country_id = city.country_id
JOIN address AS a 
ON city.city_id = a.city_id 
JOIN customer AS customer 
ON a.address_id = customer.address_id 
JOIN rental
ON customer.customer_id = rental.customer_id 
JOIN inventory AS i 
ON rental.inventory_id = i.inventory_id 
JOIN film AS f 
ON i.film_id = f.film_id 
GROUP BY title, full_name, country
HAVING country = 'Nepal';

--Answer: 21 customers live in Nepal

--5. Which staff member had the most transactions?

SELECT count(staff_id), staff_id 
FROM payment 
GROUP BY staff_id;

--Answer: Mike

--6. How many movies of each rating are there?

SELECT rating, count(rating)
FROM film
GROUP BY rating;

--Answer: 
--PG = 194
--R = 195
--NC=17 = 210
--PG-13 = 223
--G = 178

-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)

SELECT DISTINCT amount,first_name, last_name 
FROM payment 
JOIN customer
ON payment.customer_id = customer.customer_id 
WHERE amount > '6.99';

--Answer: 992 total payments above $6.99 (no dupes)

--8. How many free rentals did our stoures give away?

SELECT amount
FROM payment
WHERE amount = 0.00;

--Answer: 24 free rentals
