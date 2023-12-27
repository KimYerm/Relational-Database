USE sakila;

# 1
SELECT COUNT(*) FROM actor WHERE last_name LIKE ('%SON%');

# 2
SELECT SUM(ISNULL(address2)) FROM address;

# 3
SELECT COUNT(DISTINCT original_language_id) FROM film;
# It means that all values are null.

# 4
SELECT * FROM film WHERE title LIKE ('%LOVE%')
ORDER BY LENGTH(title) DESC LIMIT 1;
# It is a film with film_id of 852. Its title is 'STRANGELOVE DESIRE',
# and its description is that 'A Awe-Inspiring Panorama of a Lumberjack And a Waitress who must Defeat a Crocodile in An Abandoned Amusement Park'.

# 5
SELECT COUNT(*) FROM film WHERE `description` LIKE ('%Robot%');

# 6
SELECT SUM(amount) FROM payment WHERE staff_id = 1;

# 7
SELECT COUNT(DISTINCT film_id) FROM inventory;

# 8
SELECT store_id, COUNT(DISTINCT film_id) FROM inventory GROUP BY store_id;

# 9
SELECT store_id, COUNT(film_id) FROM inventory GROUP BY store_id;

# 10
SELECT store_id, film_id, COUNT(film_id) AS film_count FROM inventory
GROUP BY film_id ORDER BY store_id, film_id ASC;
