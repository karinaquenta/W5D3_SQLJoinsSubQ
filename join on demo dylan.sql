
--Find all staff that lives in Canada

SELECT *
FROM country
WHERE country = 'Canada';

SELECT first_name, last_name, country
FROM country AS co
JOIN city AS c 
ON co.country_id = c.country_id
JOIN address AS a 
ON c.city_id = a.city_id;
JOIN staff 
ON a.address_id = staff.address_id
WHERE country = 'Canada';

-- Find the first and last names of all Cambodian customers who 
-- rented a movie starting with the letters "A" or "G"

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
WHERE title LIKE 'A%' OR title LIKE 'G%'
GROUP BY title, full_name, country
HAVING country = 'Cambodia';











