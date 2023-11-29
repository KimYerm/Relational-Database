USE classicmodels;

# 1 
SELECT DISTINCT city FROM offices ORDER BY city ASC;

# 2
SELECT customerName, city FROM customers WHERE salesRepEmployeeNumber IS NULL;
# OR
SELECT customerName, city FROM customers WHERE ISNULL(salesRepEmployeeNumber);

# 3 
SELECT * FROM employees WHERE reportsTo = (SELECT employeeNumber FROM employees WHERE firstname = 'Anthony' AND lastName = 'Bow');

# 4 
SELECT customerName, CONCAT(contactFirstName, ' ', contactLastName), country FROM customers
WHERE contactFirstName LIKE ('Je%') OR contactLastName LIKE ('%on');

# 5 
SELECT productCode, productName, productLine FROM products 
WHERE productLine LIKE '%Cars%' AND productName LIKE '%Mercedes%';

# 6 
SELECT * FROM offices;
SELECT COUNT(officeCode) FROM offices WHERE state IS NULL;
# Because they are located in coutries where the concept of a state is not recognized.

# 7
SELECT * FROM orders WHERE `status` = 'cancelled' AND shippedDate IS NOT NULL;
# Because the shipping fees will need to be paid, costs time, money and effort to the company.

# 8 
SELECT paymentDate, FORMAT(amount, 2) AS amount FROM payments
WHERE paymentDate BETWEEN "2003-09-01" AND "2004-03-01"
AND amount < (SELECT AVG(amount)/2 FROM payments)
ORDER BY paymentDate DESC;

# 9
SELECT productCode, quantityOrdered, FORMAT(quantityOrdered * priceEach, 2) AS orderValue FROM orderdetails
WHERE productCode LIKE 'S50_____' AND quantityOrdered > 45 #'S50%'
ORDER BY quantityOrdered DESC, orderValue DESC LIMIT 10;

# 10 
# NULL or a value of an EXISTING primary key.
# It can no longer work as an index when this happens, cannot ditinguish between the records.