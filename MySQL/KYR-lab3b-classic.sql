USE classicmodels;

# 1
SELECT DISTINCT jobTitle, COUNT(employeeNumber) AS `number` FROM employees
GROUP BY jobTitle;

# 2
SELECT country, COUNT(officeCode) AS `officeNumber` FROM offices
GROUP BY country HAVING `officeNumber` > 1;

# 3
SELECT orderLineNumber, COUNT(orderLineNumber), MIN(quantityOrdered), MAX(quantityOrdered),
AVG(quantityOrdered) FROM orderdetails
GROUP BY orderLineNumber
ORDER BY orderLineNumber, COUNT(orderLineNumber), AVG(quantityOrdered) ASC;

# 4
SELECT productCode, quantityOrdered FROM orderdetails
ORDER BY quantityOrdered DESC LIMIT 5;

# 5
SELECT * FROM orderdetails;
