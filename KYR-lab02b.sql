USE lab2;
SELECT DISTINCT genre FROM artists;
SELECT first_name, last_name FROM artists WHERE first_name LIKE ('%a%');
INSERT INTO artists VALUES
 (NULL, 'Wonpil', 'Kim', 'Korea', 'rock', 'Lead singer of Day6', '1994-04-28',  'M', NOW(), NULL);
SELECT first_name, last_name, country FROM artists WHERE country LIKE 'U._.';
SELECT first_name, last_name, country FROM artists WHERE country NOT LIKE 'U._.';
ALTER TABLE artists ADD alive CHAR(1) DEFAULT 'Y' AFTER birth_date;
UPDATE artists SET alive='N' WHERE first_name IN ('Prince', 'Dolores', 'George');
SELECT CONCAT(first_name, ' ', IFNULL(last_name, "")) AS name,
YEAR(CURDATE())-YEAR(birth_date) AS age
FROM artists
WHERE alive='Y'
ORDER BY age ASC;
# youngest : Wonpil Kim, oldest : Brian May
SELECT * FROM artists
WHERE net_worth_million > (SELECT AVG(net_worth_million) FROM artists)
AND alive='Y'
ORDER BY net_worth_million DESC;