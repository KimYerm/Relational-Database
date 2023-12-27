use classicmodels;
SELECT * FROM employees;
SELECT amount FROM payments Limit 15;
SELECT checkNumber, paymentDate FROM payments;
INSERT INTO productlines(productLine) VALUES ('Bicycles');
UPDATE customers SET phone='40.67.8500' WHERE customerNumber=119;

SHOW DATABASES;
USE world;
SELECT DATABASE();
SHOW TABLES;
DESCRIBE country;
CREATE TABLE test
(
	col1 INT AUTO_INCREMENT,
    col2 VARCHAR(20),
    col3 FLOAT,
    PRIMARY KEY ( col1 )
);
INSERT INTO test VALUES
 (NULL, 'Yerim', 24),
 (NULL, 'Minwook', 21);
DROP TABLE IF EXISTS test;
SHOW TABLES;
