SELECT *
FROM customer;

SELECT *
FROM orders;

SELECT *
FROM orders 
JOIN customer --INNER JOIN TABLE BY DEFAULT 	
ON orders.customer_id = customer.customer_id; 

SELECT *
FROM orders --(left circle)
JOIN customer --INNER JOIN TABLE BY DEFAULT 	(right circle)
ON orders.customer_id = customer.customer_id; 

INSERT INTO customer(
	first_name,
	email 
)VALUES(
	'shoha',
	'hshoa@gmai.com'
);

SELECT *
FROM customer AS c --LEFT TABLE (see shoha because he is a customer)
LEFT JOIN orders AS o 
ON c.customer_id = o.customer_id;

SELECT *
FROM customer AS c --RIGHT JOIN TABLE (dont see shoha because he didnt make any purchases, HAS TO HAVE A connection)
RIGHT JOIN orders AS o 
ON c.customer_id = o.customer_id;



