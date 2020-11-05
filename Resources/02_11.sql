SELECT city, city_id
FROM city
WHERE city IN ('Qalyub', 'Qinhuangdao', 'Qomsheh', 'Quilmes');

SELECT district
FROM address
WHERE city_id IN
(
	SELECT city_id
	FROM city
	WHERE city IN ('Qalyub', 'Qinhuangdao', 'Qomsheh', 'Quilmes'));
	
--Bonus
SELECT first_name, last_name
FROM customer
WHERE address_id IN
(
	SELECT address_id
	FROM address 
	WHERE city_id IN
(
	SELECT city_id
	FROM city
	WHERE city LIKE 'Q%'
	)
);

-- OR

SELECT 
	customer.first_name,
	customer.last_name
FROM 
	address
	JOIN
	customer
	ON address.address_id = customer.address_id
WHERE
	city_id IN (SELECT city_id FROM city WHERE city LIKE 'Q%');