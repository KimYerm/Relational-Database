USE classicmodels;

# 1 
SELECT c.customerName, p.paymentDate, p.amount 
FROM payments p
JOIN customers c
ON p.customerNumber = c.customerNumber;
# ORDER BY c.customerName;

# 2 
SELECT c.country, COUNT(p.checkNumber) AS Payments
FROM customers c
JOIN payments p
ON c.customerNumber = p.customerNumber
GROUP BY c.country
ORDER BY c.country ASC;

SELECT c.country, COUNT(p.customerNumber) AS Payments
FROM customers c, payments p
WHERE c.customerNumber = p.customerNumber
GROUP BY country
ORDER BY country ASC;

# 3
SELECT c.customerName, c.phone, MAX(p.paymentDate) AS LastPaymentDate
FROM customers c
JOIN payments p
ON c.customerNumber = p.customerNumber
GROUP BY c.customerName, c.phone
ORDER BY customerName;

SELECT c.customerName, c.phone, MAX(p.paymentDate) AS LastPaymentDate
FROM customers c, payments p
WHERE c.customerNumber = p.customerNumber
GROUP BY c.customerName;

# 4
SELECT c.customerName, c.country, o.orderNumber, o.orderDate
FROM customers c
JOIN orders o
ON c.customerNumber = o.customerNumber;
# ORDER BY customerName, country;

SELECT c.customerName, c.country, o.orderNumber, o.orderDate
FROM customers c, orders o
WHERE c.customerNumber = o.customerNumber;

# 5 
SELECT c.customerName, c.country, o.orderNumber, o.orderDate
FROM customers c
LEFT OUTER JOIN orders o
ON c.customerNumber = o.customerNumber;
# ORDER BY customerName, country;
# More rows were returned (350 vs 326). This is because ALL the customers were returned regardless of wheter they have any orders or not.
# Customers with no orders have NULLs for their orderNumber and orderDate.

# 6
SELECT c.customerName, c.country, o.orderNumber, o.orderDate
FROM orders o
LEFT OUTER JOIN customers c
ON c.customerNumber = o.customerNumber;
# No, there were less rows, this is because we are performing a left join between orders and customers so ALL orders were returned (3326 of them).
# It seems that all orders are tied to customers as confirmed by the same results produced by the inner join in Q4.

# 7
SELECT o.customerNumber, od.orderNumber, p.productName
FROM orders o
JOIN orderdetails od
ON o.orderNumber = od.orderNumber
JOIN products p
ON od.productCode = p.productCode;

# 8 
SELECT o.customerNumber, c.customerName, CONCAT_WS(' ', e.firstName, e.lastName) AS salesRepName, e.employeeNumber, COUNT(o.customerNumber) AS OrderCount 
FROM orders o
JOIN customers c
ON o.customerNumber = c.customerNumber
JOIN employees e
ON e.employeeNumber = c.salesRepEmployeeNumber
GROUP BY o.customerNumber
HAVING OrderCount > 4;
# ORDER BY OrderCount;

# 9 
SELECT CONCAT(e1.firstName, ' ', e1.lastName) AS ManagerName, CONCAT(e.firstName, ' ', e.lastName) AS EmployeeName FROM employees e
JOIN employees e1
ON e.reportsTo = e1.employeeNumber
ORDER BY e1.lastName;
