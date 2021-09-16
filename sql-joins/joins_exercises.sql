-- owners - first_name, last_name, id
-- vehicles - id, make, model, year, price, owner_id

SELECT * FROM owners
LEFT JOIN vehicles 
ON owners.id = vehicles.owner_id;


SELECT first_name, last_name, COUNT(vehicles.id) FROM owners
JOIN vehicles 
ON owners.id = vehicles.owner_id
GROUP BY owners.id
ORDER BY owners.first_name;


SELECT first_name, last_name, AVG(vehicles.price)::numeric(10, 0) AS average_price, COUNT(vehicles.id) AS count 
FROM owners 
JOIN vehicles ON owners.id = vehicles.owner_id 
GROUP BY owners.id 
HAVING COUNT(vehicles.id) > 1 AND AVG(vehicles.price) > 10000
ORDER BY owners.first_name DESC;


