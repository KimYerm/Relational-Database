CREATE DATABASE lab2;
USE lab2;
CREATE TABLE artist
(
	artist_id INT AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    genre VARCHAR(100),
	`description` TEXT,
	birth_date DATE,
    gender ENUM('M','F'),
    date_entered TIMESTAMP,
    net_worth_million FLOAT,
    PRIMARY KEY ( artist_id )
);
INSERT INTO artist VALUES
 (NULL, 'Brian', 'May', 'rock', 'Musician and astrophysicist', '1947-07-19', 'M', NOW(), 210),
 (NULL, 'PJ', 'Harvey', 'alternative', 'A very talented artist', '1969-10-09', 'F', NOW(), 3.5),
 (NULL, 'Prince', NULL, 'pop', 'Singer, songwriter and dancer', '1958-06-07', 'M', NOW(), 300),
 (NULL,'Dolores', 'O`Riordan', 'alternative', 'Lead singer of the Cranberries', '1971-09-06', 'F', NOW(), 25),
 (NULL, 'George', 'Michael', 'pop', 'Lead singer of Wham!', '1963-06-25', 'M', NOW(), 200),
 (NULL, 'Adele', NULL, 'pop', 'A very talented artist', '1988-05-05', 'F', NOW(), 185),
 (NULL, 'Eminem', NULL, 'hip pop', 'Rapper, songwriter and actor', '1972-10-17', 'M', NOW(), 210);
ALTER TABLE artist ADD country VARCHAR(100) DEFAULT 'U.K.' AFTER last_name;
UPDATE artist SET country='U.S.' WHERE first_name IN ('Prince', 'Eminem');
UPDATE artist SET country='Ireland' WHERE first_name='Dolores';
RENAME TABLE artist TO artists;
SELECT first_name, last_name, genre FROM artists WHERE gender='F' AND birth_date >= '1960-01-01';
SELECT first_name, last_name, net_worth_million FROM artists WHERE country != 'U.S' AND birth_date >= '1970-01-01' AND net_worth_million >= 100;
SELECT * FROM artists WHERE `description` LIKE ('%lead singer%');
