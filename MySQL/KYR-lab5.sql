USE classicmodels;

# 1 괄호 없어도 됨
SELECT customerName, country FROM customers WHERE country LIKE ('%land');

# 2 
SELECT country, COUNT(customerNumber) FROM customers
WHERE country LIKE '%land'
GROUP BY country;

# 3
SELECT customerName, city, country FROM customers WHERE salesRepEmployeeNumber IS NULL;

# 4
SELECT employeeNumber, lastName, firstName FROM employees
WHERE officeCode = (SELECT officeCode FROM offices WHERE city = 'Paris');

# 5
SELECT productCode, productName FROM products
WHERE productCode NOT IN (SELECT DISTINCT productCode FROM orderdetails);

# 6 
SELECT paymentDate, COUNT(*) AS totalPayments FROM payments GROUP BY paymentDate ORDER BY totalPayments;

# 7 
SELECT p.customerNumber, c.customerName, SUM(p.amount) AS amountPaid FROM payments p, customers c
WHERE  p.customerNumber = c.customerNumber
GROUP BY customerNumber; # c.customerNumber, c.customerName;
# join 사용시 on절 대신 USING (customerNumber) 써도 됨.

# 8 
SELECT c.customerName, o.customerNumber, COUNT(*) AS total FROM orders o, customers c
WHERE o.customerNumber = c.customerNumber
GROUP BY o.customerNumber
ORDER BY total DESC LIMIT 1;

# 9 
SELECT o.orderNumber, o.status, SUM(od.quantityOrdered * od.priceEach) AS totalValue FROM orders o, orderdetails od
WHERE o.orderNumber = od.orderNumber AND o.`status` = 'On Hold'
GROUP BY o.orderNumber, o.status;

# 10
SELECT od.productCode, p.productName FROM orders o, orderdetails od, products p
WHERE o.orderNumber = od.orderNumber AND od.productCode = p.productCode AND DAYNAME(o.orderDate) = 'Saturday';

# 11
CREATE OR REPLACE VIEW order_value_view AS
SELECT orderNumber, customerName, SUM(quantityOrdered * priceEach) FROM orderdetails
JOIN orders USING (orderNumber)
JOIN customers USING (customerNumber)
GROUP BY orderNumber;

# 12
UPDATE order_value_view
SET customerName = 'Hanji Gifts& Co'
WHERE customerName = 'Handji Gifts& Co';
# NO. Because therer is a grouping and an aggregation.
